//
//  NASA_Pic_of_the_DayTests.swift
//  NASA Pic of the DayTests
//
//  Created by Marwan Al-ani on 1/9/18.
//  Copyright © 2018 Marwan Al-ani. All rights reserved.
//

import XCTest
@testable import NASA_Pic_of_the_Day

class NASA_Pic_of_the_DayTests: XCTestCase {
  
  var viewController: ViewController!
  
  override func setUp() {
    super.setUp()
    
    // Instantiate the main view controller and load it up
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    viewController = storyBoard.instantiateInitialViewController() as! ViewController
    let _ = viewController.view // Nifty trick to invoke viewDidLoad, and keep things in memory
  }
  
  override func tearDown() {
      super.tearDown()
  }

  // Sample test case to demonstrate async unit testing
  func testNasaServerUp() {
    let expectation = XCTestExpectation(description: "Hit NASA's Endpoint with no API key")
    
    let url = URL(string: "https://api.nasa.gov/planetary/apod")!
    let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
      // Make sure we received something
      XCTAssertNotNil(data, "No data was received")
      
      // Fulfill the expectation (endpoint is up)
      expectation.fulfill()
    }
    dataTask.resume()
    wait(for: [expectation], timeout: CONFIG.TESTS_TIMEOUT)
  }
  
  // Sample test case using a loaded view controller
  func testMainViewLoadEvent() {
    XCTAssert(viewController.pictureObject == nil , "Image object should be nil before any network calls happen")
  }
    
}
