//
//  TestView.swift
//  studySwiftUI
//
//  Created by 이상준 on 2023/08/18.
//
/*
 참고: https://www.youtube.com/watch?v=FwGMU_Grnf8
 */
import SwiftUI

struct TestView: View {
    
    @StateObject private var viewModel = AppetizerListViewModel()
    
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers, id: \.id) { appetizer in
                    AppetizerCell(appetizer: appetizer)
                }
                .navigationTitle("Appetizer")
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
    
    
    
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

struct TestUnit {
    func calculateTip(enter: Double, tip: Double) -> Double? {
        guard enter >= 0, tip >= 0 else {
            return nil
        }
        
        let tipPercent = tip / 100
        
        return enter * tipPercent
        
    }
}
