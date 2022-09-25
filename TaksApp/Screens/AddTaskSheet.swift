//
//  AddTaskSheet.swift
//  TaksApp
//
//  Created by Alexis Moya on 24-09-22.
//

import SwiftUI

struct AddTaskSheet: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var GlobalVariablesObj:GlobalVariables
    @EnvironmentObject var TasksObj: TasksClass
    
    @State var TaskToAdd:String = ""
    
    @State var categorySelected:Category =  Category(name: "Tareas Prioritarias", color: .red)
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        ZStack{
            categorySelected.color.opacity(0.2)
            
            VStack{
                HStack{
                    Text("Menu Agregar Tarea")
                        //.font(.title2)
                        .font(Font.custom("Mukta Mahee",size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(categorySelected.color)
                    Spacer()
                    Image(systemName: "x.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding()
                        .foregroundColor(categorySelected.color)
                        .onTapGesture {
                            dismiss()
                            GlobalVariablesObj.showSheetAddTask.toggle()
                        }
                }.frame(maxWidth:.infinity, alignment: .trailing).padding()
                
                HStack{
                    Text("Categoria:")
                        .padding(.horizontal)
                        .fontWeight(.bold)
                        .foregroundColor(categorySelected.color)
                        .font(Font.custom("Mukta Mahee",size: 20))
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                    
                    Menu {
                        Picker(selection: $categorySelected) {
                            ForEach(TasksObj.Categories, id:\.self) { category in
                                Text("\(category.name)")
                                    .tag(category)
                                    .font(.largeTitle)
                            }
                        } label: {}
                    } label: {
                        HStack{
                            Text(categorySelected.name)
                                .foregroundColor(categorySelected.color)
                                .font(Font.custom("Mukta Mahee",size: 20))
                                
                            Image(systemName: "chevron.down").foregroundColor(categorySelected.color)
                        }.padding().overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(categorySelected.color, lineWidth: 2)
                        )
                    } .frame(maxWidth:.infinity,alignment: .leading)
                    
                    
                }.frame(maxWidth:.infinity,alignment: .leading)
                
                ZStack{
                    TextField("", text: $TaskToAdd)
                        .font(Font.custom("Mukta Mahee",size: 20))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding()
                    
                    if(TaskToAdd.isEmpty){
                        Text("Tarea...")
                            .font(Font.custom("Mukta Mahee",size: 20))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading).padding()
                            .foregroundColor(.white)
                    }
                }.frame(height: 80).background(categorySelected.color).cornerRadius(20).padding()
                
                Spacer()
                
                Button(action: {
                    let newTask: Task = Task(
                        taskDescription: TaskToAdd,
                        taskIsDone: false,
                        id: Int.random(in: 1..<300)
                    )
                    
                    TasksObj.AddTask(category: categorySelected, task: newTask)
                    
                    dismiss()
                    GlobalVariablesObj.showSheetAddTask.toggle()
                    TaskToAdd = ""
                }, label: {
                    HStack {
                        Text("Agregar Tarea").fontWeight(.bold).font(Font.custom("Mukta Mahee",size: 20))
                        Image(systemName: "paperplane.fill")
                    }.padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(categorySelected.color, lineWidth: 2)
                        )
                        .foregroundColor(categorySelected.color)
                })
                
                Spacer()
            }
        }.ignoresSafeArea()
    }
}


struct AddTaskSheet_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskSheet()
    }
}
