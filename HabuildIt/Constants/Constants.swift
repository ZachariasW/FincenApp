//
//  Constants.swift
//  HabuildIt
//
//  Created by Vivek Singh on 01/11/23.
//

import Foundation
import UIKit


let kAppDelegate = UIApplication.shared.delegate as! AppDelegate
let kProfilePlaceholder = UIImage(named: "placeholder")
let kUserDefaults = UserDefaults.standard
let kScreenHeight = UIScreen.main.bounds.height
let kScreenWidth = UIScreen.main.bounds.width


@available(iOS 13.0, *)
//let kAppSceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
@available(iOS 13.0, *)
public let kKeyWindow = UIApplication.shared.connectedScenes
    .filter({$0.activationState == .foregroundActive})
    .map({$0 as? UIWindowScene})
    .compactMap({$0})
    .first?.windows
    .filter({$0.isKeyWindow}).first

@objcMembers
@objc public class AppConstants: NSObject {
    private override init() {
        
    }
    
    @objc public class func getKeyWindow() -> UIWindow {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.keyWindow ?? UIWindow()
        } else {
            return UIApplication.shared.keyWindow ?? UIWindow()
        }
    }
    
    @objc public class func getStatusBarHeight() -> CGFloat {
        if #available(iOS 13.0, *) {
            return getKeyWindow().windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            return UIApplication.shared.statusBarFrame.height
        }
    }
}


struct Constants {
    static let sharedApplication = UIApplication.shared
    static let sharedAppDelegate = sharedApplication.delegate as! AppDelegate
    static let sharedWindow = sharedApplication.keyWindow!
    static let userDefaults  = UserDefaults.standard
    static let userDefaultsShare = UserDefaults(suiteName: "group.wyb.share")
    static let screen = UIScreen.main
    static let fileManager = FileManager.default
    static let userListPlaceholder = UIImage(named: "userListPlaceholder")
    static var kFCMTOKEN = String()
    static let SENDBIRD_APP_ID = "60B57ACF-3C00-4F00-9B88-843DABD8559B"
    
    
    struct  FontName {
        static let avenirRoman = "Avenir-Roman"
        static let avenirBLACK = "AVENIR-BLACK"
        static let avenirObl = "Avenir-Obl"
        static let avenirRegular = "Avenir-Regular"
        static let avenirBook = "Avenir-Book"
        static let avenirHeavy = "Avenir-Heavy"
        static let avenirMedium = "Avenir-Medium"
        
        
    }
    
    struct Color {
        static let appbuttonGradiantStart = UIColor(named: "appbuttonGradiantStart")!
        static let appbuttonGradiantEnd = UIColor(named: "appbuttonGradiantEnd")!
        static let appDefaultCellBackground  = UIColor(named: "appDefaultCellBackground")
        static let loginButtonGradiantEnd = UIColor(named: "loginButtonGradiantEnd")
        static let fbButtonGradiantStart = UIColor(named: "#2b55ab")
        static let appDefaultRed1 = UIColor(named: "#eb1c24")
        static let appDefaultBlack1 = UIColor(named: "#000000")
        static let appDefaultLightBlack = UIColor(named: "#757575")
        static let appDefaultGrayNintyFive = UIColor(named: "#F2F2F2")

        static let appDefaultYellow = UIColor(named: "#FDC300")
        static let appDefaultGray = UIColor(named: "#D0D0D0")
        static let appDefaultGreen = UIColor(named: "#6897B1")
        static let appDefaultGreen1 = UIColor(named: "#396E8B")
        static let appDefaultWhite = UIColor.white
        static let appDefaultBlue = UIColor(named: "#4C1F63")
        static let appDefaultLightGray = UIColor(named: "#CDCED2")
        static let appDefaultRed = UIColor(named: "#FD0000")
        static let appDefaultFaddedGray = UIColor(named: "#707070")
        static let appDeselectTabBar = UIColor(named: "#F09295")
        static let appNavigationBar = UIColor(named: "#ebebeb")
        static let pinkColor = UIColor(named: "#9536AE")
        static let navyBlueColor = UIColor(named: "#5B6AD2")
        static let navyColor = UIColor(named: "navyColor")



   
    }
    
    struct ErrorMessages {
        static let noNetwork = "Check your internet connection."
    }
}

struct DebugMessages {
    static let wrongScreen = "Error in screen transition"
}

