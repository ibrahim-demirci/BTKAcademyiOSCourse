//
//  ListViewController.swift
//  MapsApp
//
//  Created by İbrahim Demirci on 28.11.2021.
//

import UIKit
import CoreData

class ListViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var titlesArray = [String]()
    var idArray = [UUID]()
    
    var selectedTitle = ""
    var selectedID: UUID?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(goToMaps))
        
        getDatasFromCoreData()

    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getDatasFromCoreData), name: NSNotification.Name("savedPin"), object: nil)
    }
    
    @objc func getDatasFromCoreData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Place")
        request.returnsObjectsAsFaults = false
        
        
        do{
            let results = try context.fetch(request)
            
            if results.count > 0{
                
                titlesArray.removeAll(keepingCapacity: false)
                idArray.removeAll(keepingCapacity: false)
                
                for item in results as! [NSManagedObject]{
                    if let title =  item.value(forKey: "title") as? String{
                        titlesArray.append(title)
                    }
                    if let id =  item.value(forKey: "id") as? UUID{
                        idArray.append(id)
                    }
                }
                tableView.reloadData()
            }
            
        }catch{
            print("fail to fetch datas")
        }
        
        
        
    }
    
    
    @objc func goToMaps(){
        selectedTitle = ""
        performSegue(withIdentifier: "toMapsVC", sender: nil)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = titlesArray[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedTitle = titlesArray[indexPath.row]
        selectedID = idArray[indexPath.row]
        performSegue(withIdentifier: "toMapsVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toMapsVC"{
            let destination = segue.destination as! MapsViewController
            destination.selectedID = self.selectedID
            destination.selectedTitle = self.selectedTitle
            
            
            
        }
       
    }
    


}
