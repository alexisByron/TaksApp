//
//  TaksList.swift
//  TaksApp
//
//  Created by Alexis Moya on 24-09-22.
//

import SwiftUI

struct TaksList: View {
    @EnvironmentObject var TasksObj:TasksClass
    
    var body: some View {
        List {
            ForEach(Array(TasksObj.TaksCategoriesList.enumerated()), id: \.element){indexCategory, taskCategory in
                if(taskCategory.task.count > 0){
                    Section(
                        header:
                            Text("\(taskCategory.category.name)")
                            .fontWeight(.bold)
                            .font(Font.custom("Mukta Mahee",size: 25))
                            .foregroundColor(taskCategory.category.color)
                    ) {
                        ForEach(Array(taskCategory.task.enumerated()), id: \.element) { index, task in
                            HStack{
                                Image(systemName: task.taskIsDone ? "checkmark.circle.fill" : "circle")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(taskCategory.category.color)
                                
                                Text(task.taskDescription)
                                    .strikethrough(task.taskIsDone, color: taskCategory.category.color)
                                    .font(Font.custom("Mukta Mahee",size: 18))
                                    .fontWeight(task.taskIsDone ? .bold : .regular)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Spacer()
                            }.frame(maxWidth: .infinity)
                                .onTapGesture {
                                    TasksObj.TogleDone(indexCategory: indexCategory, indexTask: index)
                                }
                        }.onDelete { (atOffsets) in
                            TasksObj.DeleteTask(indexCategory: indexCategory, atOffsets: atOffsets)
                        }
                    }
                }
             
                
            }
        }.listStyle(.sidebar)
    }
}

struct TaksList_Previews: PreviewProvider {
    static var previews: some View {
        TaksList()
    }
}
