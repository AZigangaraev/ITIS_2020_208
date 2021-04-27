//
//  CouncilServiceTests.swift
//  CouncilServiceTests
//
//  Created by Teacher on 27.04.2021.
//

import XCTest
@testable import Jedi_Council

class CouncilServiceTests: XCTestCase {
    var councilService: CouncilService!

    override func setUpWithError() throws {
        councilService = RestCouncilService()
    }

    override func tearDownWithError() throws {
    }

    func testLoadMembers() {
        let loadingExpectation = expectation(description: "Failed to load memebers")
        councilService.loadMembers { result in
            switch result {
                case .success(let members):
                    XCTAssertFalse(members.isEmpty)
                case .failure(let error):
                    XCTFail("Failed with error: \(error)")
            }
            loadingExpectation.fulfill()
        }
        wait(for: [ loadingExpectation ], timeout: 20)
    }

    private let testMemberId = "yoda"

    func testLoadMemberDetails() {
        let loadingExpectation = expectation(description: "Failed to load member details")
        councilService.loadMemberDetails(id: testMemberId) { result in
            switch result {
                case .success(let member):
                    XCTAssertFalse(member.bio.isEmpty)
                    XCTAssert(member.councilMember.id == self.testMemberId)
                case .failure(let error):
                    XCTFail("Failed with error: \(error)")
            }
            loadingExpectation.fulfill()
        }
        wait(for: [ loadingExpectation ], timeout: 20)
    }

    private let failingMemberId = "yaddle"

    func testLoadMemberDetailsFails() {
        let loadingExpectation = expectation(description: "Failed to load member details")
        councilService.loadMemberDetails(id: failingMemberId) { result in
            switch result {
                case .success:
                    XCTFail("Object should not exist")
                case .failure:
                    break
            }
            loadingExpectation.fulfill()
        }
        wait(for: [ loadingExpectation ], timeout: 20)
    }
}
