//
//  ThirdView.swift
//  studySwiftUI
//
//  Created by 이상준 on 2023/07/26.
//
/*
 출처: https://www.youtube.com/watch?v=r3O90QGKv98
 swiftui, mvvm, combine 따라하기
 */


import SwiftUI

struct ThirdView: View {
    
    @StateObject private var viewModel = ThirdViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                
                if viewModel.isRefreshing {
                    ProgressView()
                }else{
                    List {
                        ForEach(viewModel.users, id: \.id) { user in
                            CustomListCell(user: user)
                                .listRowSeparator(.hidden)
                        }
                        
                    }
                    .listStyle(.plain)
                    .navigationTitle("Users")
                    
                }
                
            }.onAppear(perform: viewModel.fetchUserNew)
            .alert(isPresented: $viewModel.hasError,
                   error: viewModel.error) {
                
                Button(action: viewModel.fetchUsers) {
                    Text("재시작")
                }
            }
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
