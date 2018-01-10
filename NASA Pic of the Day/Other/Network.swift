//
//  Network.swift
//  NASA Pic of the Day
//
//  Created by Marwan Al-ani on 1/9/18.
//  Copyright © 2018 Marwan Al-ani. All rights reserved.
//

import Foundation
import UIKit

func getImageDetails(from url: URL, callback cb: @escaping (ApodResponse) -> Void) {
  URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) -> Void in
    // Check for errors
    guard error == nil else { showError(1); return }
    
    // Check for correct status code
    let res: HTTPURLResponse? = response as? HTTPURLResponse
    guard res != nil && (res!.statusCode == 200 || res!.statusCode == 202) else { showError(2); return }
    
    // Check for non-empty payload
    guard let data = data else { showError(3); return }
    
    // Parse the payload
    do {
      let decoder = JSONDecoder()
      let payload = try decoder.decode(ApodResponse.self, from: data)
      cb(payload)
    } catch {
      showError(4);
    }
  }).resume()
}

func handleResponse(_ input: ApodResponse) {
  // Check for usable URL
  guard let url = URL(string: input.url) else { showError(5); return }
  
  // Call the function to fetch the image
  getImage(from: url, meta: input, callback: postPictureObject(_:_:))
}

func getImage(from url: URL, meta apodResponse: ApodResponse, callback cb: @escaping (UIImage, ApodResponse) -> Void) {
  URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) -> Void in
    // Check for errors
    guard error == nil else { showError(1); return }
    
    // Check for correct status code
    let res: HTTPURLResponse? = response as? HTTPURLResponse
    guard res != nil && (res!.statusCode == 200 || res!.statusCode == 202) else { showError(2); return }
    
    // Check for non-empty payload
    guard let data = data else { showError(3); return }
    
    // Parse the payload
    guard let image = UIImage(data: data) else { showError(4); return }
    
    cb(image, apodResponse)
  }).resume()
}

func postPictureObject(_ image: UIImage, _ nasaResponse: ApodResponse) {
  let object = PicOfTheDay(title: nasaResponse.title, image: image)
}
