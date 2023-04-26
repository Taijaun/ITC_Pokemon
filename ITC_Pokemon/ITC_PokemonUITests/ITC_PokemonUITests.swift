//
//  ITC_PokemonUITests.swift
//  ITC_PokemonUITests
//
//  Created by Taijaun Pitt on 25/04/2023.
//

import XCTest

final class ITC_PokemonUITests: XCTestCase {

    override func setUpWithError() throws {
        
        continueAfterFailure = false

        
    }

    override func tearDownWithError() throws {
        
    }

    func testExample() throws {
        
        let app = XCUIApplication()
        app.launch()

        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
