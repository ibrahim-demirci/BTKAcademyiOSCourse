//
//  UploadViewController.swift
//  PhotoShareAppParse
//
//  Created by İbrahim Demirci on 13.12.2021.
//

import UIKit
import Parse

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentField: UITextField!
    @IBOutlet weak var shareButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        let keyboardRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(keyboardRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageGesture = UITapGestureRecognizer(target: self, action: #selector(pickImage))
        imageView.addGestureRecognizer(imageGesture)
        
        
        shareButton.isEnabled = false
        
        
    }
    
    @IBAction func shareClicked(_ sender: Any) {
        
        shareButton.isEnabled = false
        let post = PFObject(className: "Posts")
        
        let data = imageView.image?.jpegData(compressionQuality: 0.5)
        
        if let data = data{
            if PFUser.current() != nil {
                let parseImage = PFFileObject(name: "image.jpg", data: data)
                
                post["image"] = parseImage
                post["comment"] = commentField.text
                post["username"] = PFUser.current()!.username
            
        }
        
        
        }
        
        post.saveInBackground { isSuccess, error in
            
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            
            } else {
                self.commentField.text = ""
                self.imageView.image = UIImage(named: "white")
                self.tabBarController?.selectedIndex = 0
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "post"), object: nil)
                
            }
        }
        
    }
    
    
    @objc func pickImage(){
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
        shareButton.isEnabled = true
        
    }
    @objc func closeKeyboard(){
        view.endEditing(true)
    }
    

}
