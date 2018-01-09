//
//  NASA Response.swift
//  NASA Pic of the Day
//
//  Created by Marwan Al-ani on 1/9/18.
//  Copyright © 2018 Marwan Al-ani. All rights reserved.
//

import Foundation

struct ApodResponse : Decodable {
  var title: String
  var url: String
}
