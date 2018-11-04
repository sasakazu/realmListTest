//
//  table.swift
//  test
//
//  Created by 笹倉 一也 on 2018/11/03.
//  Copyright © 2018年 sasakura.company. All rights reserved.
//

import UIKit
import RealmSwift
import JBDatePicker

class table: UIViewController,UITableViewDelegate, UITableViewDataSource, JBDatePickerViewDelegate {
    
     var carolieItem: Results<Carolie>!
     var date: String!



    @IBOutlet weak var datePicker: JBDatePickerView!
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
        
        datePicker.delegate = self
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableview.reloadData()
    
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        datePicker.updateLayout()
    }
    
    lazy var dateFormatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        return formatter
    }()
    
    
    
    
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
    

    func didSelectDay(_ dayView: JBDatePickerDayView) {
        print("date selected: \(dateFormatter.string(from: dayView.date!))")
         date = dateFormatter.string(from: dayView.date!) //追加
        
        
        
    }
    
    
    
   
    @IBAction func buttonTapped(_ sender: Any) {
        
         self.performSegue(withIdentifier: "toDiary", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toDiary") {
            let diaryView = segue.destination as! DiaryViewController
            diaryView.date = self.date
        }
    }
    
    
}
