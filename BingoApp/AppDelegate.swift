//
//  AppDelegate.swift
//  BingoApp
//
//  Created by Coach USA on 27/02/20.
//  Copyright © 2020 Coach USA Learning. All rights reserved.
//

import UIKit
import GoogleSignIn
//import GoogleMaps
//import GooglePlaces

//Step 1 Add GIDSignInDelegate
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,GIDSignInDelegate {

    // [END appdelegate_interfaces]
     var window: UIWindow?
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration
    {
        
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    //Adding methods for the google signIn...
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
          
          //Step 2 Add SigInKeys
          // Initialize sign-in
          GIDSignIn.sharedInstance().clientID = "462670869345-pm46la4a2s5tc5sk72v6m2jpmuh95im4.apps.googleusercontent.com"
          GIDSignIn.sharedInstance().delegate = self
        
//        GMSServices.provideAPIKey("AIzaSyB1KGUP3r_i1ET2UymtrrAOnRNKbeSrJ-A")
//        GMSPlacesClient.provideAPIKey("AIzaSyB1KGUP3r_i1ET2UymtrrAOnRNKbeSrJ-A")

          
          // Override point for customization after application launch.
          return true
      }
   
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
       return GIDSignIn.sharedInstance().handle(url)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
        if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
          print("The user has not signed in before or they have since signed out.")
        } else {
          print("\(error.localizedDescription)")
        }
        return
      }
      // Perform any operations on signed in user here.
      let userId = user.userID                  // For client-side use only!
      let idToken = user.authentication.idToken // Safe to send to the server
      let fullName = user.profile.name
      let givenName = user.profile.givenName
      let familyName = user.profile.familyName
      let email = user.profile.email
      // ...
   }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
         // Perform any operations when the user disconnects from app here.
        // ...
    }
    

}

