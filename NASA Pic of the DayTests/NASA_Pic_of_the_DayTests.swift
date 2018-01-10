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
    
    override func setUp() {
        super.setUp()
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
    
}
