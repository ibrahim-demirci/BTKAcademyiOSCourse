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
    
    /*
    var urlArray = [String]()
    var emailArray = [String]()
    var commentArray = [String]()
    */
    var postArray = [Post]()
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for : indexPath) as! FeedCell
        cell.emailLabel.text = postArray[indexPath.row].email
        cell.commentLabel.text = postArray[indexPath.row].comment
        cell.imageView?.sd_setImage(with: URL(string: self.postArray[indexPath.row].url))
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
         
        db.collection("Post").order(by: "date",descending: true)
            .addSnapshotListener { snapshot, error in
            if error != nil{
                print(error?.localizedDescription ?? "Error when adding listener")
            } else {
                if snapshot?.isEmpty != true && snapshot != nil{
                    
                    //self.emailArray.removeAll(keepingCapacity: false)
                    //self.commentArray.removeAll(keepingCapacity: false)
                    //self.urlArray.removeAll(keepingCapacity: false)
                    self.postArray.removeAll(keepingCapacity: false)
                     
                    
                    for document in snapshot!.documents{
                        if let url = document.get("url") as? String{
                            if let comment = document.get("comment") as? String{
                                if let email = document.get("email") as? String{
                                    self.postArray.append(Post(email: email, comment: comment, url: url))
                                }
                            }
                        }
                        
                        
                        //document.get("url")
                        
                    }
                    self.tableView.reloadData()
                     
                }
            }
            
            
        }
    }
    
    
    



}
