//
//  SettingsViewModelTests.swift
//  MVVMGoodWeatherTests
//
//  Created by Ali Elkoca on 7.02.2021.
//

import XCTest
@testable import MVVMGoodWeather

class SettingsViewModelTests: XCTestCase {
    
    private var settingsVM: SettingsViewModel!
    
    override func setUp() {
        super.setUp()
        self.settingsVM = SettingsViewModel()
    }
    
    func test_should_return_display_name_for_fahrenheit(){
        XCTAssertEqual(self.settingsVM.selectedUnit.displayName, "Celsuis")
    }

    func test_should_make_sure_that_default_selected_unit_is_fahrenheit(){

        XCTAssertEqual(settingsVM.selectedUnit, .celsius)
    }
    
    func test_should_be_able_to_save_user_unit_selection() {
        self.settingsVM.selectedUnit = .celsius
        let userDefaults = UserDefaults.standard
        XCTAssertNotNil(userDefaults.value(forKey: "unit"))
    }
    
    override func tearDown() {
        super.tearDown()
        let userDefaults = UserDefaults.standard
        userDefaults.value(forKey: "unit")
    }
    
    /*override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }*/

}
