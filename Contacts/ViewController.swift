//
//  ViewController.swift
//  Contacts
//
//  Created by Refat E Ferdous on 21/11/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(FieldTableViewCell.nib(),forCellReuseIdentifier:FieldTableViewCell.identifier)
        table.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        
        if indexPath.row > 5{
            let customCell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
            customCell.configure(with: "Custom Cell", imageName: "gear")
            return customCell
        }
        
        if indexPath.row > 2{
            let fieldCell = tableView.dequeueReusableCell(withIdentifier: FieldTableViewCell.identifier, for: indexPath) as! FieldTableViewCell
            return fieldCell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "hello world"
        
        let mySwitch = UISwitch()
        mySwitch.addTarget(self, action: #selector(didChangeSwitch(_ :)), for: .valueChanged)
        mySwitch.isOn = true
        cell.accessoryView = mySwitch
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    @objc func didChangeSwitch(_ sender : UISwitch){
        if sender.isOn{
            print("User turned it on")
        }
        else{
            print("its now off")
        }
    }
}


