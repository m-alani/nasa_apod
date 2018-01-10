//
//  Helper.swift
//  NASA Pic of the Day
//
//  Created by Marwan Al-ani on 1/9/18.
//  Copyright © 2018 Marwan Al-ani. All rights reserved.
//

import Foundation
import UIKit

func showError(_ errorCode: Int) {
  // Get the root view controller of the app so we can push an alert view with the error on top
  guard let view = UIApplication.shared.keyWindow?.rootViewController else { return }
  let alertController = UIAlertController(title: CONFIG.ERROR.DEFAULT_TITLE,
    message: "\(CONFIG.ERROR.DEFAULT_MSG)\nError code: \(errorCode)", preferredStyle: .alert)
  let defaultAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
    exit(0)
  }

  alertController.addAction(defaultAction)
  view.present(alertController, animated: true, completion: nil)
  
  print(errorCode)
}

// Custom function for logging (wasn't used on this submission)
func log(_ str: String) {
  if CONFIG.LOGGING_ENABLED {
    print(str)
  }
}
