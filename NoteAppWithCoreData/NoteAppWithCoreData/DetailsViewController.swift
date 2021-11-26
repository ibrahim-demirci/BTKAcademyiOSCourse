//
//  DetailsViewController.swift
//  NoteAppWithCoreData
//
//  Created by İbrahim Demirci on 26.11.2021.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var sizeField: UITextField!
    
    var selectedTitle = ""
    var selectedID : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if selectedTitle != ""{
            // Core Data Fetch
            
            if let uuidString = selectedID?.uuidString{

                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Shop")
                fetchRequest.predicate = NSPredicate(format: "id = %@", uuidString)
                fetchRequest.returnsObjectsAsFaults = false
                
                
                do{
                    let results = try context.fetch(fetchRequest)
                    
                    if results.count > 0 {
                        
                        for item in results as! [NSManagedObject]{
                            if let title = item.value(forKey: "title") as? String{
                                titleField.text = title
                            }
                            if let price = item.value(forKey: "price") as? Int{
                                priceField.text = String(price)
                            }
                            if let size = item.value(forKey: "size") as? String{
                                sizeField.text = size
                            }
                            
                            if let data = item.value(forKey: "image") as? Data{
                            
                                let imageData = UIImage(data: data)
                                imageView.image = imageData
                            
                            }
                        }
                        
                    }
                    
                    
                } catch{
                    print("error in fetch in detail page")
                }
                
                
                
            }
            print(selectedID)
            
        } else {
            titleField.text = ""
            priceField.text = ""
            sizeField.text = ""
            
        }

        // Do any additional setup after loading the view.
        
        let gestureRec = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(gestureRec)
        
        imageView.isUserInteractionEnabled = true
        let imageGesture = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageGesture)
        
    }
    
    
    @objc func closeKeyboard(){
        view.endEditing(true)
    }
    
    @objc func selectImage(){
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func save(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let item = NSEntityDescription.insertNewObject(forEntityName: "Shop", into: context)
        
        item.setValue(titleField.text, forKey: "title")
        item.setValue(sizeField.text, forKey: "size")
        item.setValue(UUID(), forKey: "id")
        
        if let price = Int(priceField.text!){
            
            item.setValue(price, forKey: "price")
        }
        
        // Image operations
        let data = imageView.image!.jpegData(compressionQuality: 0.5)
        item.setValue(data, forKey: "image")
        
        do{
            try  context.save()
            print("saved")
        }catch{
            print("fail to save")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("dataSaved"), object: nil)
        self.navigationController?.popViewController(animated: true)
       
        
    }
    
  
}
