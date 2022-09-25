//
//  Header.swift
//  TaksApp
//
//  Created by Alexis Moya on 24-09-22.
//

import SwiftUI

struct Header: View {
    let allFontNames = UIFont.familyNames
    
    var body: some View {
        HStack{
            VStack {
                Text("Alexis Moya")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fontWeight(.bold)
                    .font(Font.custom("Mukta Mahee",size: 20))
            }.frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            ZStack{
                Rectangle()
                    .frame(width: 90, height: 90)
                    .cornerRadius(30)
                    .foregroundStyle(.linearGradient(colors: [Color.teal, Color.red], startPoint: .leading, endPoint: .top))
                
                Image("me")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .offset(x: 5, y: -10)
            }
        }.frame(maxHeight: 100)
            .padding(.horizontal)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
