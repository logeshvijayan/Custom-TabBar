//
//  ViewController.swift
//  CustomCollectionView
//
//  Created by logesh on 1/1/20.
//  Copyright © 2020 logesh. All rights reserved.
//

import UIKit

enum SelectedTab : Int {
    case list = 0
    case person = 1
    case files = 2
    case saved = 3
}




//MARK: - Class
class ViewController: UIViewController {
    
    //MARK: - UI Components
    var tabImage : [String] = ["list.dash","person","folder","bookmark"]
    fileprivate let CSCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        return cv
    }()
    fileprivate let displayView : UIView = {
        let view = UIView.init(frame: CGRect(x: 0, y: 40, width: 500, height: 785))
        return view
    }()
    fileprivate let customLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 250, width: 300, height: 300))
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initCollectionView()
    }
    
    
    //MARK: - Module Function
    func initCollectionView(){
        view.addSubview(CSCollectionView)
        CSCollectionView.backgroundColor = .white
        CSCollectionView.delegate = self
        CSCollectionView.dataSource = self
        CSCollectionView.allowsMultipleSelection = false
        CSCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 830).isActive = true
        CSCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        CSCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        CSCollectionView.heightAnchor.constraint(equalToConstant:view.frame.height/14 ).isActive = true
}
    func selectedView(selectedIndex : Int)  {
      
        view.addSubview(displayView)
        displayView.addSubview(customLabel)
        switch SelectedTab(rawValue: selectedIndex)  {
        case .files :
            customLabel.text = "Selected Tab is List"
            displayView.backgroundColor = .blue
         case .person :
            customLabel.text = "Selected Tab is Person"
            displayView.backgroundColor = .red
        case  .list :
            customLabel.text = "Selected Tab is Files"
            displayView.backgroundColor = .yellow
        case .saved :
            customLabel.text = "Selected Tab is Saved"
            displayView.backgroundColor = .cyan
        case .none:
            print("Worked")
        }
    }
    
}


//MARK: - Collection View Delegate and DataSource
extension ViewController : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let CvCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
        CvCell.setupData(imageName: tabImage[indexPath.row])
        return CvCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 60.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 40, height: 40)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedView(selectedIndex: indexPath.row)
    }
}

