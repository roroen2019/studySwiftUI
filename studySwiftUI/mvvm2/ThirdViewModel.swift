//
//  ThirdViewModel.swift
//  studySwiftUI
//
//  Created by 이상준 on 2023/07/26.
//

import Foundation
import Combine

final class ThirdViewModel: ObservableObject {
    
    @Published var users: [User] = []
    @Published var hasError = false
    @Published var error: UserError?
    @Published private(set) var isRefreshing = false
    
    private var bag = Set<AnyCancellable>()
    
    func fetchUsers() {
        
        isRefreshing = true
        hasError = false
        
        // 알림뷰는 뷰이므로 메인쓰레드에서동작해야된다.
        // 각 guard문 의 알림뷰를 위해 설정.
        DispatchQueue.main.async {
            let userUrlString = "https://jsonplaceholder.typicode.com/users11asdf"
            guard let url = URL(string: userUrlString) else {
                self.hasError = true
                self.error = .failedUrl
                return
            }
            
            
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                // 에러처리
                guard error == nil else {
                    self?.hasError = true
                    self?.error = .custom(error: error!)
                    return
                }
                // 디코드
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                guard data != nil else { return }
                
                guard let users = try? decoder.decode([User].self, from: data!) else {
                    print("decode error")
                    self?.hasError = true
                    self?.error = .failedToDecode
                    return
                }
                
                // 신호를 주는 변수이므로 뷰에 연관되어있다.
                // 그래서 큐를 메인쓰레드 설정
                DispatchQueue.main.async {
                    self?.users = users
                    self?.isRefreshing = false
                }
                
                
            }.resume()
        }
    }
    
    // combine 적용
    func fetchUserNew() {
        let userUrlString = "https://jsonplaceholder.typicode.com/users222"
        guard let url = URL(string: userUrlString) else {
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .decode(type: [User].self, decoder: JSONDecoder())
            .sink { res in
                
            } receiveValue: { [weak self] users in
                self?.users = users
            }
            .store(in: &bag)
        
    }
    
    
}

extension ThirdViewModel {
    enum UserError: LocalizedError {
        case custom(error: Error)
        case failedToDecode
        case failedUrl
        
        var errorDescription: String? {
            switch self {
            case .failedToDecode:
                return "Failed to decode response"
            case .custom(error: let error):
                return error.localizedDescription
            case .failedUrl:
                return "url Error"
            }
        }
    }
}
