//
//  Spinner.swift
//  NASA Pic of the Day
//
//  Created by Marwan Al-ani on 1/10/18.
//  Copyright © 2018 Marwan Al-ani. All rights reserved.
//

import Foundation
import UIKit

// Custom extension to simplify the functionality of showing a fullscreen tint & a loading spinner
extension UIViewController {
  class func displaySpinner(onView : UIView) -> UIView {
    let spinnerView = UIView.init(frame: onView.bounds)
    spinnerView.backgroundColor = UIColor.init(red: 0.4, green: 0.4, blue: 0.4, alpha: 0.6)
    let indicator = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
    indicator.startAnimating()
    indicator.center = spinnerView.center
    
    DispatchQueue.main.async {
      spinnerView.addSubview(indicator)
      onView.addSubview(spinnerView)
    }
    
    return spinnerView
  }
  
  class func removeSpinner(spinner :UIView) {
    DispatchQueue.main.async {
      spinner.removeFromSuperview()
    }
  }
}
