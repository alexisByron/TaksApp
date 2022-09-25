//
//  Tasks.swift
//  TaksApp
//
//  Created by Alexis Moya on 24-09-22.
//

import Foundation
import SwiftUI

final class TasksClass:ObservableObject{
    @Published var Categories:Array<Category> = [
        Category(name: "Tareas Prioritarias", color: .red),
        Category(name: "Trabajo", color: .blue),
        Category(name: "Diario", color: .orange),
        Category(name: "Secundarias", color: .pink)
    ]
    
    @Published var TaksCategoriesList:Array<TasksCategories> = [
        TasksCategories(
            category:Category(name: "Trabajo", color: .blue),
            task: [
                Task(taskDescription: "Ir a buscar Notebook", taskIsDone: true, id:5),
                Task(taskDescription: "Limpiar escritorio", taskIsDone: false,id:6),
                Task(taskDescription: "Acomodar Lámpara", taskIsDone: false,id:7),
            ]
        ),
        TasksCategories(
            category:Category(name: "Diario", color: .orange),
            task: [
                Task(taskDescription: "Sacar la basura", taskIsDone: false, id:0),
                Task(taskDescription: "Lavar la loza", taskIsDone: false,id:1),
            ])
    ]
    
    func AddTask(category:Category, task: Task){
        let existCategoryInDataStorage = TaksCategoriesList.filter { $0.category.name == category.name }
        
        if(existCategoryInDataStorage.count > 0){
            
            let ndx = TaksCategoriesList.firstIndex(of: existCategoryInDataStorage[0])
            
            TaksCategoriesList[ndx ?? 0].task.insert(task, at: 0)
        }else{
            TaksCategoriesList.append(TasksCategories(category: category, task: [task]))
        }
        
    }
    
    func DeleteTask(indexCategory:Int, atOffsets:IndexSet){
        TaksCategoriesList[indexCategory].task.remove(atOffsets: atOffsets)
    }
    
    func TogleDone(indexCategory:Int, indexTask:Int){
        TaksCategoriesList[indexCategory].task[indexTask].taskIsDone.toggle()
    }
}
