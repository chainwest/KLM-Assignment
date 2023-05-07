//
//  JobDetailsCoordinator.swift
//  KLM Assignment
//
//  Created by Евгений Урбановский on 5/3/23.
//

import UIKit

final class JobDetailsCoordinator: Coordinator {
    // MARK: - Properties
    
    var navigationController: UINavigationController
    
    private let element: JobDTO

    // MARK: - Init
    
    init(_ navigationController: UINavigationController, element: JobDTO) {
        self.navigationController = navigationController
        self.element = element
    }

    // MARK: - Internal methods
    
    func start() {
        let viewModel = JobDetailsViewModel(element: element)
        let vc = JobDetailsViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
}

