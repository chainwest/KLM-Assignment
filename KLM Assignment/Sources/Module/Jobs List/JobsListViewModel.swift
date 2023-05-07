//
//  JobsListViewModel.swift
//  KLM Assignment
//
//  Created by Евгений Урбановский on 5/2/23.
//

import Foundation

final class JobsListViewModel {
    // MARK: - Properties

    private let jobsFacade: JobsFacade
    
    private(set) var dataSource = [JobDTO]() {
        didSet {
            onUpdate?(dataSource)
        }
    }
    
    var onUpdate: (([JobDTO]) -> Void)?
    var onError: (() -> Void)?
    
    // MARK: - Init

    init(jobsFacade: JobsFacade = JobsFacadeImpl()) {
        self.jobsFacade = jobsFacade
        self.fetchJobs()
    }
    
    // MARK: - Internal methods

    func fetchJobs() {
        jobsFacade.fetchJobs { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let success):
                self.dataSource = success
            case .failure:
                self.onError?()
            }
        }
    }
}
