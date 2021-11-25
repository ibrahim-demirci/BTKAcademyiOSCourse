//
//  ViewController.swift
//  CitiesProject
//
//  Created by İbrahim Demirci on 25.11.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    

    @IBOutlet weak var tableView: UITableView!
    var cities = [City]()
    var selectedCity : City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        let istanbul = City(imagePath: "istanbul.jpg", name: "İstanbul", region: "Marmara")
        let izmir = City(imagePath: "izmir.jpg", name: "İzmir", region: "Ege")
        let samsun = City(imagePath: "samsun.jpg", name: "Samsun", region: "Karadeniz")
        
        cities.append(istanbul)
        cities.append(izmir)
        cities.append(samsun)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = cities[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        selectedCity = cities[indexPath.row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetailsVC" {
            let detailsVc = segue.destination as! DetailsViewController
            detailsVc.selectedCity = selectedCity
            
        }
        
    }

}

