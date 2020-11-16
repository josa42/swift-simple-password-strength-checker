@testable import SimplePasswordChecker
import XCTest

class PasswordStrengthTests: XCTestCase  {
  func testOfPassword() {
    XCTAssertEqual(PasswordStrength.of(password: ""), .none, "Empty password has no strength")
    
    // Low
    XCTAssertEqual(PasswordStrength.of(password: "a"), .low, "Single lower case character")
    XCTAssertEqual(PasswordStrength.of(password: "A"), .low, "Single upper case character")
    XCTAssertEqual(PasswordStrength.of(password: "1"), .low, "Single numberic character")
    XCTAssertEqual(PasswordStrength.of(password: "?"), .low, "Single special character")
    
    // Low - 2 matching rules
    XCTAssertEqual(PasswordStrength.of(password: "aA"), .low, "Upper and lower case character")
    XCTAssertEqual(PasswordStrength.of(password: "a1"), .low, "Lower case and numeric character")
    XCTAssertEqual(PasswordStrength.of(password: "abababab"), .low, "8 lower case characters")
    
    // Medium - 3 matching rules
    XCTAssertEqual(PasswordStrength.of(password: "aA1"), .medium, "Numberic, upper and lower case character")
    XCTAssertEqual(PasswordStrength.of(password: "aA?"), .medium, "Special, upper and lower case character")
    XCTAssertEqual(PasswordStrength.of(password: "abababa?"), .medium, "Special and 7 lower case characters")
    
    // Medium - 4 matching rules
    XCTAssertEqual(PasswordStrength.of(password: "aA1?"), .medium, "4 characters containing lower case, upper case, numeric, and special character")
    XCTAssertEqual(PasswordStrength.of(password: "aBaBaBa?"), .medium, "4 characters containing lower case, upper case, and special character")
    
    // High
    XCTAssertEqual(PasswordStrength.of(password: "aBaBaB1?"), .high, "8 characters containing lower case, upper case, numeric, and special characters")
    XCTAssertEqual(PasswordStrength.of(password: "aBaBaBaBaBaBaBa1"), .high, "16 characters containing lower case, upper case and numeric characters")
  }
}
