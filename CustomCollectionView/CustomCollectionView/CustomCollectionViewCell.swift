//
//  CustomCollectionViewCell.swift
//  CustomCollectionView
//
//  Created by logesh on 1/1/20.
//  Copyright © 2020 logesh. All rights reserved.
//

import UIKit


//MARK: - Class
class CustomCollectionViewCell: UICollectionViewCell {
    
    //MARK: - UIComponent
     let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.initImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARk: - Module Function
    func initImageView()  {
        contentView.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
    }
    
    func setupData(imageName : String)  {
        
        imageView.tintColor = UIColor.black
        if let myImage = UIImage(systemName: imageName) {
            let tintableImage = myImage.withRenderingMode(.alwaysTemplate)
            imageView.image = tintableImage
        }
    }
    
    
     override var isSelected: Bool {
        didSet{
            if self.isSelected {
                self.backgroundColor = UIColor(red: 115/255, green: 190/255, blue: 170/255, alpha: 1.0)
            }
            else
            {
                self.backgroundColor = .clear
            }
        }
    }
    
    
    
    
    
        
}
