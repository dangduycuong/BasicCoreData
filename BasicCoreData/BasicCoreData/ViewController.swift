//
//  ViewController.swift
//  BasicCoreData
//
//  Created by duycuong on 5/8/19.
//  Copyright © 2019 duycuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var photos: [UIImage] = []
    
    var data: Person?
    var index: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let objectData = data {
            nameTextField.text = objectData.name
            ageTextField.text = String(objectData.age)
            imageView.image = objectData.image as? UIImage
        }
    }
    
    //MARK: - UIImagePickerControllerDelegate
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        imageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func PickingPhoto(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }

    
    @IBAction func saveDataButton(_ sender: Any) {
        if index == nil {
            let data = Person(context: AppDelegate.context)
            if let content = nameTextField.text {
                data.name = content
            }
            if let content = ageTextField.text {
                data.age = Int32(content) ?? 0
            }
            if let content = imageView.image {
                data.image = content
            }
        } else {
            data?.setValue(nameTextField.text, forKey: "name")
            data?.setValue(Int(ageTextField.text!), forKey: "age")
            data?.setValue(imageView.image, forKey: "image")
        }
        
        AppDelegate.saveContext()
        
        //dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        //dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
}

