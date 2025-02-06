//
//  CMFoamVC.swift
//  HabuildIt
//
//  Created by Harshit Rana on 02/11/23.
//

import Foundation
import UIKit

class CMFoamVC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var btnDatePicker: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var vwOne: UIView!
    
    @IBOutlet weak var vwSecond: UIView!
    
    @IBOutlet weak var vwThird: UIView!
    @IBOutlet weak var vwForth: UIView!
    
    @IBOutlet weak var vwFifth: UIView!
    
    var viewModel : FormViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        self.imageView.addGestureRecognizer(tapGesture)
        vwOne.addShadowWithRadius(radius: 5, cornerRadius: 5)
        vwSecond.addShadowWithRadius(radius: 5, cornerRadius: 5)
        vwThird.addShadowWithRadius(radius: 5, cornerRadius: 5)
        vwForth.addShadowWithRadius(radius: 5, cornerRadius: 5)
        vwFifth.addShadowWithRadius(radius: 5, cornerRadius: 5)
        setupViewModel()
       // self.tabBarController?.tabBar.isHidden = true
    }
    
    
    func setupViewModel()
    {
        viewModel = FormViewModel()
        subscribeResponseObserver()
    }
    
    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated:true)
    }
    
    // Date Picker
    
    @IBAction func tappedSelectDate(_ sender: Any) {
        let alertController = UIAlertController(title: "\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .alert)

                let datePicker = UIDatePicker()
                datePicker.datePickerMode = .date

                alertController.view.addSubview(datePicker)

                let doneAction = UIAlertAction(title: "Done", style: .default) { (action) in
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy" // You can change the date format as needed
                    let selectedDate = datePicker.date
                    let formattedDate = dateFormatter.string(from: selectedDate)
                    self.btnDatePicker.setTitle(formattedDate, for: .normal)
                }

                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

                alertController.addAction(doneAction)
                alertController.addAction(cancelAction)

                present(alertController, animated: true, completion: nil)
    }
    
    
    // Upload Image
    
    @objc func imageViewTapped(_ sender: UITapGestureRecognizer) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            imageView.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tappedEditFoam(_ sender: Any) {
        
        
    }
    
    
}

extension CMFoamVC {
    
    func subscribeResponseObserver()
    {
        viewModel.response.observe(on: self) { [weak self] (result) in
            guard  result != nil else { return }
            switch result {
            case .success(let data):
                self?.handleResponse(model: data)
            case .failure(let error):
                self?.handleFailure(error: error)
            case .none:
                Console.log("none")
            }
            
        }
    }
    
    func handleResponse(model: CommonResponseModel) {
      print("LoginResponseModel",model)
    
    }
    
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height *      widthRatio)
        }

        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
}
