//
//  AddContactVC.swift
//  IosTutorial
//
//  Created by Hussein Zayat on 30/04/2020.
//  Copyright © 2020 HusseinZayat. All rights reserved.
//

import Foundation

import UIKit

class AddContactVC: UIViewController {
    let preferences = UserDefaults.standard

    //MARK: Properties
  
    @IBOutlet weak var ContactDetailsLabel: UILabel!
    @IBOutlet weak var PhoneNumberLabel: UILabel!
    @IBOutlet weak var SurnameLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var NameTextView: UITextField!
    
    @IBOutlet weak var SurnameTextView: UITextField!
    
    @IBOutlet weak var PhoneNumberTextView: UITextField!
  
    var db: DbHelper = DbHelper()
    var contact:[Contact] = []
    
    override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.
          
          // Handle the text field’s user input through delegate callbacks.
//          nameTextField.delegate = self
      }
      
      override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
          // Despose of any resources that can be recreated.
      }

    
    
    // MARK: ACTIONS
  
    @IBAction func SaveContact(_ sender: UIButton) {
        // when we use present to navigate between view controllers, We use dismiss to go back
               // TODO: Save into shared prefernces the new values
//               self.dismiss(animated: true, completion: nil)
//
//        let nameKey = "name"
//        let surnameKey = "surname"
//        let numberKey = "phoneNumber"
        let NumContactsKey = "numContacts"
//        let currentLevel = ...
        let id: Int = (preferences.integer(forKey: NumContactsKey));
        
        db.insert(id: id, name: NameTextView.text ?? " ", surname: SurnameTextView.text ?? " ", number: PhoneNumberTextView.text ?? " ")
        print(db.read())
        
        
        preferences.set(id + 1, forKey: NumContactsKey)
//        preferences.setValue(NameTextView.text, forKey:nameKey)
//
//        preferences.set(SurnameTextView.text, forKey: surnameKey)
//        preferences.set(PhoneNumberTextView.text, forKey: numberKey)
        //  Save to disk
        let didSave = preferences.synchronize()

        if !didSave {
            //  Couldn't save (I've never seen this happen in real world testing)
            print("------->  ERRORRR SAVING TO SHARED PREFERENCES")
        }
//        let vc = self.storyboard?.instantiateViewController(identifier: "AddContactViewControllerID") as! AddContactVC

//        self.present(vc, animated: true , completion: nil)

        self.navigationController?.popViewController(animated: true)
        
    }
}
