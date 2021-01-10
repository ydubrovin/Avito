//
//  MainPresenter.swift
//  Avito
//
//  Created by Юрий Дубровин on 02.01.2021.
//

import Foundation

protocol MainViewProtocol: class{
    func getStatAt(at: Int) -> Stat.Result.List
    func getCount()->Int
    func getSelectedActionTitle()->String
    func getActionTitle()->String
    func exchangeIsSelected(at: Bool)
    func getButtonTitile()-> String
    func getSelectedTitle(at: String)
    func createAlert()
    func getheadLableText()->String
}

protocol MainViewPresenterProtocol: class {
    init(view: MainViewProtocol, router: RouterProtocol)
    func decode(json:String)
    func getStatAt(at:Int)->Stat.Result.List
    func getCountElements()->Int
    func getSelectedActionTitle()->String
    func getActionTitle()->String
    func exchangeIsSelected(at: Bool)
    func getButtonTitile()-> String
    func getSelectedTitle(at: String)
    func getTitleAlert()-> String
    func createAlert()
    func getheadLableText()->String
}

class MainPresenter: MainViewPresenterProtocol{
    fileprivate let json = """
    {
      "status": "ok",
      "result": {
        "title": "Сделайте объявление заметнее на 7 дней",
        "actionTitle": "Продолжить без изменений",
        "selectedActionTitle": "Выбрать",
        "list": [
          {
            "id": "xl",
            "title": "XL объявление",
            "description": "Пользователи смогут посмотреть фотографии, описание и телефон прямо из результатов поиска.",
            "icon": {
              "52x52": "https://www.avito.ru/s/common/components/monetization/icons/apps/vas-xl-52.png"
            },
            "price": "356 ₽",
            "isSelected": true
          },
          {
            "id": "highlight",
            "title": "Выделение",
            "description": "Яркий цвет не даст затеряться среди других объявлений.",
            "icon": {
              "52x52": "https://www.avito.ru/s/common/components/monetization/icons/apps/vas-highlight-52.png"
            },
            "price": "299 ₽",
            "isSelected": true
          },
          {
            "id": "x10_1",
            "title": "До 10 раз больше просмотров на 1 день",
            "icon": {
              "52x52": "https://www.avito.ru/s/common/components/monetization/icons/apps/vas-x10_1-52.png"
            },
            "price": "400 ₽",
            "isSelected": false
          },
          {
            "id": "x5_1",
            "title": "До 5 раз больше просмотров на 1 день",
            "icon": {
              "52x52": "https://www.avito.ru/s/common/components/monetization/icons/apps/vas-x5_1-52.png"
            },
            "price": "230 ₽",
            "isSelected": false
          },
          {
            "id": "x2_1",
            "title": "До 2 раз больше просмотров на 1 день",
            "icon": {
              "52x52": "https://www.avito.ru/s/common/components/monetization/icons/apps/vas-x2_1-52.png"
            },
            "price": "100 ₽",
            "isSelected": false
          }
        ]
      }
    }
    """
    fileprivate var statbuf: Stat!
    weak var view: MainViewProtocol?
    var router: RouterProtocol?
    fileprivate var isSelected = false
    fileprivate var selectedTitle = ""
    required init(view:MainViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
        decode(json:json)
    }
    func decode(json:String){
        let inputData = json.data(using: .utf8)!
        let decoder = JSONDecoder()
        statbuf = try! decoder.decode(Stat.self, from: inputData)
    }
    func getStatAt(at: Int) -> Stat.Result.List {
        return statbuf.result.list[at]
    }
    func getCountElements()->Int{
        return statbuf.result.list.filter{$0.isSelected == true}.count
    }
    func getActionTitle()->String{
        return statbuf.result.actionTitle
    }
    func getSelectedActionTitle()->String{
        return statbuf.result.selectedActionTitle
    }
    func exchangeIsSelected(at: Bool){
        self.isSelected = at
    }
    func getButtonTitile()-> String{
        if self.isSelected == true{
            return statbuf.result.selectedActionTitle
        }else{
            return statbuf.result.actionTitle
        }
    }
    func getTitleAlert()-> String{
        if self.isSelected == true{
            return self.selectedTitle
        }else{
            return statbuf.result.actionTitle
        }
    }
    func getSelectedTitle(at: String){
        self.selectedTitle = at
    }
    func createAlert() {
        router?.get(string: getTitleAlert())
    }
    func getheadLableText()->String{
        self.statbuf.result.title
    }
    
}
