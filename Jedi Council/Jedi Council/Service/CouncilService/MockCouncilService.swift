//
//  MockCouncilService.swift
//  Jedi Council
//
//  Created by Teacher on 08.03.2021.
//

import Foundation

class MockCouncilService: CouncilService {
    private lazy var mockMember: CouncilMember = CouncilMember(
        id: "holy-wan",
        name: "Obi-Wan Kenobi",
        rank: .master,
        imageUrl: nil
    )
    private lazy var mockMemberDetails: CouncilMemberDetails = CouncilMemberDetails(
        councilMember: mockMember,
        bio: "The perfect one."
    )

    func loadMembers(completion: @escaping (Result<[CouncilMember], Error>) -> Void) {
        completion(.success(Array(repeating: mockMember, count: 10)))
    }

    func loadMemberDetails(id: String, completion: @escaping (Result<CouncilMemberDetails, Error>) -> Void) {
        completion(.success(mockMemberDetails))
    }
}
