//
//  CustomListCell.swift
//  studySwiftUI
//
//  Created by 이상준 on 2023/07/26.
//

import SwiftUI

struct CustomListCell: View {
    
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("**Name**: \(user.name)")
            Text("**Email**: \(user.email)")
            Divider()
            Text("**Company**: \(user.company.name)")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        .padding(.horizontal, 4)
    }
}

struct CustomListCell_Previews: PreviewProvider {
    static var previews: some View {
        CustomListCell(user: .init(id: 0,
                                   name: "name",
                                   email: "email",
                                   company: .init(name: "company")))
    }
}
