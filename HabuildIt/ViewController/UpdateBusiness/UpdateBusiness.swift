//
//  UpdateBusiness.swift
//  HabuildIt
//
//  Created by Vivek Singh on 26/12/23.
//


import Foundation
import UIKit
import IQKeyboardManagerSwift

class UpdateBusinessVC: UIViewController {
    
    
    //MARK:-----------[OUTLETS]----------
    
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var labelAddBio: UILabel!
    @IBOutlet weak var viewAddBio: GrowingTextView!
    @IBOutlet weak var buttonAdd: UIButton!
    @IBOutlet weak var buttonClose: UIButton!
    var delegate : RefreshController?
    var viewModel : UpdateBusinessViewModel!
    var bid = String()
    var name = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        // Do any additional setup after loading the view.
    }
    func initialSetup(){
        viewMain.makeRoundCorner(5)
        buttonAdd.makeRoundCorner(5)
        viewAddBio.text = name
        setupViewModel()
    }
    
    func setupViewModel()
    {
        viewModel = UpdateBusinessViewModel()
        subscribeResponseObserver()
    }
    
}
extension UpdateBusinessVC{
    
    @IBAction func buttonActionClose(_ sender: UIButton){
        Console.log("buttonActionClose")
      dismiss(animated: true, completion: nil)
    }
    @IBAction func buttonActionAdd(_ sender: UIButton){
        Console.log("buttonActionAdd")
      if validate()
            {
          viewModel.updateBusiness(bid: bid, name: viewAddBio.text!)
             }
    }
    
    func validate()->Bool
    {
        if(viewAddBio.text.isEmpty)
        {
            DisplayBanner.failureBanner(message: "Please Add Business Name")
            return false
        }
        else {
            return true
        }
    }
}


extension UpdateBusinessVC {
    
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
        self.delegate?.refresh()
        dismiss(animated: true, completion: nil)
    }
}
