//
//  SavedViewController.swift
//  CustomCollectionView
//
//  Created by logesh on 1/1/20.
//  Copyright © 2020 logesh. All rights reserved.
//

import UIKit

class SavedViewController: UIViewController {

    fileprivate var displayLabel : UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel(frame: CGRect(x: 100, y: 50, width: 40, height: 40))
        label.textAlignment = NSTextAlignment.center
        label.text = "This is Saved ViewController"
        self.view.addSubview(label)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
