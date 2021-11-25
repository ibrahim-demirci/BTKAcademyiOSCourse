//
//  ViewController.swift
//  TableViewProject
//
//  Created by İbrahim Demirci on 25.11.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    

    
    
    
    @IBOutlet weak var tableView: UITableView!
    var heroImages = [String]()
    var heroNames = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        
    
        
        heroNames.append("Batman")
        heroNames.append("Superman")
        heroNames.append("Ironman")
        
       
        heroImages.append("batman")
        heroImages.append("superman")
        heroImages.append("ironman")
        
    }
    
    //numberOfRowsInSection -> How many rows
    //cellForRow atIndexPath -> What shows in cell
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.heroNames.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = heroNames[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            heroNames.remove(at: indexPath.row)
            heroImages.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            
        }
    }
    

}

