//
//  ExportProgressVC.swift
//  RectProgressBar
//
//  Created by Nazmul on 02/04/2022.
//

import UIKit

class ExportProgressVC: UIViewController {

    @IBOutlet weak var rectProgressBarView: RectProgressBarView!

    @IBOutlet weak var rectProgressBarViewWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var rectProgressBarVIewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        rectProgressBarView.updatingProgressBar = 0.3
        rectProgressBarView.percentage = "\(0.3 * 100)%"
    }
    
    @IBAction func tappedOnCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
