//
//  CouncilMememberPresenter.swift
//  Jedi Council
//
//  Created by Никита Ляпустин on 09.03.2021.
//

import UIKit

class CouncilMemberPresenter {
    private let councilService: CouncilService?
    private weak var view: CouncilMemberViewController?
    private var member: CouncilMember?
    var coordinator: CouncilFlowCoordinator?
    var memberId: String?

    func loadData() {
        guard let memberId = memberId else {
            return
        }
        councilService?.loadMemberDetails(id: memberId) { (result) in
            switch result {
            case .success(let result):
                self.view?.set(member: result)
            case .failure(let err):
                print(err)
            }
        }
    }

    func viewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller: CouncilMemberViewController = storyboard.instantiateViewController(identifier: "CouncilMemberViewController")
        loadData()
        controller.presenter = self
        view = controller
        return controller
    }

    init(councilService: CouncilService) {
        self.councilService = councilService
    }
}
