//
//  ContentView.swift
//  studySwiftUI
//
//  Created by 이상준 on 2023/07/23.
//
/*
 ios academy swiftui 강좌 따라하기
 https://www.youtube.com/watch?v=fHtF7BQLlAU&list=PL5PR3UyfTWvfgx9W8WJ9orQf6N1tx0oxN
 우측의 프리뷰에서는 네비게이션 뷰가 중첩되서 보여지게 되는데, 실행시켜서 확인하면 중첩은 안된다.
 */
import SwiftUI

struct testModel {
    var name: String
    var number: Int
}

struct ContentView: View {
    
    private var cvModel: testModel!
    
    var body: some View {
        NavigationView {
            ScreenView(title: "Home",
                       text: "FirstScreen",
                       imageName: "house")
            
        }
        .onAppear{
            print("onAppear")
        }
        .onDisappear{
            print("ondisAppear")
        }
        
    }
    
}



struct ScreenView: View {
    
    let title:String
    let text:String
    let imageName:String
    
    @State private var alertIsPresented = false
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.accentColor)
                .padding()
            
            Text(text)
                .font(.system(size: 30, weight: .light, design: .default))
                .padding()
            
//            Button {
//                // 동작
//                self.alertIsPresented = true
//
//            } label: {
//                // 버튼 설정
//                ContinueButton(buttonColor: .brown, title: "Show Alert!")
//            }
//            .alert(isPresented: $alertIsPresented) {
//                Alert(title: Text("알림 성공"))
//            }

            
            
            NavigationLink {
//                SecondScreenview()
//                SecondView()
            } label: {
                ContinueButton(buttonColor: .accentColor, title: "Show Alert!")
            }

            
        }
        .navigationTitle(title)
    }
}



struct SecondScreenview: View {
    
    private var cvModel: testModel!
    
    var body: some View {
        ScreenView(title: "SecondView",
                   text: "SecondScreen",
                   imageName: "bell")
        
    }
    
}


struct ContinueButton: View {
    
    let buttonColor:Color
    let title:String
    
    var body: some View {
        Text(title)
            .frame(width: 200, height: 50)
            .background {
                buttonColor
            }
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
