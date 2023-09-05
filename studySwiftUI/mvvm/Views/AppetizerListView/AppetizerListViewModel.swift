//
//  AppetizerListViewModel.swift
//  studySwiftUI
//
//  Created by 이상준 on 2023/09/05.
//

import Foundation

final class AppetizerListViewModel: ObservableObject {
    
    
    @Published var appetizers: [Appetizer] = []
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
    
    
    func getAppetizers() {
        self.isLoading = true
        
        NetworkManager.shared.getAppetizers { [self] result in
            DispatchQueue.main.async {
                // 여기 동작하면 로딩뷰를 종료한다
                self.isLoading = false
                
                switch result {
                case .success(let value):
                    self.appetizers = value
                    
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    }
                }
            }
        }
    }
    
}
