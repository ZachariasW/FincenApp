//
//  BeneficiaryVC.swift
//  HabuildIt
//
//  Created by Vivek Singh on 19/11/23.
//

import Foundation
import UIKit
import Instructions
class BeneficiaryVC: UIViewController  {
    
    
    
    @IBOutlet weak var buttonViewAll: UIButton!
    @IBOutlet weak var buttonCreateCircle: UIButton!
    @IBOutlet weak var btnMore: UIButton!
    @IBOutlet weak var tableViewHome: UITableView!
    @IBOutlet weak var labelMessage:UILabel!
    @IBOutlet weak var buttonPublicCircle: UIButton!
    @IBOutlet var marksContainer: UIView!
    @IBOutlet weak var labelHabuildIt:UILabel!
    @IBOutlet weak var buttonToDoList: UIButton!
    @IBOutlet weak var buttonRearrange: UIButton!
    @IBOutlet weak var dropdownHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var btnReminder: UIButton!

    @IBOutlet weak var tvDropdown: UITableView!{
        didSet {
            tvDropdown.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier.OSSingleLabelCell)
        }
    }
    
  
    
  
    var downloadManager = DownloadManager()
    var btnArr = ["Reminders", "To-Do"]
    var selectType = 0
    var selectedUserIndex = 1
    var selectedCategoryIndex = 0
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = Constants.Color.appbuttonGradiantStart
        return refreshControl
    }()
    
    var coachMarksController = CoachMarksController()
    var story1 =  "The Beneficiary Page is where we will notify and compile the information we need to keep up to date with FINCEN. Press Add Beneficiary at the bottom and add all the people needing to report to FINCEN for this entity."
    let story2 =  "Once you have your beneficiaries in there, you can hit the Notify All bell to send out the FINCEN info form, asking the beneficiaries for their address, legal ID expiration date (passport or driver's license), and a few more data points. Once the beneficiary fills out the form, it will appear here. You can keep track of when the last form was uploaded, send out notices to the whole team or to individuals, as well as download the data form, all from this page."
    let text1 = "Welcome to Habuildit, Create/join groups of people working towards similar goals."
    let text2 = "Public Groups:- Shows public groups."
    let text3 = "More:- Click on More to see our demo reminder and To-Do, create your own reminders and send them to others. Swipe left on individual reminders to edit or remove them."
    let text5 = "View All Groups:- Shows all groups."
    let text4 = "Create Group:- Create a new group."
    
    let nextButtonText = "Next"
    var viewModel : BeneficiaryViewModel!
    var businesses : [Beneficiary] = []
    var bid = String()
    var businessName = String()

    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        Console.log("handleRefresh")
        refreshControl.endRefreshing()
        viewModel.getBeneficiary(bid: bid)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        tableViewHome.refreshControl = refreshControl
        //tableViewHome.isEditing = true
        tableViewHome.showsVerticalScrollIndicator = false
       // tableViewHome.isScrollEnabled = false
      
        buttonPublicCircle.makeRounded()
        //        addMarks()
        //        createCoachMarker()
        
        tvDropdown.makeRoundCorner(6)
       // buttonCreateCircle.titleLabel?.textAlignment = .center
        
       
    }

    func setup() {
        tableViewHome.delegate = self
        tableViewHome.dataSource = self
        tableViewHome.register(UINib(nibName: "BeneficiaryTableCell", bundle: nil), forCellReuseIdentifier: "BeneficiaryTableCell")
        tvDropdown.delegate = self
        tvDropdown.dataSource = self
        hideViews()
        setupViewModel()
        downloadManager.processDelegate = self
        labelHabuildIt.text = businessName
        coachMarksController.overlay.isUserInteractionEnabled = true
        self.coachMarksController.dataSource = self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        
        if !kUserDefaults.getKtutorial2()
        {
            startInstructions()
            kUserDefaults.setKtutorial2(kTutorial: true)
        }
//        let launchedBefore = UserDefaults.standard.bool(forKey: UserDefaultKeys.KTutorial)
//        if launchedBefore  {
//            //            coachMarker?.autoPlay(delay:0.0, interval:0.01, completion:{print("autoPlay finished")})
//            //self.coachMarksController.stop(immediately: true)
//
//            print("Not first launch.")
//              UserDefaults.standard.set(false, forKey: UserDefaultKeys.KTutorial)
//              self.coachMarksController.start(in: .window(over: self))
//
//        } else {
//          //  self.coachMarksController.start(in: .window(over: self))
//
//            //        createCoachMarker()
//            //        addMarks()
//            //            coachMarker?.autoPlay(delay:0.6, interval:10, completion:{print("autoPlay finished")})
//           // print("First launch, setting UserDefault.")
//            //UserDefaults.standard.set(true, forKey: UserDefaultKeys.KTutorial)
//
//        }
        if UIDevice.current.userInterfaceIdiom == .pad {
                  //  buttonViewAll.setGradientBackgrounded(colors: [Constants.Color.appbuttonGradiantStart.cgColor, Constants.Color.appbuttonGradiantEnd.cgColor])

                }else if UIDevice.current.userInterfaceIdiom == .phone{
                        }
        
        
       
        
    }
    func hideViews()
    {
        
        self.buttonViewAll.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        coachMarksController.stop(immediately: true)
       
    }
    
    func startInstructions() {
        coachMarksController.start(in: .window(over: self))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
       
        
        
    }
    
    
    override func viewWillLayoutSubviews() {
        if UIDevice.current.userInterfaceIdiom == .pad {
           

        }else if UIDevice.current.userInterfaceIdiom == .phone{
            btnMore.applyGradient(colors: [Constants.Color.appbuttonGradiantStart.cgColor, Constants.Color.appbuttonGradiantEnd.cgColor])
           
        }
//        buttonToDoList.applyGradient(colors: [Constants.Color.appbuttonGradiantStart.cgColor, Constants.Color.appbuttonGradiantEnd.cgColor])
//        buttonCreateReminder.applyGradient(colors: [Constants.Color.appbuttonGradiantStart.cgColor, Constants.Color.appbuttonGradiantEnd.cgColor])
        
        
    }
    
    func setupViewModel()
    {
        viewModel = BeneficiaryViewModel()
        subscribeResponseObserver()
        subscribeDeleteResponseObserver()
        subscribeNotifyBenObserver()
        viewModel.getBeneficiary(bid: bid)
    }
    
    
    func subscribeNotifyBenObserver()
    {
        viewModel.responseNotify.observe(on: self) { [weak self] (result) in
            guard  result != nil else { return }
            switch result {
            case .success(let data):
                self?.handleResponseNotify(model: data)
            case .failure(let error):
                self?.handleFailure(error: error)
            case .none:
                Console.log("none")
            }
            
        }
    }
    
    func handleResponseNotify(model: CommonResponseModel) {
      print("LoginResponseModel",model)
        BannerManager.shared.showBanner(message: "Update form sent", type: .success)
       // DisplayBanner.successBanner(message: "All Beneficiaries are notified successfully")
       
    }
    
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
    
    func subscribeDeleteResponseObserver()
    {
        viewModel.responseDelete.observe(on: self) { [weak self] (result) in
            guard  result != nil else { return }
            switch result {
            case .success(let data):
                self?.handleResponse(model: data)
            case .failure(let error):
                self?.handleError(error: error)
            case .none:
                Console.log("none")
            }
            
        }
    }
    
    func handleResponse(model: BeneficiaryResponseModel) {
      print("LoginResponseModel",model)
        if model.response.success == "true"
        {
            self.businesses = model.response.data
            self.tableViewHome.reloadData()
            self.labelMessage.isHidden = true
            
            if self.businesses.count > 0
            {
                if kUserDefaults.getKtutorial2() && !kUserDefaults.getKtutorial3()
                {
                    story1 = story2
                    self.startInstructions()
                    kUserDefaults.setKtutorial3(kTutorial: true)
                }
            }
           
        }
       
    }
    
    func handleResponse(model: CommonResponseModel) {
      print("LoginResponseModel",model)
       
        self.businesses.removeAll()
        viewModel.getBeneficiary(bid: bid)
       
    }
    
     func handleError(error: Error?) {
         self.businesses.removeAll()
         self.tableViewHome.reloadData()
         viewModel.getBeneficiary(bid: bid)
    }
    
}






