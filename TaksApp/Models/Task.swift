//
//  Taks.swift
//  TaksApp
//
//  Created by Alexis Moya on 24-09-22.
//

import Foundation

struct Task: Hashable, Identifiable{
    var taskDescription:String
    var taskIsDone:Bool
    var id:Int
}
