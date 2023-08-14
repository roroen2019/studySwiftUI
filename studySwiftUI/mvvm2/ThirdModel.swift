//
//  ThirdModel.swift
//  studySwiftUI
//
//  Created by 이상준 on 2023/07/26.
//

import Foundation


struct User: Codable {
    let id: Int
    let name: String
    let email: String
    let company: Company
}

struct Company : Codable {
    let name: String
}
