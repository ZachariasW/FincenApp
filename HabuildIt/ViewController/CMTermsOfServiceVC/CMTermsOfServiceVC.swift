//
//  CMTermsOfServiceVC.swift
//  HabuildIt
//
//  Created by Vivek Singh on 15/11/23.
//

import UIKit


class CMTermsOfServiceVC: UIViewController {
    
    
    //MARK:-----------[IBOUTLETS]---------
    @IBOutlet weak var textViewTermsOfService:UITextView!
   // @IBOutlet var pdfView: PDFView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
           /* if let path = Bundle.main.path(forResource: "Terms of service", ofType: "pdf") {
                if let pdfDocument = PDFDocument(url: URL(fileURLWithPath: path)) {
                    pdfView.displayMode = .singlePageContinuous
                    pdfView.autoScales = true
                    pdfView.displayDirection = .vertical
                    pdfView.document = pdfDocument
                    pdfView.minScaleFactor = pdfView.scaleFactor
                    pdfView.maxScaleFactor = pdfView.scaleFactorForSizeToFit
                    
                }
            }*/
        settextView()
    }
    
    func settextView(){
        textViewTermsOfService.text = """
        This Mobile Application End User License Agreement ("Agreement") is a binding agreement between you ("End User" or "you") and Svara LLC, a Washington limited liability company ("Company"). This Agreement governs your use of the HABUILDIT App (including all related documentation, the "Application"). The Application is licensed, not sold, to you.

        BY DOWNLOADING, AND USING THE APPLICATION, YOU (A) ACKNOWLEDGE THAT YOU HAVE READ AND UNDERSTAND THIS AGREEMENT; (B) REPRESENT THAT YOU ARE 18 YEARS OF AGE OR OLDER; AND (C) ACCEPT THIS AGREEMENT AND AGREE THAT YOU ARE LEGALLY BOUND BY ITS TERMS. IF YOU DO NOT AGREE TO THESE TERMS, DO NOT DOWNLOAD THE APPLICATION AND DELETE IT FROM YOUR MOBILE DEVICE.

        1.License Grant. Subject to the terms of this Agreement, Company grants you a limited, non-exclusive, and nontransferable license to:

        (a)download, and use the Application for your personal, non- commercial use on a single mobile device owned or otherwise controlled by you ("Mobile Device") strictly in accordance with the Application's  documentation; and

        (b)access, stream, download, and use on such Mobile Device the Content and Services (as defined in 5) made available in or otherwise accessible through the Application, strictly in accordance with this Agreement.

        2.License Restrictions. You shall not:

        (a)copy the Application, except as expressly permitted by this license;

        (b)modify, translate, adapt, or otherwise create derivative works or improvements, whether or not patentable, of the Application;

        (c)reverse engineer, disassemble, decompile, decode, or otherwise attempt to derive or gain access to the source code of the Application or any part thereof;

        (d)remove, delete, alter, or obscure any trademarks or any copyright, trademark, patent, or other intellectual property or proprietary rights notices from the Application, including any copy thereof;

        (e)rent, lease, lend, sell, sublicense, assign, distribute, publish, transfer, or otherwise make available the Application, or any features or functionality of the Application, to any third party for any reason, including by making the Application available on a network where it is capable of being accessed by more than one device at any time; or


        (f)remove, disable, circumvent, or otherwise create or implement any workaround to any copy protection, rights management, or security features in or protecting the Application; or

        (g)use the Application in, or in association with, the design, construction, maintenance, or operation of any hazardous environments or systems, including any power generation systems; aircraft navigation or communication systems, air traffic control systems, or any other transport management systems; safety-critical applications, including medical or life-support systems, vehicle operation applications or any police, fire, or other safety response systems; and military or aerospace applications, weapons systems, or environments.

        3.Reservation of Rights. You acknowledge and agree that the Application is provided under license, and not sold, to you. You do not acquire any ownership interest in the Application under this Agreement, or any other rights thereto other than to use the Application in accordance with the license granted, and subject to all terms, conditions, and restrictions, under this Agreement. Company, and its licensors and service providers reserve and shall retain their entire right, title, and interest in and to the Application, including all copyrights, trademarks, and other intellectual property rights therein or relating thereto, except as expressly granted to you in this Agreement.

        4.Collection and Use of Your Information. You acknowledge that when you download, and use the Application, Company may use automatic means (including, for example, cookies and web beacons) to collect information about your Mobile Device and about your use of the Application. You also may be required to provide certain information about yourself as a condition to downloading, and using the Application or certain of its features or functionality, and the Application may provide you with opportunities to share information about yourself with others. All information we collect through or in connection with this Application is subject to our Privacy Policy [INSERT AS LINK TO MOBILE APP PRIVACY POLICY]. By downloading, using, and providing information to or through this Application, you consent to all actions taken by us with respect to your information in compliance with the Privacy Policy.

        5.Content and Services, Fees for upgraded Content and Services. The Application provides you access to the products and services accessible thereon, and certain features, functionality, and content accessible only on, or through the Application ("Content and Services").

        6.Paid subscription to enhanced Content and Services. "Upgrades" in the setting section under profile, allows you to begin a monthly subscription to HABUILDIT.  The subscription provides you with enhanced access to your profile page, enabling you to control and customize your backdrop and share your profile and account details with others.  The subscription-based service will cost you $9.99 every month, renewing automatically each month until you cancel the subscription.  All fees are in U.S. dollars and are non-refundable.  HABUILDIT reserves the right to amend the fees by posting new fees on the Application or notifying you via email.  To cancel, go to your Apple Subscriptions settings and select cancel. Geographic Restrictions. The Content and Services are based in the state of Washington in the United States and provided for access and use only by persons located in the United States. You acknowledge that you may not be able to access all or some of the Content and Services outside of the United States and that access thereto may not be legal by certain persons or in certain countries. If you access the Content and Services from outside the United States, you are responsible for compliance with local laws.

        7.Updates. Company may from time to time in its sole discretion develop and provide Application updates, which may include upgrades, bug fixes, patches, other error corrections, and/or new features (collectively, including related documentation, "Updates"). Updates may also modify or delete in their entirety certain features and functionality. You agree that Company has no obligation to provide any Updates or to continue to provide or enable any particular features or functionality. Based on your Mobile Device settings, when your Mobile Device is connected to the internet either:

        (a)the Application will automatically download and install all available Updates; or

        (b)you may receive notice of or be prompted to download and install available Updates.

        You shall promptly download and install all Updates and acknowledge and agree that the Application or portions thereof may not properly operate should you fail to do so. You further agree that all Updates will be deemed part of the Application and be subject to all terms and conditions of this Agreement.

        8.Third-Party Materials. The Application may display, include, or make available third-party content (including data, information, applications, and other products, services, and/or materials) or provide links to third-party websites or services, including through third-party advertising ("Third-Party Materials"). You acknowledge and agree that Company is not responsible for Third-Party Materials, including their accuracy, completeness, timeliness, validity, copyright compliance, legality, decency, quality, or any other aspect thereof. Company does not assume and will not have any liability or responsibility to you or any other person or entity for any Third-Party Materials. Third-Party Materials and links thereto are provided solely as a convenience to you, and you access and use them entirely at your own risk and subject to such third parties' terms and conditions.

        9.Term and Termination.

        The term of Agreement commences when you download the Application and will continue in effect until terminated by you or Company as set forth in this 9.

        (a)You may terminate this Agreement by deleting the Application and all copies thereof from your Mobile Device.
        (b)Company may terminate this Agreement at any time without notice, if it ceases to support the Application, which Company may do in its sole. In addition, this Agreement will terminate immediately and automatically without any notice if you violate any of the terms and conditions of this Agreement.

        (c)Upon termination:

        (i)all rights granted to you under this Agreement will also terminate; and
        (ii)you must cease all use of the Application and delete all copies of the Application from your Mobile Device and account.

        (d)Termination will not limit any of Company's rights or remedies at law or in equity.

        10.Disclaimer of Warranties . The application is provided to end use “as is” and with all faults and defects without warranty of any kind. To the maximum extent permitted under applicable law, company, on its own behalf and on behalf of its affiliates and its and their respective licensors and service providers, expressly disclaims all warranties, whether express, implied, statutory, or otherwise, with respect to the application including all implied warranties of merchantability, fitness for a particular purpose, title, and non-infringement, and warranties that may arise out of course of dealing, course of performance, usage, or trade practice. Without limitations to the foregoing, company provides no warranty or undertaking, and makes no representation of any kind that the application will meet your requirements, achieve any intended results, be compatible, or work with any other software, applications, systems, or services, operate without interruption, meet any performance or reliability standards, or be error-free, or that any errors or defects can or will be corrected.

        11.Some jurisdictions do not allow the exclusion of or limitations on implied warranties or the limitations on the applicable statutory rights of a consumer, so some or all of the above exclusions and limitation may not apply to you.

        12.Limitation of Liability. To the fullest extent permitted by applicable law, in no event will company or its affiliates, or any of its or their respective licensors or service providers, have any liability arising from or related to your use of or inability to use the application or the content and services for:

        (a)Personal injury, property damage, lost profits, cost of substitute goods or services, loss of data, loss of goodwill, business interruption, computer failure or malfunction, or any other consequential, incidental, indirect, exemplary, special, or punitive damages.
        (b)Direct damages in amounts that in the aggregate exceed the amount actually paid by you for the application.

        The foregoing limitations will apply whether such damages arise out of breach of contract, tort (excluding negligence), or otherwise and regardless of whether such damages were foreseeable or company was advised of the possibility of such damages. Some jurisdictions do not allow certain limitations of liability so some or all of the above limitation may not apply to you.

        13.Indemnification. You agree to indemnify, defend, and hold harmless Company and its officers, directors, employees, agents, affiliates, successors, and assigns from and against any and all losses, damages, liabilities, deficiencies, claims, actions, judgments, settlements, interest, awards, penalties, fines, costs, or expenses of whatever kind, including reasonable attorneys' fees, arising from or relating to your use or misuse of the Application or your breach of this Agreement, including but not limited to the content you submit or make available through this Application.

        14.Export Regulation. The Application may be subject to US export control laws, including the Export Control Reform Act and its associated regulations. You shall not, directly or indirectly, export, re- export, or release the Application to, or make the Application  accessible from, any jurisdiction or country to which export, re-export, or release is prohibited by law, rule, or regulation. You shall comply with all applicable federal laws, regulations, and rules, and complete all required undertakings (including obtaining any necessary export  license or other governmental approval), prior to exporting, re- exporting, releasing, or otherwise making the Application available outside the US.

        15.US Government Rights. The Application is commercial computer software, as such term is defined in 48 C.F.R. §2.101. Accordingly, if you are an agency of the US Government or any contractor therefor, you receive only those rights with respect to the Application as are granted to all other end users under license, in accordance with (a) 48 C.F.R. §227.7201 through 48 C.F.R. §227.7204, with respect to the Department of Defense and their contractors, or (b) 48 C.F.R. §12.212, with respect to all other US Government licensees and their contractors.

        16.Digital Millennium Copyright Act (“DMCA”). We take claims of copyright infringement seriously. We will respond to notices of alleged copyright infringement that comply with applicable law. If you believe any materials accessible on or from this App infringe your copyright, you may request removal of those materials (or access to them) from the App by submitting written notification to us :

        ●Your physical or electronic signature.

        ●Identification of the copyrighted work you believe to have been infringed or, if the claim involves multiple works on the App, a representative list of such works.

        ●Identification of the material you believe to be infringing in a sufficiently precise manner to allow us to locate that material.

        ●Adequate information by which we can contact you (including your name, postal address, telephone number, and, if available, email address).

        ●A statement that you have a good faith belief that use of the copyrighted material is not authorized by the copyright owner, its agent, or the law.

        ●A statement that the information in the written notice is accurate.

        ●A statement, under penalty of perjury, that you are authorized to act on behalf of the copyright owner.

        If you believe that material you posted on the App was removed or access to it was disabled by mistake or misidentification, you may file a counter notification with us (a "Counter Notice") by submitting written notification to our copyright agent designated below. Pursuant to the DMCA, the Counter Notice must include substantially the following:

        ●Your physical or electronic signature.

        ●An identification of the material that has been removed or to which access has been disabled and the location at which the material appeared before it was removed or access disabled.

        ●Adequate information by which we can contact you (including your name, postal address, telephone number, and, if available, email address).

        ●A statement under penalty of perjury by you that you have a good faith belief that the material identified above was removed or disabled as a result of a mistake or misidentification of the material to be removed or disabled.

        ●A statement that you will consent to the jurisdiction of the Federal District Court for the judicial district in which your address is located (or if you reside outside the United States for any judicial district in which the App may be found) and that you will accept service  from the person (or an agent of that person) who provided the App with the complaint at issue.

        Our designated copyright agent to receive DMCA Notices is:
        Zach Wallin HABUILDIT App (206) 972-9752
        Email id: svaratechnology@gmail.com

        If you fail to comply with all of the requirements of Section 512(c) (3) of the DMCA, your DMCA Notice may not be effective. Please be aware that if you knowingly materially misrepresent that material or activity on the App was removed or disabled by mistake or misidentification, you may be held liable for damages (including costs and attorneys' fees) under Section 512(f) of the DMCA.


        17.Severability. If any provision of this Agreement is illegal or unenforceable under applicable law, the remainder of the provision will be amended to achieve as closely as possible the effect of the original term and all other provisions of this Agreement will continue in full force and effect; provided, however, that if any fundamental term or provision of this Agreement, is invalid, illegal, or unenforceable, the remainder of this Agreement shall be unenforceable.

        18.Governing Law. This Agreement is governed by and construed in accordance with the internal laws of the State of Washington without giving effect to any choice or conflict of law provision or rule. Any legal suit, action, or proceeding arising out of or related to this Agreement or the Application shall be instituted exclusively in the federal courts of the United States or the courts of the State of Washington in each case located in King County. You waive any and all objections to the exercise of jurisdiction over you by such courts and to venue in such courts.

        19.Limitation of Time to File Claims. ANY CAUSE OF ACTION OR CLAIM YOU MAY HAVE ARISING OUT OF OR RELATING TO THIS AGREEMENT OR THE  PPLICATION MUST BE COMMENCED WITHIN ONE (1) YEAR AFTER THE CAUSE OF ACTION ACCRUES OTHERWISE SUCH CAUSE OF ACTION OR CLAIM IS PERMANENTLY BARRED.

        20.Entire Agreement. This Agreement, and our Privacy Policy constitute the entire agreement between you and Company with respect to the Application and supersede all prior or contemporaneous understandings and agreements, whether written or oral, with respect to the Application.

        21.Waiver. No failure to exercise, and no delay in exercising, on the part of either party, any right or any power hereunder shall operate as a waiver thereof, nor shall any single or partial exercise of any right or power hereunder preclude further exercise of that or any other right hereunder. In the event of a conflict between this Agreement and any applicable purchase or other terms, the terms of this Agreement shall govern.
        """
    }

    
}

extension  CMTermsOfServiceVC{
    
    //MARK:-----------[IBACTIONS]---------
    
    @IBAction func buttonTermsOfService(_ sender: UIButton){
        Console.log("buttonTermsOfService")
        popViewController()
    }
    
    
}
