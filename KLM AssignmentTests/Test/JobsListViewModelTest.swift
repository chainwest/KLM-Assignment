//
//  JobsListViewModelTest.swift
//  KLM AssignmentTests
//
//  Created by Евгений Урбановский on 5/7/23.
//

import XCTest
@testable import KLM_Assignment

final class JobsListViewModelTests: XCTestCase {
    var viewModel: JobsListViewModel!
    var mockJobsFacade: MockJobsFacade!
    
    override func setUp() {
        super.setUp()
        mockJobsFacade = MockJobsFacade()
        viewModel = JobsListViewModel(jobsFacade: mockJobsFacade)
    }
    
    override func tearDown() {
        viewModel = nil
        mockJobsFacade = nil
        super.tearDown()
    }
    
    func testViewModelInitialization_FetchJobsCalled() {
        XCTAssertTrue(
            mockJobsFacade.fetchJobsCalled,
            "fetchJobs() should be called when the view model is initialized"
        )
    }

    func testFetchJobs_Success_UpdatesDataSource() {
        let job = JobDTO(
            id: UUID(),
            companyName: "Company",
            title: "Job Title",
            description: "Job Description",
            remote: true,
            url: "https://example.com",
            location: "Remote",
            createdAt: 1234567890
        )
        mockJobsFacade.completionResult = .success([job])

        let expectation = XCTestExpectation(
            description: "onUpdate should be called when dataSource is updated"
        )

        viewModel.onUpdate = { jobs in
            XCTAssertEqual(jobs, [job], "dataSource should be updated with the fetched jobs")
            expectation.fulfill()
        }
        
        viewModel.fetchJobs()

        wait(for: [expectation], timeout: 1.0)
    }

    func testFetchJobs_Failure_CallsOnError() {
        mockJobsFacade.completionResult = .failure(JobsFacadeError.failed)

        let expectation = XCTestExpectation(
            description: "onError should be called when fetchJobs() returns a failure"
        )

        viewModel.onError = { expectation.fulfill() }
        viewModel.fetchJobs()

        wait(for: [expectation], timeout: 1.0)
    }

}
