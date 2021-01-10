//
//  FontConstant.swift
//  Avito
//
//  Created by Юрий Дубровин on 09.01.2021.
//

import UIKit
extension UIFont{
    enum Separator{
        static var headLableFont:UIFont{
            return .boldSystemFont(ofSize: 24)
        }
        static var headTitleFont:UIFont{
            return .boldSystemFont(ofSize: 20)
        }
        static var cellTitle:UIFont{
            return .systemFont(ofSize: 15)
        }
    }
}
