//
//  AddTaskButton.swift
//  TaksApp
//
//  Created by Alexis Moya on 24-09-22.
//

import SwiftUI

struct AddTaskButton: View {
    @State private var showingSheet = false
    @EnvironmentObject var GlobalVariablesObj:GlobalVariables
    
    var body: some View {
        HStack{
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .padding()
                .foregroundColor(.white)
                .onTapGesture {
                    GlobalVariablesObj.showSheetAddTask.toggle()
                    //TODO: replace
                    showingSheet = GlobalVariablesObj.showSheetAddTask
                }
                .sheet(isPresented: $showingSheet) {
                    AddTaskSheet().presentationDetents([.height(500)])
                }
                
            
        }.frame(maxWidth: .infinity, maxHeight: 80).background(.red).cornerRadius(20)
    }
}

struct AddTaskButton_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskButton()
    }
}
