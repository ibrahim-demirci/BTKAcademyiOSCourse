//
//  ViewController.swift
//  NoteAppWithCoreData
//
//  Created by İbrahim Demirci on 26.11.2021.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var titles = [String]()
    var ids = [UUID]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        getDatas()
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addItem))
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = titles[indexPath.row]
        return cell
    }

    
    @objc func addItem(){
        
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    
    func getDatas(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Shop")
        
        // When big data operations set as false
        fetchRequest.returnsObjectsAsFaults = false
        
        
        
        do{
            let results = try  context.fetch(fetchRequest)
            
            for item in results as! [NSManagedObject]{
                
                if let title = item.value(forKey: "title") as? String{
                    titles.append(title)
                
                }
                if let id = item.value(forKey: "id") as? UUID{
                    ids.append(id)
                    
                }
            }
            tableView.reloadData()
            
        }catch{
            
            print("error")
            
        }
    }

}

