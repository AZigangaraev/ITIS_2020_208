//
//  CouncilListViewController.swift
//  Jedi Council
//
//  Created by Teacher on 08.03.2021.
//

import UIKit

class CouncilListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private let cellId: String = "Cell"
    @IBOutlet var collectionView: UICollectionView!
    var presenter: CouncilListPresenter?
    private var members: [CouncilMember] = []

    override func viewDidLoad() {
        presenter?.loadData()
    }

    func set(members: [CouncilMember]) {
        self.members = members
        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        members.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? CouncilMemberCell else {
                fatalError("Could not dequeue cell")
        }

        cell.set(member: members[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        guard let presenter = presenter else { return }
        presenter.moveToDetail?(members[indexPath.item].id)
    }
}
