//
//  ViewController.swift
//  RectProgressBar
//
//  Created by Nazmul on 02/04/2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
       
    }
    
    @IBAction func tappedOnExportButton(_ sender: UIButton) {
        let exportProgressVC = ExportProgressVC()
        exportProgressVC.modalPresentationStyle = .fullScreen
        self.present(exportProgressVC, animated: true, completion: nil)
    }
    

}