extension BeneficiaryVC: UITableViewDelegate, UITableViewDataSource {
    
     func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }

     func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
     func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
      if tableView == tableViewHome{
//        guard let movedObject = self.getUserData?[sourceIndexPath.row] else { return  }
//        self.getUserData?.remove(at: sourceIndexPath.row)
//        self.getUserData?.insert(movedObject, at: destinationIndexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tvDropdown {
            return btnArr.count
        }else  if tableView == tableViewHome{
//        let count = getUserData?.count ?? 0
//        if count > 5 {
//            return 5
//        } else {
//            return count
//        }
            return businesses.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tvDropdown {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.OSSingleLabelCell, for: indexPath)
                   cell.backgroundColor = .white
                   cell.selectionStyle = .none
                   if UIDevice.current.userInterfaceIdiom == .pad {
                       cell.textLabel?.font = UIFont.kAppDefaultFontHeavy(ofSize: 24)


                   }else if UIDevice.current.userInterfaceIdiom == .phone{
                       cell.textLabel?.font = UIFont.kAppDefaultFontHeavy(ofSize: 12)

                           }
                   cell.textLabel?.text = btnArr[indexPath.row]
                  // cell.textLabel?.adjustsFontSizeToFitWidth = true
                   cell.textLabel?.textColor = .darkGray
               
                   return cell
        }else  if tableView == tableViewHome{
        guard let cell = tableViewHome.dequeueReusableCell(withIdentifier: "BeneficiaryTableCell", for: indexPath)as? BeneficiaryTableCell else {
            return UITableViewCell()
        }
        cell.labelName.text = businesses[indexPath.row].name
            cell.labelContact.text = businesses[indexPath.row].contact
            if businesses[indexPath.row].status == "0"
            {
                cell.viewCard.backgroundColor = UIColor(named: "birightRed")
                cell.labelUpdated.text = "Not Updated"
                cell.btnDownload.isHidden = true
            }
            else
            {
                cell.viewCard.backgroundColor = UIColor(named: "F1F0F0")
                cell.labelUpdated.text = "Updated On - \(businesses[indexPath.row].updateFormOn.formatDateString() ?? "")"
                cell.btnDownload.isHidden = false
            }
            
            cell.btnShare.tag = indexPath.row
            cell.btnShare.addTarget(self, action: #selector(buttonShareLinkTapped(_:)), for: .touchUpInside)
            cell.btnDownload.tag = indexPath.row
            cell.btnDownload.addTarget(self, action: #selector(buttonDownloadTapped(_:)), for: .touchUpInside)
            
        return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         if tableView == tvDropdown {
                   return 45
         }else if tableView == tableViewHome{
            return UITableView.automaticDimension
        }
        return 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tvDropdown {
                  // let btns = btnArr[indexPath.row]
                                selectType = indexPath.row
            
            if indexPath.row == 0{
//                let vc = CMRemindersVC.instantiate(fromAppStoryboard: .homeTabBar)
//                           vc.screenType = .editPost
//                        vc.hidesBottomBarWhenPushed = true
//                       navigationController?.pushViewController(vc, animated: true)
            }
            else if indexPath.row == 1{
//                let vc = CMToDoListVC.instantiate(fromAppStoryboard: .homeTabBar)
//                   vc.hidesBottomBarWhenPushed = false
//                navigationController?.pushViewController(vc, animated: true)
            }
                                UIView.animate(withDuration: 0.25, animations: {[weak self] in
                                    self?.dropdownHeightConstraint.constant = 0
                                    self?.tvDropdown.layoutIfNeeded()
                                    self?.view.layoutIfNeeded()
                                })
                               // buttonMore.titleLabel?.adjustsFontSizeToFitWidth = true
                               // if self.selectedCategoryIndex == indexPath.row {
                                    //buttonMore.setTitle(btns, for: .normal)
                                //    selectedCategoryIndex = indexPath.row
                                //} else {
                                   // buttonRepeat.setTitle(reminder, for: .normal)
                               //     selectedCategoryIndex = indexPath.row
                               // }
                               
        }else  if tableView == tableViewHome{
            let vc = BenDetailsVC.instantiate(fromAppStoryboard: .homeTabBar)
            vc.hidesBottomBarWhenPushed = true
            vc.bnId = businesses[indexPath.row].bnid
            navigationController?.pushViewController(vc, animated: true)
        }
       
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        if tableView == tableViewHome{
        let data = businesses[indexPath.row]

        
            let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
                //    print("index path of delete: \(indexPath)")
                let alert = UIAlertController(title: "HabuildIt", message: "Do you want to delete this beneficiary.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { action in

                    self.viewModel.deleteBeneficiary(bnid: data.bnid)


                }))
                alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: nil))
                self.present(alert, animated: true)
            }
            let edit = UIContextualAction(style: .normal, title: "Edit") { (action, sourceView, completionHandler) in
                //   print("index path of edit: \(indexPath)")
                let alert = UIAlertController(title: "HabuildIt", message: "Do you want to edit this beneficiary.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { action in
                    let vc = UpdateBeneficiaryVC.instantiate(fromAppStoryboard: .homeTabBar)
                    vc.hidesBottomBarWhenPushed = true
                    vc.bnid = data.bnid
                    vc.contact = data.contact
                    vc.mobile = data.mobile
                    vc.name = data.name
                    vc.delegate = self
                    self.navigationController?.present(vc, animated: true, completion: nil)
                }))
                alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: nil))
                self.present(alert, animated: true)
            }


            let swipeActionConfig = UISwipeActionsConfiguration(actions: [edit, delete])
            swipeActionConfig.performsFirstActionWithFullSwipe = false
            return swipeActionConfig
        

