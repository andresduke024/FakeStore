//
//  GlobalSettingsProviderImplTests.swift
//  FakeStoreTests
//
//  Created by Andres Duque on 13/06/24.
//

import XCTest
@testable import FakeStore
final class GlobalSettingsProviderImplTests: XCTestCase {

    private var sut: GlobalSettingsProviderImpl!
    
    override func setUpWithError() throws {
       try super.setUpWithError()
        
        sut = GlobalSettingsProviderImpl()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }

    func testGetData() {
        let result = sut.data
        
        XCTAssert(result.count > 0)
    }
}
