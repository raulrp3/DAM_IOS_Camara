//
//  ViewController.swift
//  DAM_IOS_Camara
//
//  Created by raul.ramirez on 16/01/2020.
//  Copyright © 2020 Raul Ramirez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var mImageview: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        
        self.mImageview.image = info[.editedImage] as? UIImage
    }
    
    @IBAction func photoAction(_ sender: Any) {
        imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.showsCameraControls = true
        imagePicker.cameraCaptureMode = .photo
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func albumAction(_ sender: Any) {
        imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func saveAction(_ sender: Any) {
        UIImageWriteToSavedPhotosAlbum(mImageview.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer){
        if let error = error{
            let alertController = UIAlertController(title: "¡ERROR!", message: error.localizedDescription, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            
            alertController.addAction(okAction)
            
            present(alertController, animated: true, completion: nil)
        }else{
            let alertController = UIAlertController(title: "¡ÉXITO!", message: "La imagen se ha guardado correctamente", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            
            alertController.addAction(okAction)
            
            present(alertController, animated: true, completion: nil)
        }
    }
    
}

