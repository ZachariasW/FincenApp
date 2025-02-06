//
//  BenDetailsVC.swift
//  HabuildIt
//
//  Created by Vivek Singh on 21/11/23.
//

import Foundation
import UIKit
import Kingfisher
import PDFGenerator

class BenDetailsVC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var vwMain: UIScrollView!
    @IBOutlet weak var vwOne: UIView!
    
    @IBOutlet weak var vwSecond: UIView!
    
    @IBOutlet weak var vwThird: UIView!
    @IBOutlet weak var vwForth: UIView!
    @IBOutlet weak var vwSixth: UIView!
    @IBOutlet weak var vwFifth: UIView!
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldDob: UITextField!
    @IBOutlet weak var textFieldAddress: UITextField!
    @IBOutlet weak var textFieldStateId: UITextField!
    @IBOutlet weak var textFieldExpiry: UITextField!
    @IBOutlet weak var viewParent: UIView!
    @IBOutlet weak var contentView: UIView!
    
    private lazy var datePicker: UIDatePicker = {
      let datePicker = UIDatePicker(frame: .zero)
      datePicker.datePickerMode = .date
      datePicker.timeZone = TimeZone.current
        if #available(iOS 14, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
      return datePicker
    }()
    
    var viewModel : BenDetailViewModel!
   
    var bnId = String()
    var bId = String()
    var isUpdate = false
    var fileStr = ""
    var imageUrl = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        vwOne.addShadowWithRadius(radius: 5, cornerRadius: 5)
