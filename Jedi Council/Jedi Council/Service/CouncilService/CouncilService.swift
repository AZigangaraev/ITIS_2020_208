//
//  CouncilService.swift
//  Jedi Council
//
//  Created by Teacher on 08.03.2021.
//

import Foundation

protocol CouncilService {
    func loadMembers(completion: @escaping (Result<[CouncilMember], Error>) -> Void)
    func loadMemberDetails(id: String, completion: @escaping (Result<CouncilMemberDetails, Error>) -> Void)
}