struct API {
    //   static let baseUrl = "http://34.219.171.223/wyb/wyb.php?"
    //  static let baseUrl =   "https://whatyoubumping.com/wyb/wyb.php?"
    static let baseUrl = "https://habuildit.com/hab/api/index.php/Api_controller/get_new_auth_key/"
    static let apiToken = "Qeh1GcfJXAzVHQzNXYwlGchRXAnpTeh1GcyV2c1BkclNXdpBXY0V213A2"
    static let assetsUrl = ""
    
    
    //  GetPostData
    // reply
    static let GET_HOME_POST_AND_REPOST = "gethomepostnrepost"
    static let LOGIN = "login"
    static let SIGNUP = "register"
    static let FB_LOGIN = "fblogin"
    static let FOLLOW_DATA = "followdata"
    static let GET_USER_DETAILS = "getuserdetails"
    static let FORGET_PASSWORD = "fpwd"
    static let FORGET_PASSWORD_OTP = "fkey"
    static let CHANGE_USERNAME = "settinguser"
    static let CHANGE_PASSWORD = "settingpwd"
    static let CHECK_FOLLOW = "checkfollow"
    static let CHANGE_CONTACT = "settingmob"
    static let NOTIFICATION = "noty"
    static let GET_COMMENTS = "get_comments"
    static let GET_COMMENTS_BUMPED = "get_comments_bumped"
    static let GET_USER_THEME = "getusertheme"
    static let GET_BLOCK_USER = "getblockuser"
    static let FOLLOW = "follow"
    static let GET_FOLLOWING_USERS = "getFollowingUsers"
    static let DELETE_NOTIFICATION = "deletenotification"
    static let ALL_USER_DATA = "alluser"
    static let CLICK_LIKE = "clicklike"
    static let CLICK_LIKE_TRENDING = "clickliketrending"
    static let ACT_NOTIFICATION = "actNotification"
    static let INSERT_COMMENT = "insert_comment"
    static let INSERT_COMMENT_BUMPED = "insert_comment_bumped"
    static let GET_FOLLOW_N_FOLLOWING = "getFollowNFollowing"
    static let  SHARE_NORMAL = "share_normal"
    static let  SHARE_BUMPED = "share_bumped"
    static let GET_FAMOUS_SONG  = "getfamousSong"
    static let CREATE_POST  = "createPost"
    static let GET_POST_BY_ID  = "getpostbyid"
    static let CLICK_COMMENT_LIKE = "clickcommentlike"
    static let CLICK_COMMENT_LIKE_TRENDING  = "clickcommentlikeTrending"
    static let GET_HASHTAGS =   "getHastags"
    static let GET_TRENDING_HASHTAGS =   "getTrendingHashtags"
    static let GET_FOLLOW_USERS = "getFollowUsers"
    static let FOLLOWERS_DATA = "followersdata"
    static let ABOUT = "about"
    static let DELETE_POST = "deletepost"
    static let DELETE_SHARED_POST = "delete_sharedpost"
    static let  POSTED_USER  = "postedUser"
    static let  TERMINATED  = "terminate"
    static let  GET_REPLY  = "get_reply"
    static let  INSERT_REPLY  = "insert_reply"
    static let GET_USERS_POST  = "getUsersPost"
    static let REPOST_USERS  = "repostUsers"
    static let LIKE_USERS = "likeUsers"
    static let REPOST_USERS_TRENDING  = "trepostUsers"
    static let LIKE_USERS_TRENDING = "tlikeUsers"
    static let UPDATE_FILE = "update_file"
    static let UPLOAD_FILE = "upload_file"
    static let GET_BUSINESSES = "get_businesses"
    static let UPDATE_BADGE = "update_badge"
    static let GET_USER_IMAGE = "getuserimage"
    static let INSERT_HOME_COMMENT = "insertHomeComment"
    static let PROFILE_PHOTO = "profile_photo"
    static let EDIT_POST = "editPost"
    static let ADD_BUSINESS = "add_business"
    static let ADD_BENEFICIARY = "add_beneficary"
    static let GET_BENEFICIARY = "get_beneficiary"
    static let UPDATE_USERNAME  = "update_username"
    static let UPDATE_PASSWORD  = "update_password"
    static let UPDATE_CONTACT = "update_contact"
    static let UPLOAD_BEN_FORM  = "upload_ben_form"
    static let UPDATE_BEN_FORM  = "update_ben_form"
    static let DELETE_BUSINESS  = "delete_business"
    static let EDIT_BUSINESS  = "edit_business"
    static let DELETE_BENEFICIARY  = "delete_beneficiary"
    static let EDIT_BENEFICIARY  = "edit_beneficary"
    static let GET_BEN_DATA  = "get_ben_data"
    static let LOGIN_WITH_SOCIAL  = "login_with_social"
    static let NOTIFY_BEN = "notify_ben"
    static let NOTIFY_IN_BEN = "notify_in_ben"
    static let NOTIFY_ALL = "notify_all"
    static let GET_ALL_BENEFICIARY = "get_all_beneficiary"
    static let OPT_IN = "opt_out"
    static let SUPPORT_MAIL = "support_mail"
    
    
}

