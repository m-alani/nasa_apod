//
//  Helper.swift
//  NASA Pic of the Day
//
//  Created by Marwan Al-ani on 1/9/18.
//  Copyright © 2018 Marwan Al-ani. All rights reserved.
//

import Foundation

func showError(_ errorCode: Int) {
  print(errorCode)
}

func log(_ str: String) {
  if CONFIG.LOGGING_ENABLED {
    print(str)
  }
}
