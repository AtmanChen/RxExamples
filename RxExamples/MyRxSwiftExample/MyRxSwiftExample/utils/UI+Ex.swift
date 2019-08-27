//
//  UIViewController+Ex.swift
//  MyRxSwiftExample
//
//  Created by Buck on 2019/8/27.
//  Copyright © 2019 Buck. All rights reserved.
//

import UIKit
import SwifterSwift

extension UIViewController {
    
    
    
}

extension UIColor {
    class var master: UIColor {
        return UIColor(red: 48/255.0, green: 175/255.0, blue: 145/255.0, alpha: 1)
        
    }
    
    class var c78: UIColor {
        return UIColor(hexString: "787f87")!
    }
    
    class var bg: UIColor {
        return UIColor.groupTableViewBackground
    }
}

extension UINavigationBar {
    
    static func configAppearance() {
        
        appearance().shadowImage = UIImage()
        appearance().tintColor = UIColor.white
        appearance().barTintColor = .master
        appearance().isTranslucent = false
        appearance().clipsToBounds = false
        appearance().backgroundColor = .master
        appearance().setBackgroundImage(UIImage(),
                                        for: UIBarPosition.any,
                                        barMetrics: UIBarMetrics.default)
        appearance().titleTextAttributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17),
                                            NSAttributedString.Key.foregroundColor: UIColor.white]}
}


extension UITableView {
    func registerCell<T: UITableViewCell>(class cell: T.Type) {
        register(cell.self, forCellReuseIdentifier: cell.className)
    }
    
    func dequeueReusable<T: UITableViewCell>(class cell: T.Type) -> T {
        guard let aCell = dequeueReusableCell(withIdentifier: cell.className) as? T else {
            fatalError("Couldn't find UITableViewCell for \(cell.className), make sure the cell is registered with table view")
        }
        return aCell
    }
    
    func registerCell<T: UITableViewCell>(nib cell: T.Type) {
        register(UINib(nibName: cell.className, bundle: nil), forCellReuseIdentifier: cell.className)
    }
}

extension NSObject {
    
    class var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return String(describing: type(of: self))
    }
}

extension UIStoryboard {
    
    static func load<T:UIViewController>(controller: T.Type) -> T {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: controller.className) as? T else {
            fatalError("请检查 `\(controller.className)` 是否存在，以及在 Main.storyboard 中 是否设置了 `Storyboard ID` 。")
        }
        return vc
    }
}
