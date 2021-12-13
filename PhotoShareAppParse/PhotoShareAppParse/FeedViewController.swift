//
//  FeedViewController.swift
//  PhotoShareAppParse
//
//  Created by İbrahim Demirci on 13.12.2021.
//

import UIKit

class FeedViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    
    

    @IBOutlet weak var tableView: UITableView!
    var postsArray = [PostModel]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedTableViewCell
        cell.usernameLabel.text = postsArray[indexPath.row].username
        cell.commentLabel.text = postsArray[indexPath.row].comment
        
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsArray.count
    }
    

}
