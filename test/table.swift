//
//  table.swift
//  test
//
//  Created by 笹倉 一也 on 2018/11/03.
//  Copyright © 2018年 sasakura.company. All rights reserved.
//

import UIKit
import RealmSwift

class table: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
     var carolieItem: Results<Carolie>!


    @IBOutlet weak var tableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do{
            let realm = try Realm()
            
            carolieItem = realm.objects(Carolie.self)
            
            tableview.reloadData()
            
            
        }catch{
            
            
        }

        tableview.delegate = self
        tableview.dataSource = self
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableview.reloadData()
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let realm = try! Realm()
        
        let carolieItem = realm.objects(Carolie.self)
        
         return carolieItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let realm = try! Realm()
        
        let carolieItem = realm.objects(Carolie.self)
        
        let object = carolieItem[indexPath.row]
        
        cell.textLabel?.text = object.name
        
        
        return cell
    }
    


}