struct CellIdentifier {
    static let collectionCellEventStories = "CollectionCellEventStories"
    static let tableCellEventStories = "TableCellEventStories"
    static let collectionCellMoreStories = "CollectionCellMoreStories"
    static let tableCellMoreStories = "TableCellMoreStories"
    static let headerTableCell = "WCHeaderTableCell"
    static let imageTableCell = "WCImageTableCell"
    static let videoTableCell = "WCVideoTableCell"
    static let descriptionTableCell = "WCDescriptionTableCell"
    static let OSSingleLabelCell = "OSSingleLabelCell"
    
    
}

struct MethodName {
    static let login = "login"
    static let signUp = "create_user"
    static let fblogin = "fblogin"
    static let followData = "followdata"
    static let getUserImage = "getuserimage"
    static let getuserdetails = "getuserdetails"
    static let uploadUserImage = "https://whatyoubumping.com/wyb/upload_image.php"
    static let getPostList = "https://whatyoubumping.com/wyb/rahulapi.php"
    static let forgetPassword = "fpwd"
    static let forgetPasswordOTP = "fkey"
    static let getNetwork = "friend_network_data"
    static let privateAccount = "https://whatyoubumping.com/wyb/rahulapi.php"
    static let terminate = "https://whatyoubumping.com/wyb/mostexplored.php"
    static let changeUsername = "settinguser"
    static let changePassword = "settingpwd"
    static let checkfollow = "checkfollow"
    static let changeContact = "settingmob"
    static let notification = "noty"
    static let getComments = "get_comments"
    static let getusertheme = "getusertheme"
    static let freshLike = "freshlike"
    static let playCount = "play_count"
    static let followOtherUser = "http://bursa.ly/wyb/wyb.php?"
    static let getBlockuser = "getblockuser"
    static let follow = "follow"
    static let getFollowingUsers = "getFollowingUsers"
    static let deleteNotification = "deletenotification"
    static let allUserData = "alluser"
    static let clickLike = "clicklike"
    static let actNotification = "actNotification"
    static let insertComment = "https://whatyoubumping.com/wyb/mostexplored.php"
    static let getShareData = "https://whatyoubumping.com/wyb/mostexplored.php"
    static let getPostData = "https://whatyoubumping.com/wyb/rahulapi.php"
    static let getsharePostData = "https://whatyoubumping.com/wyb/rahulapi.php"
    static let insertHomeComment = "insert_comment"
    static let notificationTag = "notificationtag"
    static let notificationTag1 = "notificationtag1"
    static let notificationTag3 = "notificationtag3"
    static let facebookUser = "facebook_user"
    static let  getFollowNFollowing = "getFollowNFollowing"
    static let  share = "share"
    static let  commentList = "get_comments"
    static let  insertCommentSend = "insert_comment"
    static let getfamousSong  = "getfamousSong"
    static let createPost  = "createPost"
    static let getpostbyid  = "getpostbyid"
    static let clickcommentlike = "clickcommentlike"
    static let getHastags =   "getHastags"
    static let getTrendingHashtags =   "getTrendingHashtags"
    static let getFollowUsers = "getFollowUsers"
    static let followersdata = "followersdata"
    static let about = "about"
    static let deletePost = "deletepost"
    static let deleteSharedPost = "delete_sharedpost"
    static let insertIosToken = "inserttoken"
    static let  clickcommentlikeTrending  = "clickcommentlikeTrending"
    static let  postedUser  = "postedUser"
    static let  terminated  = "terminate"
    static let  reply  = "get_reply"
    static let  insertReply  = "insert_reply"
    static let notificationtag = "notificationtag"
    static let getHomepostNrePost = "gethomepostnrepost"
    static let  deleteTheme  = "https://whatyoubumping.com/wyb/wyb.php"
    static let  updateImageTheme  = "https://whatyoubumping.com/wyb/uploadimage1.php"
    static let  changeThemecolor  = "https://whatyoubumping.com/wyb/wyb.php"
    static let  wyblatest  = "https://whatyoubumping.com/wyb/wyblatest.php"
    
    
}


