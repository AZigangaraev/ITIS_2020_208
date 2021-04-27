//
//  CouncilFlowCoordinator.swift
//  Jedi Council
//
//  Created by Teacher on 08.03.2021.
//

import UIKit

class CouncilFlowCoordinator {
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    private let navigationController: UINavigationController?
    private let factory: ServiceFactory?

    func startViewController() -> UIViewController {
        guard let service = factory?.makeCouncilService() else { return UIViewController() }
        let presenter = CouncilListPresenter(councilService: service)
        presenter.coordinator = self
        presenter.moveToDetail = { id in
            self.showDetailViewController(withId: id)
        }
        guard let navigationController = navigationController else { return UIViewController() }
        navigationController.viewControllers = [presenter.viewController()]
        return navigationController
    }

    func showDetailViewController(withId memberId: String) {
        guard let service = factory?.makeCouncilService() else { return }
        let presenter = CouncilMemberPresenter(councilService: service)
        presenter.coordinator = self
        presenter.memberId = memberId
        navigationController?.pushViewController(presenter.viewController(), animated: true)
    }

    init(navigationController: UINavigationController, factory: ServiceFactory) {
        self.factory = factory
        self.navigationController = navigationController
    }
}
