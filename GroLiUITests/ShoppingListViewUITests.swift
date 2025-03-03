//
//  ShoppingListViewUITests.swift
//  GroLiUITests
//
//  Created by Nils Ramsperger on 25.02.25.
//

import XCTest

final class ShoppingListViewUITests: XCTestCase {
    func localized(_ key: String) -> String {
        let uiTestBundle = Bundle(for: type(of: self))
        return NSLocalizedString(key, bundle: uiTestBundle, comment: "")
    }
    
    @MainActor
    func testListShowsItems() throws {
        let app = XCUIApplication()
        app.launch()
        
        let headline = app.staticTexts[localized("ShoppingListHeader")]
        
        // ToDo: The text cannot be found. Fix it.
        XCTAssert(headline.exists)
    }
}
