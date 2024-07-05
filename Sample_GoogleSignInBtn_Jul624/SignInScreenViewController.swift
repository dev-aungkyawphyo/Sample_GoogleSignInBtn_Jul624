//
//  ViewController.swift
//  Sample_GoogleSignInBtn_Jul624
//
//  Created by Aung Kyaw Phyo on 06/07/2024.
//

import UIKit
import GoogleSignIn

class SignInScreenViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet weak var signoutBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

// MARK: @IBAction

extension SignInScreenViewController {
    @IBAction func didTappedSignInBtnAction(_ sender: UIButton) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { GIDSignInResult, error in
            self.signinBtn.isHidden = false
            self.signoutBtn.isHidden = true
            self.descriptionLabel.text = "Welcome To GoogleSignIn! To continue with GoogleSignIn please hit below button."
            guard error == nil else { return }
            
            // If sign in succeeded, display the app's main content View.
            guard let signInResult = GIDSignInResult else { return }
            let user = signInResult.user
            
            let emailAddress = user.profile?.email
            let fullName = user.profile?.name
            let familyName = user.profile?.familyName
            let profilePicUrl = user.profile?.imageURL(withDimension: 320)
            
            self.descriptionLabel.text = "Hey thre, \(fullName ?? "")!"
            self.signinBtn.isHidden = true
            self.signoutBtn.isHidden = false
        }
    }
    
    @IBAction func didTappedSignOutBtnAction(_ sender: UIButton) {
        GIDSignIn.sharedInstance.signOut()
    }
}
