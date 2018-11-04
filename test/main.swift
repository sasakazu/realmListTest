//
//  main.swift
//  test
//
//  Created by 笹倉 一也 on 2018/11/03.
//  Copyright © 2018年 sasakura.company. All rights reserved.
//

import UIKit
import RealmSwift

class main: UIViewController {

    
    let realm = try! Realm()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
