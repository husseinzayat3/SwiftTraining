//
//  ViewController.swift
//  IosTutorial
//
//  Created by Hussein Zayat on 30/04/2020.
//  Copyright © 2020 Hussein Zayat. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contact.count
    }
    
   
    
    
    let preferences = UserDefaults.standard
    
    var db: DbHelper = DbHelper()
    var contact:[Contact] = []
    let cellReuseIdentifier = "cell"
    
    
    
    
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        contact = db.read()
          let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!
        cell.textLabel?.numberOfLines = 2
        cell.textLabel?.text = contact[indexPath.row].name + " " + contact[indexPath.row].surname + "\n " + contact[indexPath.row].number
               
        return cell
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ContactsList.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        ContactsList.delegate = self
        ContactsList.dataSource = self
        
        
        contact = db.read()
        
        

        // Do any additional setup after loading the view.
//        let numberKey = "phoneNumber"
//             if preferences.object(forKey: numberKey) == nil {
//                 print("NOT LOADED")
//             } else {
//                 let number = preferences.object(forKey: numberKey)
//                 print("DONEEE!!!!!!!!")
//                print(number!)
//             }
//
//        let nameKey = "name"
//        if preferences.object(forKey: nameKey) == nil {
//                 print("NOT LOADED")
//             } else {
//                 let name = preferences.object(forKey: nameKey)
//                 print("DONEEE!!!!!!!!")
//            print(name!)
//             }
//
//        let surnameKey = "surname"
//        if preferences.object(forKey: surnameKey) == nil {
//                 print("NOT LOADED")
//             } else {
//                 let surname = preferences.object(forKey: surnameKey)
//                 print("DONEEE!!!!!!!!")
//            print(surname!)
//             }
        
        
        
        
        
//        // Handle the text field’s user input through delegate callbacks.
//        nameTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Despose of any resources that can be recreated.
    }
    
//    // MARK: UITextFieldDelegate
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        // Hide the Keyboard
//        textField.resignFirstResponder()
//        return true
//    }
////
//    func textFieldDidEndEditing(_ textField: UITextField) {
//
//        nameLabel.text = nameTextField.text
//    }
//    
    @IBAction func AddContact(_ sender: UIButton) {
   let vc = self.storyboard?.instantiateViewController(identifier: "AddContactViewControllerID") as! AddContactVC
          
//          self.present(vc, animated: true , completion: nil)
//
        self.navigationController?.pushViewController(vc, animated: true)
//        contact = db.read();
//        print(contact)
//
    }
    
    @IBAction func ReadApi(_ sender: UIButton) {
    let vc = self.storyboard?.instantiateViewController(identifier: "ReadApiViewControllerID") as! ReadApiVC
    
    self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
        self.ContactsList.reloadData()
          print("LOADEDDD!!!!")
//          contact = db.read()
      }
  
    @IBOutlet weak var ContactsList: UITableView!
    
    
}

