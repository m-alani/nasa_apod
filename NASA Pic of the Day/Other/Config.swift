//
//  Config.swift
//  NASA Pic of the Day
//
//  Created by Marwan Al-ani on 1/9/18.
//  Copyright © 2018 Marwan Al-ani. All rights reserved.
//

import Foundation

struct CONFIG {
  struct NASA {
    static let PROTOCOL = "https"
    static let DOMAIN = "api.nasa.gov"
    static let PATH = "planetary"
    static let ENDPOINT = "apod"
    static let API_KEY = "NNKOjkoul8n1CH18TWA9gwngW1s1SmjESPjNoUFo"
  }
  
  struct NOTIFICATION_KEYS {
    static let UPDATE_PIC_OBJECT = "ca.alani.mainViewController.updateImage"
  }
  
  struct ERROR {
    static let DEFAULT_MSG = "Something went wrong! Please launch the app again :("
    static let DEFAULT_TITLE = "Ops!"
  }
  
  static let LOGGING_ENABLED = false
  static let ANIMATION_DURATION = 0.35 // in seconds
  static let TESTS_TIMEOUT = 10.0 // in seconds
}

