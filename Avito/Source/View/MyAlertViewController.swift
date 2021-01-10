//
//  MyAlertViewController.swift
//  Avito
//
//  Created by Юрий Дубровин on 08.01.2021.
//

import UIKit

class MyAlertViewController: UIAlertController {
    var presenter: AlertViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = setupAlert()
        self.message = setupAlert()
        let action = UIAlertAction(title: "ok", style: .cancel) { (action) in}
        self.addAction(action)
    }
}

extension MyAlertViewController:AlertViewProtocol{
    func setupAlert() -> String {
        return presenter.setupAlert()
    }
}
