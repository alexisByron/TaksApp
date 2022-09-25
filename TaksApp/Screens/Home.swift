//
//  Home.swift
//  TaksApp
//
//  Created by Alexis Moya on 03-09-22.
//

import SwiftUI

struct Home: View  {
    @StateObject var GlobalVariablesObj: GlobalVariables = GlobalVariables()
    @StateObject var TasksObj: TasksClass = TasksClass()
    
    var body: some View {
        VStack{
            
            Header()
            
            TaksList()
              
            AddTaskButton()
        }.ignoresSafeArea(.all, edges: .bottom)
            .background(.gray.opacity(0.1))
            .environmentObject(GlobalVariablesObj)
            .environmentObject(TasksObj)
            .blur(radius: GlobalVariablesObj.showSheetAddTask ? 10 : 0)
            .navigationBarTitle("")
            .navigationBarHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
