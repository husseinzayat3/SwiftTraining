//
//  UserDetailsVC.swift
//  IosTutorial
//
//  Created by Developer Iakta on 05/05/2020.
//  Copyright © 2020 Developer Iakta. All rights reserved.
//

import Foundation
import UIKit


struct Details: Decodable {
    let name: String?
    let phone: String?
    let username: String?
    let email: String?
}




class UserDetailsVC: UIViewController {
    
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var apiName: UILabel!
    
    @IBOutlet weak var apiEmail: UILabel!
    @IBOutlet weak var apiPhone: UILabel!
    
    var id: Int = 0
   
    var user : Details?
    override func viewDidLoad() {
                 super.viewDidLoad()
//               pageLabel.text = "Users DATA"
                 // Do any additional setup after loading the view.
                 // Handle the text field’s user input through delegate callbacks.
//                 fetchUsers()
       
        if let url = URL(string: "https://jsonplaceholder.typicode.com/users/\(id)"){
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do{
                self.user = try JSONDecoder().decode(Details.self, from: data!)
                DispatchQueue.main.async {
                    self.username.text = self.user?.username
                    self.apiName.text = self.user?.name
                    self.apiPhone.text = self.user?.phone
                    self.apiEmail.text = self.user?.email
                }
            }catch{
                print("ERROR \(error)")
            }
            }.resume()

        
         }
        
    }
    /*
     if let url = URL(string: "https://jsonplaceholder.typicode.com/users"){
           URLSession.shared.dataTask(with: url) {(data, response, error) in
               do{
                   self.contacts = try JSONDecoder().decode([User].self, from: data!)
                   print(self.contacts)
                   for contact in self.contacts{
                       print(contact.name)
                       print(contact.username)
                       DispatchQueue.main.async {
                           self.usersTable.reloadData()
                       }
                   }
               }catch{
                   print("ERROR \(error)")
               }
               }.resume()
     */
}
