//
//  ViewController.swift
//  Contacts
//
//  Created by Refat E Ferdous on 21/11/23.
//

import UIKit

class ViewController: UIViewController {

 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didtapButtonOne(){
        let vc = MyTableViewController()
        vc.models = [
            ("first", {
               print("Something")
            }),
            ("second", {
               print("Something2")
            }),
            ("third", {
               print("Something3")
            }),
            ("fourth", {
               print("Something4")
            }),
            ("fifth", {
               print("Something5")
            }),
            ("sixth", {
               print("Something6")
            }),
            
        ]
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func didtapButtonTwo(){
        let vc = MyTableViewController()
        vc.models = [
            ("BMW", {
               print("Something")
            }),
            ("Corolla", {
               print("Something2")
            }),
            ("Audi", {
               print("Something3")
            }),
            ("Mercedes", {
               print("Something4")
            }),
            ("Prado", {
               print("Something5")
            }),
            ("Premio", {
               print("Something6")
            }),
            
        ]
       
        navigationController?.pushViewController(vc, animated: true)
    }
}


