//
//  studyUnitTest.swift
//  studySwiftUITests
//
//  Created by 이상준 on 2023/09/13.
//
/*
 참고: https://www.youtube.com/watch?v=opkU2UuPk0A&t=649
 */
import XCTest
@testable import studySwiftUI

final class studyUnitTest: XCTestCase {

    func testStudyUnit() {
        let enterValue = 100.00
        let tipValue = 20.00
        let calculate = TestUnit()
        
        // 계산
        let tip = calculate.calculateTip(enter: enterValue, tip: tipValue)
        
        // 확인, 계산값과 우측의 값이 같은지 확인한다
        XCTAssertEqual(tip, 20)
        
        
    }

}
