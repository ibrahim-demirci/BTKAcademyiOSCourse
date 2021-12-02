//
//  ViewController.swift
//  SwiftApiNewsApp
//
//  Created by İbrahim Demirci on 2.12.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    
    

    @IBOutlet weak var tableView: UITableView!
    private var newsTableViewModel : NewsTableViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "DempTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DemoTableViewCell")
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        
        getNews()
        
        
        
        
    }
    
    func getNews(){
        let url = URL(string:  "https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataSet/master/dataset.json")
        WebService().getNews(url: url!) { (news) in
            if let news = news {
                self.newsTableViewModel = NewsTableViewModel(newsList: news)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell",for: indexPath) as! DempTableViewCell
        
        
        
        
        //let cell = UITableViewCell()
        let newsViewModel = self.newsTableViewModel.newsAtIndexPath(indexPath.row)
        cell.title.text = "\(newsViewModel.title)"
        cell.story.text = "\(newsViewModel.story)"
        //cell.textLabel?.text = "\(newsViewModel.title)"
        //cell.textLabel?.text = "\(newsViewModel.title)"
        //cell.detailTextLabel?.text = "\(newsViewModel.story)"
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTableViewModel == nil ? 0 :  self.newsTableViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    


}

