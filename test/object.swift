//
//  object.swift
//  test
//
//  Created by 笹倉 一也 on 2018/11/03.
//  Copyright © 2018年 sasakura.company. All rights reserved.
//

import Foundation
import RealmSwift



class Diary: Object {
    @objc dynamic var name = ""
    @objc dynamic var date = ""
    
    let today = List<Carolie>()
    
    
    
}


class Carolie: Object {
    
    
    @objc dynamic var name = ""
    @objc dynamic var number = 0
    



}
