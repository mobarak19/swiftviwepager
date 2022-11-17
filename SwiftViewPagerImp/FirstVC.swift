//
//  FirstVC.swift
//  SwiftViewPagerImp
//
//  Created by Genusys Inc on 11/17/22.
//

import UIKit

class FirstVC: UIViewController {

    private let myLable:UILabel = {
        let lbl = UILabel()
        lbl.text = "Hello".localized()
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 32, weight: .semibold)
        return lbl
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        view.addSubview(myLable)
        myLable.frame = view.bounds
    }
}
extension String{
    func localized()->String{
        return NSLocalizedString(self,tableName: "Localizable",bundle: .main, value: self, comment: self)
    }
}
