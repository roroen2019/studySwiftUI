//
//  LifeCycleTest.swift
//  studySwiftUI
//
//  Created by 이상준 on 2023/07/29.
//

import SwiftUI

struct LifeCycleTest: View {
    var body: some View {
        NavigationStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            NavigationLink("두번째 이동", destination: LifeCycleTest2(receiveValue: "10"))
                .onAppear {
                    print("링크 appear")
                }
            
//            NavigationLink {
//                LifeCycleTest2()
//            } label: {
//                Text("다음 이동")
//            }
        }
        .onAppear {
            print("first appear")
        }
        .onDisappear {
            print("first disappear")
        }
        
    }
}

struct LifeCycleTest_Previews: PreviewProvider {
    static var previews: some View {
        LifeCycleTest()
    }
}

//MARK: - 두번째 뷰
struct LifeCycleTest2: View {
    
    var receiveValue: String
    
    var body: some View {
        NavigationStack {
            Text("second, World!\(receiveValue)")
            NavigationLink {
                LifeCycleTest3()
            } label: {
                Text("다음 이동")
            }
        }
        .onAppear {
            print("second appear")
        }
        .onDisappear {
            print("second disappear")
        }
        
    }
}

//MARK: - 두번째 뷰
struct LifeCycleTest3: View {
    
    @State private var datas = [moveDataModel]()
    
    var body: some View {
        NavigationStack {
            Text("Third, World!")
            
        }
        .onAppear {
            print("Third appear")
        }
        .onDisappear {
            print("Third disappear")
        }
        
    }
}


struct moveDataModel {
    let name: String
    let description: String
}

//MARK: - 리스트에서 선택하면 나오는 뷰
struct ClickView: View {
    
    var model: moveDataModel
    
    var body: some View {
        Text("값 확인: \(model.name)")
    }
}

