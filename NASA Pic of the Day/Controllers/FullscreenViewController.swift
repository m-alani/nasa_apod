//
//  FullscreenViewController.swift
//  NASA Pic of the Day
//
//  Created by Marwan Al-ani on 1/10/18.
//  Copyright © 2018 Marwan Al-ani. All rights reserved.
//

import UIKit

class FullscreenViewController: UIViewController {

  var image: UIImage?
  
  @IBOutlet weak var imageContent: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Check if we received an image from the segue
    guard let image = image else { self.dismiss(animated: true, completion: nil); return }
    imageContent.image = image
    
    // UIImageView has no actions, so we need to assign a gesture recognizer to mimic the functionality
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
    imageContent.isUserInteractionEnabled = true
    imageContent.addGestureRecognizer(tapGestureRecognizer)
    
  }

  // Handle a tap on the image
  @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
  {
    self.dismiss(animated: true, completion: nil)
  }
  
  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
}
