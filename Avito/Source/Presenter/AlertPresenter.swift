//
//  AlertPresenter.swift
//  Avito
//
//  Created by Юрий Дубровин on 08.01.2021.
//

import Foundation

protocol AlertViewProtocol: class{
    func setupAlert()->String
}

protocol AlertViewPresenterProtocol: class {
    init(view: MyAlertViewController, router: RouterProtocol,string: String)
    func setupAlert()-> String
}

class AlertPresenter: AlertViewPresenterProtocol{

    weak var view: AlertViewProtocol?
    var router: RouterProtocol?
    var string:String
    required init(view:MyAlertViewController, router: RouterProtocol,string: String) {
        self.view = view
        self.router = router
        self.string = string
    }
    func setupAlert()->String {
        return string
    }
}
