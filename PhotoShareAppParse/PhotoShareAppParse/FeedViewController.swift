//
//  FeedViewController.swift
//  PhotoShareAppParse
//
//  Created by İbrahim Demirci on 13.12.2021.
//

import UIKit
import Parse

class FeedViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    
    

    @IBOutlet weak var tableView: UITableView!
    var postsArray = [PostModel]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        getPosts()
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedTableViewCell
        cell.usernameLabel.text = postsArray[indexPath.row].username
        cell.commentLabel.text = postsArray[indexPath.row].comment
//        cell.postImageView.image = UIImage(named: "white")
        postsArray[indexPath.row].image.getDataInBackground { data, error in
            if error == nil {
                if let data = data {
                    print("resim yükleniyor")
                    cell.postImageView.image = UIImage(data: data)
                }

            }
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsArray.count
    }
    
    
    @objc func getPosts(){
        
        let query = PFQuery(className: "Posts")
        query.addDescendingOrder("createdAt")
        
        query.findObjectsInBackground { objects, error in
            if error != nil{
                self.showAlert(title: "Error", message: error?.localizedDescription ?? "Error when loading posts ")
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        self.postsArray.removeAll(keepingCapacity: false)
                        
                        for object in objects!{
                            if let username = object.object(forKey: "username") as? String{
                                if let comment = object.object(forKey: "comment") as? String{
                                    if let image = object.object(forKey: "image") as? PFFileObject{
                                        let post = PostModel(username: username, comment: comment, image: image)
                                        self.postsArray.append(post)
                                    }
                                    
                                }
                            }
                            
                        }
                        print(self.postsArray)
                        self.tableView.reloadData()
                    }
                }
            }
        }
        
    }
    
    func showAlert(title : String, message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getPosts), name: NSNotification.Name(rawValue: "post"), object: nil)
    }

}
