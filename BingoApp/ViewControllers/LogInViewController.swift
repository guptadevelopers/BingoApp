//
//  ViewController.swift
//  BingoApp
//
//  Created by Coach USA on 27/02/20.
//  Copyright © 2020 Coach USA Learning. All rights reserved.
//

import UIKit
import GoogleSignIn

class LogInViewController: UIViewController , GIDSignInDelegate {
  
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var signInButton: UIButton!
   // var userName :String = "HIIIIIII"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

         GIDSignIn.sharedInstance()?.presentingViewController = self

         // Automatically sign in the user.
         GIDSignIn.sharedInstance()?.restorePreviousSignIn()
         lblTitle.text = ""

    }

    @IBAction func signInUsingGoogle(_ sender: Any) {
        
        if signInButton.title(for:.normal) == "Sign Out"{
                GIDSignIn.sharedInstance()?.signOut()
            signInButton.setTitle("Sign Up With Gmail", for:.normal)
            lblTitle.text = ""
        }
        else{
            GIDSignIn.sharedInstance()?.delegate = self
             GIDSignIn.sharedInstance()?.signIn()
            // GIDSignIn.sharedInstance().uiDelegate() = self
        }
    }
    
    func openDashboard(name : String )
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MapViewControllerID")as! MapViewController
        vc.UserName = name
        present(vc, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
          if let error = error {
              print("We have error in sign in user == \(error.localizedDescription)")
          }
          else
          {
              if let gmailUser = user
              {
                  lblTitle.text = "You are sign in with id \(String(describing: gmailUser.profile.email))"
                  signInButton.setTitle("Sign Out", for:.normal)
                let nameVal = gmailUser.profile.name!
               //print("Name \(gmailUser.profile.name)"+"\nEmail \(gmailUser.profile.email)"+"\nImage \(gmailUser.profile.imageURL(withDimension: 400))")
                openDashboard(name: nameVal)
              }
              else
              {
                  lblTitle.text = "Output-"
                  signInButton.setTitle("Sign Up With Gmail", for:.normal)
              }
          }
      }

      @IBAction func btnLoginClick(_ sender: Any) {
        openDashboard(name: "Direct Login ")
      }
      
//      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var vcc = segue.destination as!MapViewController
//        vcc.UserName = self.userName
//      }
}



