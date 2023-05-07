//
//  JobsFacadeMock.swift
//  KLM AssignmentTests
//
//  Created by Евгений Урбановский on 5/7/23.
//

import RealmSwift
@testable import KLM_Assignment

final class MockJobsFacade: JobsFacade {
    var fetchJobsCalled = false
    var completionResult: Result<[JobDTO], JobsFacadeError>?
    
    func fetchJobs(completion: @escaping ((Result<[JobDTO], JobsFacadeError>) -> Void)) {
        fetchJobsCalled = true
        if let result = completionResult {
            completion(result)
        }
    }
}
