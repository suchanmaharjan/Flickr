//
//  DateConverterTest.swift
//  FlickrTests
//
//  Created by SUCHAN MAHARJAN on 25/09/2024.
//

import XCTest
@testable import Flickr

final class DateConverterTest: XCTestCase {

    func testValidCSTDateConversion() {
        let dateString = "2024-09-27T12:06:31Z"
        
        let result = AppDateUtils.formattedDate(from: dateString)

        //testing in CST Timezone//
        let expectedCSTResult = "27 Sep 2024 at 07:06"
        
        XCTAssertEqual(result, expectedCSTResult)
    }
    
    func testInvalidDateFormatConversion() {
        let dateString = "2024-09-27Q12:06:31Z"
        
        let result = AppDateUtils.formattedDate(from: dateString)
        
        let expectedResult = "2024-09-27Q12:06:31Z"
        
        XCTAssertEqual(result, expectedResult)
    }

}
