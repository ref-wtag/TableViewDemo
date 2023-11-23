//
//  ViewController.swift
//  Contacts
//
//  Created by Refat E Ferdous on 21/11/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    @IBOutlet var table : UITableView!
    var models = [InstragramPost]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(PostTableViewCell.nib(), forCellReuseIdentifier: PostTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        
        models.append(InstragramPost(numberOfLikes: 200, userName: "Refat", userImageName: "img_1", postImageName: "img_1"))
        
        models.append(InstragramPost(numberOfLikes: 205, userName: "Susmoy", userImageName: "img_2", postImageName: "img_2"))
        models.append(InstragramPost(numberOfLikes: 300, userName: "Farhana", userImageName: "img_4", postImageName: "img_4"))
        models.append(InstragramPost(numberOfLikes: 410, userName: "mitu", userImageName: "img_5", postImageName: "img_5"))
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120+140+view.frame.size.width
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

struct InstragramPost{
    let numberOfLikes : Int
    let userName : String
    let userImageName : String
    let postImageName : String
}

