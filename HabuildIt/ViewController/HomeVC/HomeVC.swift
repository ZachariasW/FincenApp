//
//  HomeVC.swift
//  HabuildIt
//
//  Created by Vivek Singh on 05/11/23.
//

import UIKit
import Foundation
import Instructions
protocol  RefreshController {
    func refresh()
}


class HomeVC: UIViewController  {
    
    
    
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
    var story1 = "From the homepage, you can add all the companies you need to do reporting for by pressing the Add Entity button at the bottom of the screen. Once an entity is created, you can press on its name to go into the details of the beneficiaries. Please add an entity to get started."
    let story2 = "You've created your first entity and added some beneficiaries. Great job getting started strong! You can click on the Profile tab which is your second tab to edit your password, view our privacy policy and user agreement, and change the frequency of the automatic notification, which is set at 25 days to start. If you do nothing as the admin other than create the entity and add the beneficiaries, the app will notify your beneficiaries once every 25 days, asking if their info has changed and if so, asking them to refresh the form."
    let text3 = "More:- Click on More to see our demo reminder and To-Do, create your own reminders and send them to others. Swipe left on individual reminders to edit or remove them."
    let text5 = "View All Groups:- Shows all groups."
    let text4 = "Create Group:- Create a new group."
    
    let nextButtonText = "Next"
    var viewModel : HomeViewModel!
    var businesses : [Business] = []
    var benificiary : [Beneficiary] = []

    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        Console.log("handleRefresh")
        refreshControl.endRefreshing()
        viewModel.getBusiness(uid: kUserDefaults.getUserId())
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
        tableViewHome.register(UINib(nibName: "HomeTableCell", bundle: nil), forCellReuseIdentifier: "HomeTableCell")
        tvDropdown.delegate = self
        tvDropdown.dataSource = self
        hideViews()
        setupViewModel()
       
    }
    
    func checkNotification()
    {
        if Constants.userDefaults.getNotificationStatus() {
            let vc = NotifyBenVC.instantiate(fromAppStoryboard: .homeTabBar)
            vc.hidesBottomBarWhenPushed = true
            vc.delegate = self
            navigationController?.present(vc, animated: true, completion: nil)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        checkNotification()
        if !kUserDefaults.getKtutorial()
        {
            startInstructions()
            kUserDefaults.setKtutorial(kTutorial: true)
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
buttonViewAll.applyGradient(colors: [Constants.Color.appbuttonGradiantStart.cgColor, Constants.Color.appbuttonGradiantEnd.cgColor])
           
        }
//        buttonToDoList.applyGradient(colors: [Constants.Color.appbuttonGradiantStart.cgColor, Constants.Color.appbuttonGradiantEnd.cgColor])
//        buttonCreateReminder.applyGradient(colors: [Constants.Color.appbuttonGradiantStart.cgColor, Constants.Color.appbuttonGradiantEnd.cgColor])
        
        
    }
    
    func setupViewModel()
    {
        viewModel = HomeViewModel()
        subscribeResponseObserver()
        subscribeBenResponseObserver()
        subscribeDeleteResponseObserver()
        viewModel.getBusiness(uid: kUserDefaults.getUserId())
        viewModel.getAllBeneficiary(uid: kUserDefaults.getUserId())
        coachMarksController.overlay.isUserInteractionEnabled = true
        self.coachMarksController.dataSource = self
    }
    
    func subscribeDeleteResponseObserver()
    {
        viewModel.responseDelete.observe(on: self) { [weak self] (result) in
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
    
    
    func subscribeBenResponseObserver()
    {
        viewModel.responseBeneficiary.observe(on: self) { [weak self] (result) in
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
    
    func handleResponse(model: BusinessResponseModel) {
 //     print("LoginResponseModel",model)
        if model.response.success == "true"
        {
            self.businesses = model.response.data
            self.tableViewHome.reloadData()
            self.labelMessage.isHidden = true
           
        }
       
    }
    
    func handleResponse(model: CommonResponseModel) {
      print("LoginResponseModel",model)
        viewModel.getBusiness(uid: kUserDefaults.getUserId())
       
    }
    
    
    func handleResponse(model: BeneficiaryResponseModel) {
      print("LoginResponseModel",model)
       
        if model.response.success == "true"
        {
            self.benificiary = viewModel.beneficiaryWithExpiry(ben: model.response.data)
            print("self.benificiary",self.benificiary)
            if self.benificiary.count > 0
            {
                self.btnMore.isHidden = false
                
                if kUserDefaults.getKtutorial() && !kUserDefaults.getKtutorial1()
                {
                    story1 = story2
                    self.startInstructions()
                    kUserDefaults.setKtutorial1(kTutorial: true)
                }
            }
        }
       
    }
    
}






extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
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
        guard let cell = tableViewHome.dequeueReusableCell(withIdentifier: "HomeTableCell", for: indexPath)as? HomeTableCell else {
            return UITableViewCell()
        }
        cell.labelName.text = businesses[indexPath.row].name
            cell.labelbadge.isHidden = true
//
//
//            if getUserData?[indexPath.row].postCount == "0" || getUserData?[indexPath.row].postedUserId == kUserDefaults.getUserId()
//        {
//            cell.labelbadge.isHidden = true
//        }
//        else {
//            cell.labelbadge.isHidden = false
//          //  cell.labelbadge.text = getUserData?[indexPath.row].postCount
//            cell.labelbadge.text = ""
//        }
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
            let vc = BeneficiaryVC.instantiate(fromAppStoryboard: .homeTabBar)
            vc.hidesBottomBarWhenPushed = false
            vc.bid = businesses[indexPath.row].bid
            vc.businessName = businesses[indexPath.row].name
            navigationController?.pushViewController(vc, animated: true)
        }
       
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        if tableView == tableViewHome{
        let data = businesses[indexPath.row]

        
            let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
                //    print("index path of delete: \(indexPath)")
                let alert = UIAlertController(title: "HabuildIt", message: "Do you want to delete this company.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { action in

                 //   self.requestServerDeleteCircle(cid : data?.id ?? "")
                    self.viewModel.deleteBusiness(bid: data.bid)


                }))
                alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: nil))
                self.present(alert, animated: true)
            }
            let edit = UIContextualAction(style: .normal, title: "Edit") { (action, sourceView, completionHandler) in
                //   print("index path of edit: \(indexPath)")
                let alert = UIAlertController(title: "HabuildIt", message: "Do you want to edit this company.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { action in
                    
                    
                    let vc = UpdateBusinessVC.instantiate(fromAppStoryboard: .homeTabBar)
                    vc.hidesBottomBarWhenPushed = true
                    vc.delegate = self
                    vc.bid = data.bid
                    vc.name = data.name
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
}



extension HomeVC : CoachMarksControllerDataSource,CoachMarksControllerDelegate {
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
        if kUserDefaults.getKtutorial()
        {
            return coachMarksController.helper.makeCoachMark(for: labelHabuildIt)
        }
        return coachMarksController.helper.makeCoachMark(for: buttonCreateCircle)
    }
    
    func numberOfCoachMarks(for coachMarksController: Instructions.CoachMarksController) -> Int {
        return 1
    }
    
    
}

extension UIButton {
    func applyShadow() {
        layer.shadowOpacity = 0.6
    }
}