struct WebViewUrl {
    static let about = "https://www.weekinchina.com/about/"
    static let privacyPolicy = "https://www.weekinchina.com/back-issues/"
    static let contactus = "https://www.weekinchina.com/contact/"
    
}

struct StatusCode {
    static let success = 200
    static let pageNotFound = 404
    static let unauthenticated = 401
    static let noDataFound = 400
    static let alreadyReported = 208
    static let resourceCreated = 201
}

struct Validation{
    static let errorEmptyField = "This field can't be left empty.".localized
    static let somethingWentWromg = "Something Went Wromg".localized
    static let errorFirstNameEmpty = "Please enter first name.".localized
    static let errorLastNameEmpty = "Please enter last name.".localized
    static let errorEmailEmpty = "Please enter email address.".localized
    static let errorCreateUsername = "Please create username.".localized
    static let errorConfirmUsername = "Please confirm username.".localized
    static let errorUsernameNotMetched = "Username mismatched.".localized
    static let errorEmailInvalid = "Please enter valid email address.".localized
    static let errorSelectIndustry = "Please select Industry.".localized
    static let errorSelectLocation = "Please select location.".localized
    static let errorUsername = "Please enter username.".localized
    static let errorUsernameEmail = "Please enter email or username.".localized
    static let errorEnterOldPassword = "Please enter old password.".localized
    static let errorEnterNewPassword = "Please enter new password.".localized
    static let errorEnterConfirmPassword = "Please enter confirm password.".localized
    static let errorEmptyCountry = "Please select country.".localized
    static let errorEmptyPhoneNumber = "Please enter phone number.".localized
    static let errorEmptyCountryField = "Please select Country.".localized
    static let errorEmptyOTP = "Please enter OTP".localized
    static let errorNotNumeric = "Please enter numbers.".localized
    static let errorPhoneLength = "Phone Number should be between 8 to 15 digits.".localized
    static let errorEmptyComment = "Please enter comments".localized
    
    static let errorNameInvalid = "Please enter valid name".localized
    static let errorNameLength = "Name should be between 3 to 10 characters. ".localized
    static let errorPasswordEmpty = "Please enter password.".localized
    static let errorPasswordInvalid = "Password must contain characters between 8 to 15 and it must be alphanumeric.".localized
    static let errorPasswordLength = "Password should be less than 15 characters.".localized
    static let errorPasswordLengthInvalid = "Password must contain characters between 6 to 10.".localized
    static let errorConfirmPasswordLengthInvalid = "Password must contain characters between 6 to 10.".localized
    static let errorPasswordMismatch = "Password and confirm password should be same.".localized
    static let errorInvalidCountry = "Please select country.".localized
    static let errorPrivacy = "Please accept privacy policy and terms of service".localized
    static let errorEmptyDob = "Please enter date of birth.".localized
    static let errorEmptyAddress = "Please enter residence address.".localized
    static let errorEmptyStateId = "Please enter unexpired passpost or stateId number.".localized
    static let errorEmptyExpiry = "Please enter expiry date.".localized
}

struct ErrorMessages{
    static let errorToHandleInSuccess = "Something is wrong while getting success".localized
    static let errorToHandleInFailure = "Something is wrong while getting failure".localized
    static let errorNothingToLog = "There is nothing to log on console".localized
    static let somethingWentWrong = "Something went wrong".localized
    static let unableToParseError = "Unable to parse error response".localized
    static let invalidUserId = "Unable to find userId".localized
    static let networkError = "Network not available".localized
    static let errorMismatch = "Email or password mismatch".localized
    static let invalidCode = "Code is Invalid".localized
    
    
}
struct DefaultMessages{
    static let loginSuccess = "Login Successfully".localized
    static let passwordChanged = "password Changed Successfully".localized
    static let codeSent = "code Sent Successfully".localized
    static let updated = "Username Changed Successfully".localized
    static let contactChanged = "Contact Number Changed Successfully".localized
    static let success = "Successfully Done".localized
    
}

//struct Console{
//static func log(_ message: Any?){
//  print(message ?? ErrorMessages.errorNothingToLog)

//   }
//}

