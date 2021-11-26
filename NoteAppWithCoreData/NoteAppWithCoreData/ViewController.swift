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
    var selectedTitle = ""
    var selectedUUID : UUID?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        getDatas()
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addItem))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getDatas), name: NSNotification.Name("dataSaved"), object: nil)
    }

    
    @objc func addItem(){
        self.selectedTitle = ""
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    
    @objc func getDatas(){
        
        titles.removeAll(keepingCapacity: false)
        ids.removeAll(keepingCapacity: false)
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Shop")
        
        // When big data operations set as false
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            let results = try  context.fetch(fetchRequest)
            
            if results.count > 0 {
                for item in results as! [NSManagedObject]{
                    
                    if let title = item.value(forKey: "title") as? String{
                        titles.append(title)
                    
                    }
                    if let id = item.value(forKey: "id") as? UUID{
                        ids.append(id)
                        
                    }
                }
                tableView.reloadData()
                
            }
            
        }catch{
            
            print("error")
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let dest = segue.destination as! DetailsViewController
            dest.selectedTitle = self.selectedTitle
            dest.selectedID = self.selectedUUID
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedTitle = titles[indexPath.row]
        selectedUUID = ids[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Shop")
            let uuidString = ids[indexPath.row].uuidString
            
            fetchRequest.predicate = NSPredicate(format: "id = %@", uuidString)
            fetchRequest.returnsObjectsAsFaults = false
            
            do{
                let results = try context.fetch(fetchRequest)
                if results.count > 0 {
                    for item in results as! [NSManagedObject]{
                        
                        if let id = item.value(forKey: "id") as? UUID{
                            if id == ids[indexPath.row]{
                                
                                context.delete(item)
                                titles.remove(at: indexPath.row)
                                ids.remove(at: indexPath.row)
                                self.tableView.reloadData()
                                
                                do{
                                    try context.save()
                                    
                                } catch{
                                    print("fail to context.save()")
                                }
                                
                                break
                            }
                        }
                    }
                }
            }catch{
                print("fail to delete")
            }
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = titles[indexPath.row]
        return cell
    }

}

