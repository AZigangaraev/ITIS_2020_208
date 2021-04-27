//
//  ServiceFactorySecondImplementation.swift
//  Jedi Council
//
//  Created by Никита Ляпустин on 09.03.2021.
//

import Foundation

class ServiceFactorySecondImplementation: ServiceFactory {
    func makeCouncilService() -> CouncilService {
        RestCouncilService()
    }
}
