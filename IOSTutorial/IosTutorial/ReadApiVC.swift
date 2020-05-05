//
//  ReadApiVC.swift
//  IosTutorial
//
//  Created by Developer Iakta on 04/05/2020.
//  Copyright © 2020 Developer Iakta. All rights reserved.
//

import Foundation

import UIKit

struct User: Decodable {
    let name: String
    let phone: String
    let username: String
    let id: Int
    let email: String
}


class ReadApiVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contacts.count
    }
    
    @IBOutlet weak var pageLabel: UILabel!
    
    @IBOutlet weak var usersTable: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
//        pageLabel.text = A
        cell.textLabel?.numberOfLines = 2
        cell.textLabel?.text = contacts[indexPath.row].name + "\n " + contacts[indexPath.row].phone
               
        return cell
    }
    


//    let contact: Contact
    var contacts = [User]()
    
    
    override func viewWillAppear(_ animated: Bool) {
                   super.viewWillAppear(animated)
                 self.usersTable.reloadData()
                   print("LOADEDDD!!!!")
         //          contact = db.read()
               }
             
    
    let cellReuseIdentifier = "cell"
    
      override func viewDidLoad() {
              super.viewDidLoad()
              // Do any additional setup after loading the view.
              usersTable.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
              usersTable.delegate = self
              usersTable.dataSource = self
              // Handle the text field’s user input through delegate callbacks.
              fetchUsers()
        
          }
          
          override func didReceiveMemoryWarning() {
              super.didReceiveMemoryWarning()
              // Despose of any resources that can be recreated.
          }

        
    func fetchUsers(){
//        var i : Int = 0;
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
          
            
            
        }
     
//
//
//            if let error = error {
//                print("Error")
//                return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse,
//                (200...299).contains(httpResponse.statusCode) else{
//                    print("ERRORR")
//                    return
//            }
//
//            if let data = data{
//                print("hey")
//                let decoder = JSONDecoder()
//                if let json = try? decoder.decode(_ , from: data){
////                    completion(json)
//                    print(json)
//                }
//            } else {
////                completion(nil)
//                print("EEEERRRROOOORRRR")
//                return
//            }
//            print(String(data: data!,encoding: .utf8)!)
//            do{
//                let jsonResult = try JSONSerialization.jsonObject(with: data!, options: []) as! NSArray
//                print(jsonResult[0])
//                for object in jsonResult{
//                    if let dict = object as? [String: Any]{
////                        self.contacts?[i].id = dict["id"] as! Int
////                        self.contacts?[i].name = dict["name"] as! String
////                        self.contacts?[i].surname = dict["username"] as! String
////                        self.contacts?[i].number = dict["number"] as! String
//                        i += 1
//                        print(dict["email"] as Any)
//                    }
//
//                }
//
//            }catch{
//                    print("NOOOO")
//                }
//
//                let contacts = try? JSONDecoder().decode(ContactModel.self, from: data){
//            completionHandler(contacts.results ?? [])
//            }
//        }
//        }.resume()
        
//    }


}

}

