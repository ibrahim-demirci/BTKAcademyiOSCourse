//
//  FeedViewController.swift
//  PhotoShareAppFirebase
//
//  Created by İbrahim Demirci on 3.12.2021.
//

import UIKit
import Firebase
import SDWebImage


class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var urlArray = [String]()
    var emailArray = [String]()
    var commentArray = [String]()
     
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for : indexPath) as! FeedCell
        cell.emailLabel.text = emailArray[indexPath.row]
        cell.commentLabel.text = commentArray[indexPath.row]
        cell.imageView?.sd_setImage(with: URL(string: self.urlArray[indexPath.row]))
        //cell.imageView?.image = UIImage(named: "white")
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        getFirestoreDatas()
        
    }
    
    func getFirestoreDatas(){
        let db = Firestore.firestore()
        
        db.collection("Post").addSnapshotListener { snapshot, error in
            if error != nil{
                print(error?.localizedDescription ?? "Error when adding listener")
            } else {
                if snapshot?.isEmpty != true && snapshot != nil{
                    
                    self.emailArray.removeAll(keepingCapacity: false)
                    self.commentArray.removeAll(keepingCapacity: false)
                    self.urlArray.removeAll(keepingCapacity: false)
                    
                    
                    for document in snapshot!.documents{
                        let docID = document.documentID
                        if let url = document.get("url") as? String{
                            self.urlArray.append(url)
                        }
                        if let comment = document.get("comment") as? String{
                            self.commentArray.append(comment)
                        }
                        if let email = document.get("email") as? String{
                            self.emailArray.append(email)
                        }
                        //document.get("url")
                        
                    }
                    self.tableView.reloadData()
                     
                }
            }
            
            
        }
    }
    
    
    



}
