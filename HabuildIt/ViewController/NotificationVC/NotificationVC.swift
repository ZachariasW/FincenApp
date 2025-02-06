//
//  NotificationVC.swift
//  HabuildIt
//
//  Created by vivek on 2024-05-14.
//

import Foundation
import UIKit

class NotificationVC: UIViewController  {
    
    @IBOutlet weak var tableViewNotification: UITableView!
    
    
    var benificiary : [Beneficiary] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewNotification.delegate = self
        tableViewNotification.dataSource = self
        tableViewNotification.register(UINib(nibName: "BeneficiaryTableCell", bundle: nil), forCellReuseIdentifier: "BeneficiaryTableCell")
    }
    

    
    
    @IBAction func buttonActiontapBack(_ sender: UIButton) {
        Console.log("buttonActionDownloadForm")
        popViewController()

        
    }
}


extension NotificationVC: UITableViewDelegate, UITableViewDataSource {
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
        return benificiary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableViewNotification.dequeueReusableCell(withIdentifier: "BeneficiaryTableCell", for: indexPath)as? BeneficiaryTableCell else {
            return UITableViewCell()
        }
        cell.labelName.text = benificiary[indexPath.row].name
        cell.labelUpdated.isHidden = true
            cell.labelContact.text = "Beneficiary document is expiring let them know"
          
            
            cell.btnShare.tag = indexPath.row
            cell.btnShare.addTarget(self, action: #selector(buttonShareLinkTapped(_:)), for: .touchUpInside)
            cell.btnDownload.isHidden = true
            
        return cell

        }
     
    


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         
        return UITableView.automaticDimension
    }



    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
       
        
    }
    
    @objc func buttonShareLinkTapped(_ sender: UIButton) {
           Console.log("buttonShareLinkTapped")
        let data = benificiary[sender.tag]
        let vc = ShareVC.instantiate(fromAppStoryboard: .homeTabBar)
        vc.hidesBottomBarWhenPushed = true
        vc.bnid = data.bnid
        vc.contact = data.contact
        vc.mobile = data.mobile
        vc.name = data.name
        vc.bid = data.bid
        self.navigationController?.present(vc, animated: true, completion: nil)
//           let textToShare = "Fincen compliance documents to update. \n Please click the link and fill out the form, thank you"
//
//        let urlString = "https://habuildit.com/ben/" + (data.bnid) + "/" + bid + "/" + kUserDefaults.getUserId()
//
//        let myWebsite = URL(string: urlString)
//        let objectsToShare = [textToShare, myWebsite!,  #imageLiteral(resourceName: "logoImage")] as [Any]
//               let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
//
//               //Excluded Activities
//               activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList,UIActivity.ActivityType.assignToContact,UIActivity.ActivityType.mail ]
//               //
//
//               activityVC.popoverPresentationController?.sourceView = sender
//               self.present(activityVC, animated: true, completion: nil)

       }
   
    
  
}
