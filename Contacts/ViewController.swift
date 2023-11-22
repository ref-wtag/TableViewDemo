//
//  ViewController.swift
//  Contacts
//
//  Created by Refat E Ferdous on 21/11/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet var table : UITableView!
    @IBOutlet var field : UITextField!
    
    var data = [String]()
    var filteredData = [String]()
    var filtered = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
        table.delegate = self
        table.dataSource = self
        field.delegate = self
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text{
            filterText(text + string)
        }
        
        return true
    }
    
    func filterText(_ query : String){
        
        filteredData.removeAll()
        for string in data {
            if string.lowercased().starts(with: query.lowercased()){
                filteredData.append(string)
            }
        }
        print("\(query)")
        table.reloadData()
        
        filtered = true
    }
    
    func setUpData(){
        data.append("abc")
        data.append("def")
        data.append("ghi")
        data.append("jkl")
        data.append("mno")
        data.append("pqr")
        data.append("str")
        data.append("uvw")
        data.append("wxy")
        data.append("xyz")
        data.append("yzeq")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !filteredData.isEmpty{
            return filteredData.count
        }
        
        return filtered ? 0 : data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if !filteredData.isEmpty{
            cell.textLabel?.text = filteredData[indexPath.row]
        }
        else{
            cell.textLabel?.text = data[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
   
}