//        else {
//
//            let leave = UIContextualAction(style: .normal, title: "Leave") { (action, sourceView, completionHandler) in
//                //   print("index path of edit: \(indexPath)")
//                let alert = UIAlertController(title: "HabuildIt", message: "Do you want to leave this group.", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { action in
//
//                 //   self.requestServerLeaveCircle(cid : data?.id ?? "")
//                }))
//                alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: nil))
//                self.present(alert, animated: true)
//            }
//            let swipeActionConfig = UISwipeActionsConfiguration(actions: [leave])
//            swipeActionConfig.performsFirstActionWithFullSwipe = false
//            return swipeActionConfig
//
//        }
        }
        return UISwipeActionsConfiguration()
    }
    
    @objc func buttonDownloadTapped(_ sender: UIButton) {
        let data = businesses[sender.tag]
        
        
        
        if let url = URL(string: data.form) {
            downloadManager.addDownload(url ,mainFolder: businessName,subFolder: data.contact)
        }
        
        if let imgUrl = URL(string: data.imageUrl ?? "") {
            downloadManager.addDownload(imgUrl,mainFolder: businessName,subFolder: data.contact)
        }
        
        
    }
    
    @objc func buttonShareLinkTapped(_ sender: UIButton) {
           Console.log("buttonShareLinkTapped")
        let data = businesses[sender.tag]
        let vc = ShareVC.instantiate(fromAppStoryboard: .homeTabBar)
        vc.hidesBottomBarWhenPushed = true
        vc.bnid = data.bnid
        vc.contact = data.contact
        vc.mobile = data.mobile
        vc.name = data.name
        vc.bid = data.bid
        vc.delegate = self
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

extension BeneficiaryVC : CoachMarksControllerDataSource,CoachMarksControllerDelegate {
    func coachMarksController(_ coachMarksController: Instructions.CoachMarksController, coachMarkViewsAt index: Int, madeFrom coachMark: Instructions.CoachMark) -> (bodyView: (any UIView & Instructions.CoachMarkBodyView), arrowView: (any UIView & Instructions.CoachMarkArrowView)?) {
        let coachViews = coachMarksController.helper.makeDefaultCoachViews(
                withArrow: true,
                arrowOrientation: coachMark.arrowOrientation
            )

            coachViews.bodyView.hintLabel.text = story1
            coachViews.bodyView.nextLabel.text = "Ok!"

            return (bodyView: coachViews.bodyView, arrowView: coachViews.arrowView)
    }
    
    func coachMarksController(_ coachMarksController: Instructions.CoachMarksController, coachMarkAt index: Int) -> Instructions.CoachMark {
        if kUserDefaults.getKtutorial2()
        {
            return coachMarksController.helper.makeCoachMark(for: labelHabuildIt)
        }
        return coachMarksController.helper.makeCoachMark(for: buttonCreateCircle)
    }
    
    func numberOfCoachMarks(for coachMarksController: Instructions.CoachMarksController) -> Int {
        return 1
    }
    
    
}
