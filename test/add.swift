//
//  add.swift
//  test
//
//  Created by 笹倉 一也 on 2018/11/03.
//  Copyright © 2018年 sasakura.company. All rights reserved.
//

import UIKit
import RealmSwift

class add: UIViewController {
    
    var testText:Int = 0
    
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var numberTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func doneBtn(_ sender: Any) {
        
        
        
        let now = Diary(value: ["name": "today", "date": "20181103"])
        
        do {
            let realm = try Realm()
            try! realm.write {
                realm.add(now) //モデルオブジェクトの追加
                print("1回目成功だよ", now)
            }
        } catch {
            print("エラーだよ")
        }
        
        let newCarolie = Carolie()
        
        testText = Int(numberTF.text!)!
        
        newCarolie.name = nameTF.text!
        newCarolie.number = testText
        
        /*
         1対多を追加
         */
        do {
            let realm = try Realm()
            try! realm.write {
                now.today.append(newCarolie) //1対多の関連を追加
                print("追加後person.cats: \(now.today)") //catが含まれていることを確認
            }
        } catch {
        }
    
        
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    

}
