//
//  ViewController.swift
//  Contacts
//
//  Created by Refat E Ferdous on 21/11/23.
//

import UIKit

class User {
    let name : String
    var isFavourite : Bool
    var isMuted : Bool
    
    init (name : String, isFavourite : Bool, isMuted : Bool){
        self.name = name
        self.isFavourite = isFavourite
        self.isMuted = isMuted
        
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    private let table : UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    var users : [User] = [
    "John Smith",
        "John Smith",
        "Dan Smith",
        "Ben Smith",
        "Rob Smith",
        "Amy Smith",
        "John Smith"
    ].compactMap({
        User(name : $0, isFavourite : false, isMuted : false)
    })

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        title = "Swipe Action"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for : indexPath)
        cell.textLabel?.text = user.name
        
        if user.isFavourite{
            cell.backgroundColor = .systemBlue
        }
        else if user.isMuted{
            cell.backgroundColor = .systemOrange
        }
        else{
            cell.backgroundColor = nil
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete"){ _, indexPath in
            self.users.remove(at: indexPath.row)
            self.table.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let user = users[indexPath.row]
        let favouriteActionTitle = user.isFavourite ? "Unfavourite" : "Favourite"
        let muteActionTitle = user.isMuted ? "Unmute" : "Mute"
        
        let favouriteAction = UITableViewRowAction(style: .normal, title: favouriteActionTitle){ _, indexPath in
            self.users[indexPath.row].isFavourite.toggle()
            self.table.reloadRows(at: [indexPath], with: .automatic)
        }
        
        let muteAction = UITableViewRowAction(style: .normal, title:muteActionTitle){ _, indexPath in
            self.users[indexPath.row].isMuted.toggle()
            self.table.reloadRows(at: [indexPath], with: .automatic)
            
        }
        
        favouriteAction.backgroundColor = .systemBlue
        muteAction.backgroundColor = .systemOrange
        
        
        return [muteAction, favouriteAction, deleteAction]
    }
    
    
}


