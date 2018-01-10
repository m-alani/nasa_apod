//
//  ViewController.swift
//  NASA Pic of the Day
//
//  Created by Marwan Al-ani on 1/9/18.
//  Copyright © 2018 Marwan Al-ani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var imageContent: UIImageView!
  @IBOutlet weak var imageTitle: UILabel!
  
  
  var pictureObject: PicOfTheDay?
  var spinnerView: UIView?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Add an observer
    let name = Notification.Name(rawValue: CONFIG.NOTIFICATION_KEYS.UPDATE_PIC_OBJECT)
    NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateView(_:)), name: name, object: nil)
    
    // Display loading spinner
    spinnerView = UIViewController.displaySpinner(onView: self.view)
    
    // Start the network chain calls
    let urlString = CONFIG.NASA.PROTOCOL + "://" +
      CONFIG.NASA.DOMAIN + "/" +
      CONFIG.NASA.PATH + "/" +
      CONFIG.NASA.ENDPOINT + "?" +
      "api_key=\(CONFIG.NASA.API_KEY)"
    let url = URL(string: urlString)
    if let url = url {
      getImageDetails(from: url, callback: handleResponse(_:))
    } else {
      showError(6)
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // Update image & title
  @objc func updateView(_ notification: Notification) {
    // Get the sent object
    let sentObject = notification.object as! PicOfTheDay
    
    // Set the picture object
    pictureObject = sentObject
    
    // Update the view
    DispatchQueue.main.async {
      self.imageTitle.text = self.pictureObject!.title
      self.imageContent.image = self.pictureObject!.image
    }
    // Stop the loading animation
    if let spinner = self.spinnerView {
      UIViewController.removeSpinner(spinner: spinner)
    }
  }
  
  // Clean up the observer we set up
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
}

