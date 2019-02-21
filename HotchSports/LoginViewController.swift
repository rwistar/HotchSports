//
//  LoginViewController.swift
//  HotchSports
//
//  Created by Roger Wistar on 2/21/19.
//  Copyright © 2019 The Hotchkiss School. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var lblMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func pressedLogin(_ sender: UIButton) {
        if let password = txtPassword.text {
            if password == "Bearcats" {
                performSegue(withIdentifier: "segueLogin", sender: self)
            } else {
                lblMessage.text = "Sorry, incorrect. Try again..."
            }
        }
    }
    

}
