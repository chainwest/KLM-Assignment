//
//  JobsListCoordinator.swift
//  KLM Assignment
//
//  Created by Евгений Урбановский on 5/2/23.
//

import UIKit

protocol JobsListCoordinatorDelegate: AnyObject {
    func jobsListCoordinator(_ coordinator: JobsListCoordinator, didSelectElement element: JobDTO)
}

final class JobsListCoordinator: Coordinator {
    // MARK: - Properties
    
    weak var delegate: JobsListCoordinatorDelegate?
    
    var navigationController: UINavigationController

    // MARK: - Init
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Internal methods
    
    func start() {
        let viewModel = JobsListViewModel()
        let vc = JobsListViewController(viewModel: viewModel)
        vc.delegate = self
        navigationController.setViewControllers([vc], animated: false)
    }
}

// MARK: - JobsListViewControllerDelegate

extension JobsListCoordinator: JobsListViewControllerDelegate {
    func jobsListViewController(_ viewController: JobsListViewController, didSelectElement element: JobDTO) {
        delegate?.jobsListCoordinator(self, didSelectElement: element)
    }
}
