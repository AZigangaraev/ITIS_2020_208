//
//  CouncilListPresenter.swift
//  Jedi Council
//
//  Created by Никита Ляпустин on 09.03.2021.
//

import UIKit

class CouncilListPresenter {
    private let councilService: CouncilService?
    private weak var view: CouncilListViewController?
    private var members: [CouncilMember] = []
    var coordinator: CouncilFlowCoordinator?
    var moveToDetail: ((String) -> Void)?
    var navigationController: UINavigationController?

    func loadData() {
        councilService?.loadMembers { result in
            switch result {
            case .success(let result):
                self.view?.set(members: result)
            case .failure(let err):
                print(err)
            }
        }
    }

    func start(in navigationController: UINavigationController) {
        navigationController.pushViewController(viewController(), animated: true)
    }

    func viewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller: CouncilListViewController = storyboard.instantiateViewController(identifier: "CouncilListViewController")
        controller.presenter = self
        view = controller
        navigationController?.pushViewController(controller, animated: true)
        return controller
    }

    init(councilService: CouncilService) {
        self.councilService = councilService
    }
}
