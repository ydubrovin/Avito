//
//  Router.swift
//  Avito
//
//  Created by Юрий Дубровин on 02.01.2021.
//

import Foundation
import UIKit

protocol RouterMain {
    var assemlyBuilder: AssemblyBuilderProtocol? {get set}
    var mainVC:UIViewController?{get set}
}

protocol RouterProtocol: RouterMain{
    func initialViewController()
    func get(string: String)
}

class Router: RouterProtocol{
    var assemlyBuilder: AssemblyBuilderProtocol?
    var mainVC: UIViewController?
    
    init(assemlyBuilder: AssemblyBuilderProtocol ) {
        self.assemlyBuilder = assemlyBuilder
    }
    
    func initialViewController() {
        guard let searchCriteriasVC = assemlyBuilder?.createmain(router: self) else {return}
        self.mainVC = searchCriteriasVC
    }
    
    func get(string: String){
        guard let alert = assemlyBuilder?.createAlert(router: self, string: string) else {return}
        mainVC!.present(alert, animated: true, completion: nil)
    }
}
