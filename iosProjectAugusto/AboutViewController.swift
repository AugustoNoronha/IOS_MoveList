//
//  AboutViewController.swift
//  iosProjectAugusto
//
//  Created by COTEMIG on 03/12/21.
//

import UIKit
import Kingfisher

class AboutViewController: UIViewController {

    @IBOutlet weak var rateText: UILabel!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var overviewText: UILabel!

    var moveTitle = "";
    var overview = "";
    var releaseDate = "";
    var rateP = "";

    override func viewDidLoad() {
        super.viewDidLoad()
        titleText.text = moveTitle
        dateText.text = releaseDate
        overviewText.text = overview
        rateText.text = rateP
        print( moveTitle , overview, releaseDate)
    }

}
