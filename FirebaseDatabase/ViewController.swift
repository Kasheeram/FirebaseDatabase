//
//  ViewController.swift
//  
//
//  Created by Apogee on 6/21/17.
//
//

import UIKit
import Firebase

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref: DatabaseReference?
    
    var user = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource=self
        tableView.delegate=self
        
        ref = Database.database().reference()
        fetchUsers()
        tableView.reloadData()

        // Do any additional setup after loading the view.
    }
    
    func fetchUsers(){
        ref?.child("Posts").observe(.childAdded, with: {(snapshot) in
            let dictionary = snapshot.value as! [String:Any]
            //print(dictionary.count)
            self.user.append(dictionary)
            print(dictionary)
            self.tableView.reloadData()
            
        }, withCancel: nil)
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ViewTableViewCell
        
        let cell:ViewTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)as! ViewTableViewCell
        
                cell.nameLabel.text = user[indexPath.row]["name"] as? String
        cell.emailLabel.text = user[indexPath.row]["email"] as? String
        

        
        // cell.emailLabel.text = "kashee"
        
        
        return cell
    }

}
