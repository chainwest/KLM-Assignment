//
//  MainCoordinator.swift
//  Transactions
//
//  Created by Евгений Урбановский on 4/23/23.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    
    func start()
}

final class MainCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private var window: UIWindow?
    private var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    // MARK: - Init
    
    init(
        window: UIWindow?,
        navigationController: UINavigationController
    ) {
        self.window = window
        self.navigationController = navigationController
        setupNavigationController()
    }
    
    // MARK: - Internal methods
    
    func start() {
        guard let window else { return }
        
        let coordinator = JobsListCoordinator(navigationController)
        coordinator.delegate = self
        coordinator.start()
        childCoordinators.append(coordinator)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func showDetails(with element: JobDTO) {
        let coordinator = JobDetailsCoordinator(navigationController, element: element)
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    // MARK: - Private methods
    
    private func setupNavigationController() {
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.backgroundColor = .white
        navigationController.navigationBar.barTintColor = .white
        navigationController.navigationBar.isTranslucent = true
    }
}

extension MainCoordinator: JobsListCoordinatorDelegate {
    func jobsListCoordinator(_ coordinator: JobsListCoordinator, didSelectElement element: JobDTO) {
        showDetails(with: element)
    }
}
