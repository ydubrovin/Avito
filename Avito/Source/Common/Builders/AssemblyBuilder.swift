//
//  AssemblyBuilder.swift
//  Avito
//
//  Created by Юрий Дубровин on 02.01.2021.
//

import Foundation
import UIKit
protocol AssemblyBuilderProtocol{
    func createmain(router: RouterProtocol) -> UIViewController
    func createAlert(router: RouterProtocol,string:String) ->UIAlertController
}

class AssemblyModuleBuilder: AssemblyBuilderProtocol{
    func createmain(router: RouterProtocol) -> UIViewController {
        let view = ViewController()
        let presenter = MainPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    func createAlert(router: RouterProtocol,string: String) ->UIAlertController{
        let alert = MyAlertViewController(title: "", message: "", preferredStyle: .actionSheet)
        let presenter = AlertPresenter(view: alert, router: router,string: string)
        alert.presenter = presenter
        return alert
    }
}
