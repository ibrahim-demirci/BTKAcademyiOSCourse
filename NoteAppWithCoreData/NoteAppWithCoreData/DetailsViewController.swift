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
    override func viewDidLoad() {
        super.viewDidLoad()

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
       
        
        
       
        
        
    }
    
  
}
