//
//  Presentation.swift
//  TaksApp
//
//  Created by Alexis Moya on 24-09-22.
//

import SwiftUI

struct Presentation: View {
    @State var navigateToHome:Bool = false
    
    var body: some View {
        NavigationView {
            
            ZStack{
                Rectangle()
                    .cornerRadius(30)
                    .foregroundStyle(
                        .linearGradient(
                            colors: [Color.teal, Color.red],
                            startPoint: .leading, endPoint: .top
                        )
                    )
                
                VStack{
                    Spacer()
                    Text("Organizador de tareas")
                        .padding()
                        .fontWeight(.bold)
                        .font(Font.custom("Mukta Mahee",size: 35))
                        .foregroundColor(.white)
                    
                    Image("me")
                        .resizable()
                        .frame(width: 300, height: 300)
                    
                    Spacer()
                    
                    Button {
                        navigateToHome.toggle()
                    } label: {
                        HStack {
                            Text("Agregar Tarea")
                                .fontWeight(.bold)
                                .font(Font.custom("Mukta Mahee",size: 20))
                            Image(systemName: "paperplane.fill")
                        }.padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.white, lineWidth: 2)
                            )
                            .foregroundColor(.white)
                    }
                    Spacer()
                    
                    NavigationLink(
                        destination: Home(),
                        isActive: $navigateToHome,
                        label: {
                            EmptyView()
                        }
                    )
                }
                
                
            }.ignoresSafeArea()
            
           
        }
    }
}

struct Presentation_Previews: PreviewProvider {
    static var previews: some View {
        Presentation()
    }
}
