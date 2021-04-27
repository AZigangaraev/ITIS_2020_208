//
//  CouncilMemberViewController.swift
//  Jedi Council
//
//  Created by Teacher on 08.03.2021.
//

import UIKit

class CouncilMemberViewController: UIViewController {
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var rankLabel: UILabel!
    @IBOutlet private var bioLabel: UILabel!

    var presenter: CouncilMemberPresenter?
    private var member: CouncilMemberDetails?

    func set(member: CouncilMemberDetails) {
        self.member = member

        if isViewLoaded {
            update(with: member)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func update(with member: CouncilMemberDetails) {
        let councilMember = member.councilMember
        imageView.kf.setImage(with: member.councilMember.imageUrl, placeholder: UIImage(named: "No-Image-Placeholder"))
        nameLabel.text = councilMember.name
        rankLabel.text = name(of: councilMember.rank)
        bioLabel.text = member.bio
    }

    private func name(of rank: CouncilMember.Rank) -> String {
        switch rank {
            case .grandmaster:
                return "Jedi Grandmaster"
            case .headOfCouncil:
                return "Jedi Master, Head of Jedi Counci"
            case .master:
                return "Jedi Master"
            case .knight:
                return "Take a seat"
        }
    }
}