//        vwSecond.addShadowWithRadius(radius: 5, cornerRadius: 5)
//        vwThird.addShadowWithRadius(radius: 5, cornerRadius: 5)
//        vwForth.addShadowWithRadius(radius: 5, cornerRadius: 5)
//        vwFifth.addShadowWithRadius(radius: 5, cornerRadius: 5)
        textFieldExpiry.isUserInteractionEnabled = false
        self.imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        self.imageView.addGestureRecognizer(tapGesture)
        
        textFieldDob.inputView = datePicker
          datePicker.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
        textFieldExpiry.setInputViewDatePicker(target: self, selector: #selector(tapDone(sender:datePicker1:)))
        setupViewModel()
      
    }
    
    
    func setupViewModel()
    {
        viewModel = BenDetailViewModel()
        subscribeResponseObserver()
        viewModel.getBenData(bnid: bnId)
    }
    
    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated:true)
    }
    
    //2
        @objc func tapDone(sender: Any, datePicker1: UIDatePicker) {
            print(datePicker1)
            if let datePicker = self.textFieldExpiry.inputView as? UIDatePicker { // 2.1
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd MMM yyyy" // You can change the date format as needed
                let selectedDate = datePicker.date
                let formattedDate = dateFormatter.string(from: selectedDate)
                self.textFieldExpiry.text = formattedDate//2.4
            }
            self.textFieldExpiry.resignFirstResponder() // 2.5
        }
    
    @IBAction func tappedEdit(_ sender: Any) {
        
        if isUpdate
        {
            isUpdate = false
            btnEdit.setTitle("Edit", for: .normal)
            disableView()
            
            do {
                   let data = try PDFGenerator.generated(by: vwMain)
                let pdfData = data.base64EncodedString(options: .lineLength64Characters)
                setConstraints()
                viewModel.uploadForm(uid: kUserDefaults.getUserId(), bnid: bnId, bid: bId, name: textFieldName.text ?? "", dob: textFieldDob.text ?? "", address: textFieldAddress.text ?? "", stateId: textFieldStateId.text ?? "", expiry: textFieldExpiry.text ?? "", file: fileStr, pdfData: pdfData,imageUrl : imageUrl)
               } catch (let error) {
                   print(error)
               }
           
        }
        else
        {
            isUpdate = true
            btnEdit.setTitle("Update", for: .normal)
            enableView()
        }
        
    }
    
    // Date Picker
    
   
    
   
    @objc func handleDatePicker(sender: UIDatePicker) {
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "dd MMM yyyy"
          textFieldDob.text = dateFormatter.string(from: sender.date)
     }
   
    
    func openPicker() {
        let alert = UIAlertController(title: "Choose Image".localized, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera".localized, style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery".localized, style: .default, handler: { _ in
            self.openGallery()
        }))
        alert.addAction(UIAlertAction.init(title: "Cancel".localized, style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            let alert  = UIAlertController(title: "Warning".localized, message: "You don't have camera".localized, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK".localized, style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            let alert  = UIAlertController(title: "Warning".localized, message: "You don't have permission to access gallery.".localized, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK".localized, style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // Upload Image
    
    @objc func imageViewTapped(_ sender: UITapGestureRecognizer) {
//        let imagePicker = UIImagePickerController()
//        imagePicker.delegate = self
//        imagePicker.sourceType = .photoLibrary
//        present(imagePicker, animated: true, completion: nil)
        
        openPicker()
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            imageView.image = selectedImage
            let image1 = resizeImage(image: selectedImage, targetSize: CGSize(width:400, height: 400))
            let imgData = image1.jpegData(compressionQuality: 0.8)!
            fileStr = imgData.base64EncodedString(options: .lineLength64Characters)
        }
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tappedDownloadPdf(_ sender: Any) {
        
        do {
               let data = try PDFGenerator.generated(by: vwMain)
            setConstraints()
            let vc = UIActivityViewController(
              activityItems: [data],
              applicationActivities: []
            )

            self.present(vc, animated: true, completion: nil)
           } catch (let error) {
               print(error)
           }
        
    }
    
}

extension BenDetailsVC {
    
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
    
    func handleResponse(model: BenResponseModel) {
        
        textFieldName.text = model.response.data.first?.name ?? ""
        textFieldDob.text = model.response.data.first?.dob ?? ""
        textFieldAddress.text = model.response.data.first?.address ?? ""
        textFieldStateId.text = model.response.data.first?.stateId ?? ""
        textFieldExpiry.text = model.response.data.first?.expiry ?? ""
        self.imageView.kf.setImage(with: URL(string: model.response.data.first?.imageUrl ?? ""), placeholder: UIImage(named: "addImage"))
        self.imageUrl = model.response.data.first?.imageUrl ?? ""
        disableView()
     
    }
    
    
    func subscribeObserver()
    {
        viewModel.responseCommon.observe(on: self) { [weak self] (result) in
            guard  result != nil else { return }
            switch result {
            case .success(let data):
                self?.handleResponse(model: data)
            case .failure(let error):
                self?.showAlert()
            case .none:
                Console.log("none")
            }
            
        }
    }
    
    func handleResponse(model: CommonResponseModel) {
      print("LoginResponseModel",model)
        let alert  = UIAlertController(title: "Success".localized, message: "Form submitted Successfully".localized, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK".localized, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
       
    }
    
    func showAlert()
    {
        let alert  = UIAlertController(title: "Success".localized, message: "Form submitted Successfully.".localized, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK".localized, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func disableView()
    {
        textFieldName.isUserInteractionEnabled = false
        textFieldDob.isUserInteractionEnabled = false
        textFieldAddress.isUserInteractionEnabled = false
        textFieldStateId.isUserInteractionEnabled = false
        textFieldExpiry.isUserInteractionEnabled = false
    }
    
    func enableView()
    {
        textFieldName.isUserInteractionEnabled = true
        textFieldDob.isUserInteractionEnabled = true
        textFieldAddress.isUserInteractionEnabled = true
        textFieldStateId.isUserInteractionEnabled = true
        textFieldExpiry.isUserInteractionEnabled = true
    }
    
    func setConstraints()
    {
        vwMain.translatesAutoresizingMaskIntoConstraints = false
        viewParent.addSubview(vwMain)
        vwMain.leadingAnchor.constraint(equalTo: viewParent.leadingAnchor).isActive = true
        vwMain.topAnchor.constraint(equalTo: viewParent.topAnchor).isActive = true
        vwMain.trailingAnchor.constraint(equalTo: viewParent.trailingAnchor).isActive = true
        vwMain.bottomAnchor.constraint(equalTo: viewParent.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: vwMain.leadingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: vwMain.topAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: vwMain.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: vwMain.bottomAnchor).isActive = true
        contentView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor).isActive = true
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
