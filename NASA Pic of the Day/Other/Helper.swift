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
  guard let view = UIApplication.shared.keyWindow?.rootViewController else { return }
  let alertController = UIAlertController(title: "Ops!", message: "Something went wrong! Please launch the app again :(\nError code: \(errorCode)", preferredStyle: .alert)
  let defaultAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
    exit(0)
  }

  alertController.addAction(defaultAction)
  view.present(alertController, animated: true, completion: nil)
  
  print(errorCode)
}

func log(_ str: String) {
  if CONFIG.LOGGING_ENABLED {
    print(str)
  }
}
