//
//  CollectionViewCell.swift
//  Avito
//
//  Created by Юрий Дубровин on 04.01.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    let headTitle = UILabel()
    let title = UILabel()
    let price = UILabel()
    var checkImage = UIImageView()
    var headImage = UIImageView()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func setupCell(stat:Stat.Result.List){
        self.headImage.frame = CGRect(x: 10, y: 10, width: 10, height: 10)
        self.checkImage.frame = CGRect(x: 10, y: 10, width: 10, height: 10)
        self.checkImage.image = UIImage(named:"checkmark")
        self.addSubview(checkImage)
        self.addSubview(headImage)
        self.headImage.load(url: URL(string: stat.icon["52x52"]!)!)
        constraintHeadImage()
        self.headTitle.frame = CGRect(x: 10, y: 10, width: 0, height: 0)
        self.addSubview(headTitle)
        self.headTitle.text = stat.title
        self.headTitle.sizeToFit()
        self.headTitle.font = UIFont.Separator.headTitleFont
        constraintHeadTitle()
        self.title.frame = CGRect(x: 10, y: 10, width: 0, height: 0)
        self.title.text = stat.description
        self.title.sizeToFit()
        self.title.numberOfLines = 0
        self.title.lineBreakMode = .byWordWrapping
        print(title.bounds.height)
        self.addSubview(title)
        self.title.font = UIFont.Separator.cellTitle
        constraintTitle()
        self.price.frame = CGRect(x: 10, y: 10, width: 10, height: 10)
        self.title.sizeToFit()
        self.addSubview(price)
        self.price.text = stat.price
        constraintPrice()
        self.backgroundColor = UIColor.Separator.cellColor
        self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30).isActive = true
        self.layer.cornerRadius = 10
        self.checkImage.isHidden = true
        constraintCheckImage()
        let newSize1 = self.title.sizeThatFits(CGSize(width:self.headTitle.bounds.width,height:CGFloat.greatestFiniteMagnitude))
        self.heightAnchor.constraint(equalToConstant: headImage.bounds.height + headTitle.bounds.height + newSize1.height + price.bounds.height).isActive = true
    }
    func exchangeVisibleCurentImage(){
        if self.checkImage.isHidden == false{
            self.checkImage.isHidden = true
        }else{
            self.checkImage.isHidden = false
        }
    }
    func constraintHeadImage(){
        headImage.translatesAutoresizingMaskIntoConstraints = false
        self.headImage.topAnchor.constraint(equalTo: self.topAnchor,constant: 10).isActive = true
        self.headImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        self.headImage.widthAnchor.constraint(equalToConstant: 55).isActive = true
        self.headImage.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }
    func constraintHeadTitle(){
        headTitle.translatesAutoresizingMaskIntoConstraints = false
        self.headTitle.topAnchor.constraint(equalTo: self.topAnchor,constant: 4).isActive = true
        self.headTitle.leftAnchor.constraint(equalTo: self.headImage.rightAnchor, constant: 10).isActive = true
        self.headTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40).isActive = true
    }
    
    func constraintTitle(){
        title.translatesAutoresizingMaskIntoConstraints = false
        self.title.topAnchor.constraint(equalTo: self.headTitle.bottomAnchor, constant: 10).isActive = true
        self.title.leftAnchor.constraint(equalTo: self.headTitle.leftAnchor, constant: 0).isActive = true
        self.title.rightAnchor.constraint(equalTo: self.headTitle.rightAnchor, constant: 0).isActive = true
    }
    
    func constraintPrice(){
        price.translatesAutoresizingMaskIntoConstraints = false
        self.price.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 10).isActive = true
        self.price.leftAnchor.constraint(equalTo: self.title.leftAnchor, constant: 0).isActive = true
    }
    func constraintCheckImage(){
        self.checkImage.translatesAutoresizingMaskIntoConstraints = false
        self.checkImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        self.checkImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
    }

}