struct ServerKeys {
    static let USERNAME = "username"
    static let PASSWORD = "password"
    static let NAME = "name"
    static let BIO = "bio"
    static let PDF = "pdf"
    static let DOB = "dob"
    static let GENDER = "gender"
    static let TOKEN = "ios_tc"
    static let UID = "uid"
    static let BID = "bid"
    static let BNID = "bnid"
    static let ADDRESS = "address"
    static let STATEID = "state_id"
    static let CONTACT = "contact"
    static let KEY = "key"
    static let ACTION = "action"
    static let PAGE = "page"
    static let TYPE = "type"
    static let ABOUT = "about"
    static let EMAIL = "email"
    static let MOBILE = "mobile"
    static let FCM_TOKEN = "fcm_token"
    static let IMAGE = "image"
    static let MESSAGE = "message"
    static let ERRORS = "errors"
    static let NORMAL = "normal"
    static let SOCIAL = "social"
    static let SOCIAL_ID = "socialId"
    static let REQUEST_TYPE = "login_type"
    static let COUNTRY = "country"
    static let POST_ID = "postid"
    static let UNIQUE_ID = "unqid"
    static let UNIQUE = "unique"
    static let USERID = "userid"
    static let COUNT = "count"
    static let FID = "fid"
    static let ID = "id"
    static let AID = "aid"
    static let STEALTH = "stealth"
    static let IS_PRIVATE = "is_private"
    static let FIRSTNAME = "first_name"
    static let LASTNAME = "last_name"
    static let USER_IMAGE = "user_image"
    static let ARTIST = "artist"
    static let TITLE = "title"
    static let PUBLIC_URL = "publicurl"
    static let USER_PIC = "user_pic"
    static let HASHTAGS = "hashtags"
    static let COMMENT = "comment"
    static let VIDEO_THUMBNAIL = "videoThumbnail"
    static let UID_S = "uids"
    static let PERSONAL = "isprivate"
    static let ACCOUNT_TYPE = "account_type"
    static let DAYS = "days"
    static let COMMENTS = "comments"
    static let F_KEY = "fkey"
    static let CID = "cid"
    static let TAG = "tag"
    static let REPLY = "reply"
    static let BADGE = "badge"
    static let FILE = "file"
    static let APPLE_ID = "appleid"
    static let EXPIRY = "expiry"
    static let OTP_IN = "opt_in"
    
    
}

struct UserDefaultKeys{
    static let userId = "userId"
    static let fontSize = "fontSize"
    static let notify_status = "notify_status"
    static let api = "api"
    
    static let kfid = "fid"
    static let kid = "id"
    
    static let kdob = "dob"
    static let kopt = "opt"
    static let kToken = "token"
    static let fcmToken = "fcmToken"
    static let kauthToken = "authToken"
    static let kNo_of_circle = "no_of_circle"
    static let kStatus = "kStatus"
    static let kFirstName = "firstName"
    static let kLastName = "lastName"
    static let kFacebookId = "kFacebookId"
    static let kProfileImage = "profileImage"
    static let kUpdated_on = "updated_on"
    static let kBio = "bio"
    static var kIsLoggedIn = "isLogin"
    static let kUserId = "id"
    static let KStealthName = "stealth_name"
    static let kDeviceToken = "deviceToken"
    static let kLoggedInEmail = "email"
    static let kAbout = "about"
    static let kName = "kName"
    static let kPhoneNumber = "phoneNumber"
    static let kIsVerified = "isVerified"
    static let kUsername = "username"
    static let ksession = "session"
    static let kPassword = "password"
    static let kNotificationStatus = "notificationStatus"
    static let kActive = "Active"
    static let kInactive = "Inactive"
    static let kage = "age"
    static let kvisibility = "visibility"
    static let  Ksession = "session"
    static let  Klogin = "login"
    static let  KnotyCount = "noty_count"
    static let  KloginNotification =  "loginnotification"
    static let  KappleLanguages =  "AppleLanguages"
    static let  KappLang =  "appLang"
    static let  kaid =  "aid"
    static let  notyCount =  "notyCount"
    static let  Knotification =  "notification"
    static let  KPurchased =  "purchase"
    static let  KStealth =  "stealth"
    static let  KLightMode =  "lightMode"
    static let  KDarkMode =  "darkMode"
    static let kAccountType = "accountType"
    static let KArtist = "artist"
    static let kPersonal = "personal"
    static let kTutorial = "tutorial"
    static let kTutorial1 = "tutorial1"
    static let kTutorial2 = "tutorial2"
    static let kTutorial3 = "tutorial3"
    static let kTutorial4 = "tutorial4"
    static let kReminder = "kReminder"
    
}


enum LoginType: String {
    case normal
    case facebook
    case google
}

enum CurrentScreen: String {
    case home
    case option
    case dashboard
}


struct GenericModel: Codable {
    let status: Int
    let message: String
}


struct Console {
    static func log(_ message: Any) {
        print(message)
    }
}
    


