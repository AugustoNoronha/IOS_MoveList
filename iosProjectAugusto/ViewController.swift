//
//  ViewController.swift
//  iosProjectAugusto
//
//  Created by COTEMIG on 03/12/21.
//

import UIKit

class ViewController: UIViewController {

   
    @IBAction func btnGo(_ sender: Any) {
        performSegue(withIdentifier: "go", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


}

