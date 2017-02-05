//
//  Password.swift
//  mrgency
//
//  Created by Josa Gesell on 31/01/17.
//  Copyright © 2017 Josa Gesell. All rights reserved.
//

import Foundation

enum PasswordStrength {
case none, low, medium, high
  
  static func of(password: String) -> PasswordStrength {
    
    let scere = scereOf(password: password)
    
    
    switch(scere) {
    case 0: return .none
    case 1...2: return .low
    case 3...4: return .medium
    default: return .high
    }
  }
  
  static func scereOf(password: String) -> Int {
    var score = 0
    
    // At least one lowercase letter
    if test(password, matches: "[a-züöäß]") {
      score += 1
    }
    
    // At least one uppercase
    if test(password, matches: "[A-ZÜÖÄß]") {
      score += 1
    }
    
    // At least one number
    if test(password, matches: "[0-9]") {
      score += 1
    }
    
    // At least one special character
    if test(password, matches: "[^A-Za-z0-9üöäÜÖÄß]") {
      score += 1
    }
    
    // A length of at least 8 characters
    if password.characters.count >= 16 {
      score += 2
    
    } else if password.characters.count >= 8 {
      score += 1
    }
    
    return score
  }
  
  static func test(_ password: String, matches: String) -> Bool {
    return password.range(of: matches, options: .regularExpression) != nil
  }
}