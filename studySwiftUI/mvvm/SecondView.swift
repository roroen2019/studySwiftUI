//
//  SecondView.swift
//  studySwiftUI
//
//  Created by 이상준 on 2023/07/24.
//

import SwiftUI

struct SecondView: View {
    
    @ObservedObject var viewModel: ToDoList = ToDoList()
    
    var body: some View {
        NavigationView {
            VStack{
                List(viewModel.items) { item in
                    Text(item.action)
                }
            }
            .navigationTitle("To Do List") //타이틀
            .toolbar {
                Button {
                    //동작
                    print("동작")
                    //뷰모델에 데이터 추가하기
                    self.viewModel.items = [
                        ToDoListItem(action: "go Running"),
                        ToDoListItem(action: "get milk"),
                        ToDoListItem(action: "do work"),
                        ToDoListItem(action: "upload")
                    ]
                } label: {
                    //버튼속성 설정하기
                    Text("Refresh")
                }
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
