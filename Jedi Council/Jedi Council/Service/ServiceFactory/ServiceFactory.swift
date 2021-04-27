//
//  Factory.swift
//  Jedi Council
//
//  Created by Никита Ляпустин on 09.03.2021.
//

import Foundation

protocol ServiceFactory {
    func makeCouncilService() -> CouncilService
}
