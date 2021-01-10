//
//  ViewController.swift
//  Avito
//
//  Created by Юрий Дубровин on 30.12.2020.
//

import UIKit

class ViewController: UIViewController {
    var presenter: MainViewPresenterProtocol!
    var colect:UICollectionView!
    let button = UIButton(type: .roundedRect)
    let headLable = UILabel()
    let exitButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createExitBatton()
        self.view.addSubview(exitButton)
        constraintExitButton()
        createHeadLable()
        self.view.addSubview(headLable)
        constraintHeadLable()
        createCollectView()
        view.addSubview(colect)
        createBatton()
        self.view.backgroundColor = .white
        self.view.addSubview(button)
        constraintButton()
        constraintCollectionView()
 
    }
    @objc func didTap(_ sender: Any){
        createAlert()
    }
    func createBatton(){
        button.setTitle(getActionTitle(), for: .normal)
        button.addTarget(self, action: #selector(didTap), for: .touchDown)
        button.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
        button.backgroundColor = UIColor.Separator.buttonColor
        button.tintColor = UIColor.Separator.textButtonColor
        button.layer.cornerRadius = 3
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    func createExitBatton(){
        let imageset = UIImage(named:"CloseIconTemplate")
        exitButton.setImage(imageset, for: .normal)
    }
    func createHeadLable(){
        headLable.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        headLable.text = getheadLableText()
        headLable.font = UIFont.Separator.headLableFont
        headLable.numberOfLines = 0
        headLable.lineBreakMode = .byWordWrapping
        headLable.sizeToFit()
        headLable.translatesAutoresizingMaskIntoConstraints = false
    }
    func createCollectView(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        colect = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        colect.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        colect.dataSource = self
        colect.delegate = self
        colect.backgroundColor = UIColor.Separator.colletionBackgroundColor
        colect.translatesAutoresizingMaskIntoConstraints = false
    }
    func constraintButton(){
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        button.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10).isActive = true
        button.heightAnchor.constraint(greaterThanOrEqualTo: button.widthAnchor, multiplier: 1/6).isActive = true
    }
    func constraintHeadLable(){
        headLable.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        headLable.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        headLable.topAnchor.constraint(equalTo: exitButton.bottomAnchor, constant: 10).isActive = true
    }
    func constraintCollectionView(){
        colect.topAnchor.constraint(equalTo: headLable.bottomAnchor, constant: 10).isActive = true
        colect.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80).isActive = true
        colect.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        colect.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true

    }
    func constraintExitButton(){
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        exitButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        exitButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        exitButton.widthAnchor.constraint(greaterThanOrEqualTo: exitButton.heightAnchor, multiplier: 1/1).isActive = true
    }
}

extension ViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        myCell.setupCell(stat: getStatAt(at: indexPath.row))
        return myCell
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        cell.checkImage.isHidden = true
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        if cell.checkImage.isHidden == false{
            cell.checkImage.isHidden = true
            exchangeIsSelected(at: false)
        }else{
            cell.checkImage.isHidden = false
            exchangeIsSelected(at: true)
            getSelectedTitle(at: cell.headTitle.text!)
            
        }
        button.setTitle(getButtonTitile(), for: .normal)
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { context in
            self.colect.collectionViewLayout.invalidateLayout()
        }, completion: nil)
    }
}

extension ViewController:MainViewProtocol{
    func getheadLableText() -> String {
        presenter.getheadLableText()
    }
    
    func createAlert() {
        presenter.createAlert()
    }
    
    func getSelectedTitle(at: String) {
        presenter.getSelectedTitle(at: at)
    }
    
    func getButtonTitile() -> String {
        return presenter.getButtonTitile()
    }
    
    func exchangeIsSelected(at: Bool) {
        presenter.exchangeIsSelected(at: at)
    }
    
    func getSelectedActionTitle() -> String {
        return presenter.getSelectedActionTitle()
    }
    
    func getActionTitle() -> String {
        return presenter.getActionTitle()
    }
    
    func getCount() -> Int {
        return presenter.getCountElements()
    }
    func getStatAt(at: Int) -> Stat.Result.List {
        return presenter.getStatAt(at: at)
    }
}

