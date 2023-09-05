//
//  TestModel.swift
//  studySwiftUI
//
//  Created by 이상준 on 2023/09/05.
//

import Foundation

struct Appetizer: Identifiable, Decodable  {
    let id: Int
    let name: String
    let price: Double
    let imageURL: String
    let description: String
    let calories: Int
    let carbs: Int
    let protein: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

// 초기화, 데이터 이동용 구조체
struct MockData {
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let sampleAppetizer = Appetizer(id: 0000002,
                                           name: "Blackened Shrimp",
                                           price: 6.99,
                                           imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/blackened-shrimp.jpg",
                                           description: "Seasoned shrimp from the depths of the Atlantic Ocean.",
                                           calories: 450,
                                           carbs: 3,
                                           protein: 4)
}
