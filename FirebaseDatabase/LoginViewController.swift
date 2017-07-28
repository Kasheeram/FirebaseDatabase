//
//  LoginViewController.swift
//  FirebaseDatabase
//
//  Created by Apogee on 6/20/17.
//  Copyright © 2017 Apogee. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var ref: DatabaseReference?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()

        
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        let name = self.name.text
        let email = self.email.text
        let post:[String:Any] = ["name": name,"email":email]
        ref?.child("Posts").childByAutoId().setValue(post)
        
        self.name.text = ""
        self.email.text = ""
        self.password.text = ""
        
    }
    
    
    @IBAction func checkUsersButtonTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name:"Main",bundle: nil)
        let vcOBJ = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        navigationController?.pushViewController(vcOBJ, animated: true)
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
