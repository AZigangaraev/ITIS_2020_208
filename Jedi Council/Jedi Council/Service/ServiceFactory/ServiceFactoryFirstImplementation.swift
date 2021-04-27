//
//  ServiceFactoryFirstImplementation.swift
//  Jedi Council
//
//  Created by Никита Ляпустин on 09.03.2021.
//

import Foundation

class ServiceFactoryFirstImplementation: ServiceFactory {
    func makeCouncilService() -> CouncilService {
        MockCouncilService()
    }
}
