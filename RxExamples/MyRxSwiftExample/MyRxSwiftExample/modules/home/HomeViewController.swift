//
//  HomeViewController.swift
//  MyRxSwiftExample
//
//  Created by Buck on 2019/8/27.
//  Copyright © 2019 Buck. All rights reserved.
//

import UIKit
import RxDataSources
import RxCocoa
import RxSwift


final class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let dataSource = RxTableViewSectionedReloadDataSource<TableSectionItem<RxItem>>(configureCell: {
        ds, tb, indexPath, item -> UITableViewCell in
        let cell = tb.dequeueReusableCell(withClass: UITableViewCell.self)
        cell.textLabel?.text = "\(indexPath.row + 1). \(item.title)"
        return cell
    }, titleForHeaderInSection: { ds, section -> String? in
        return ds[section].header
    })
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "RxSwift Examples"
        configureTableView()
    }
    
    private func configureTableView() {
        
        tableView.registerCell(class: UITableViewCell.self)
        tableView.tableFooterView = UIView()
        
        let sectionOne = TableSectionItem<RxItem>(header: "RxSwift", items: [
            RxItem(title: "点击事件", type: .tap),
            RxItem(title: "注册登录", type: .register),
            RxItem(title: "数据列表", type: .word)
            ])
        
        Observable.just([sectionOne])
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        Observable
            .zip(tableView.rx.modelSelected(RxItem.self), tableView.rx.itemSelected)
            .asObservable()
            .subscribe(onNext: { [weak self] item, indexPath in
                guard let self = self else {
                    return
                }
                self.tableView.deselectRow(at: indexPath, animated: true)
                self.didSelectItem(item.type)
            })
            .disposed(by: disposeBag)
    }
    
    private func didSelectItem(_ type: RxType) {
        var t = UIViewController.self
        switch type {
        case .tap:
            t = TapViewController.self
        case .register:
            t = RegisterViewController.self
        case .word:
            t = JobViewController.self
        }
        self.navigationController?.pushViewController(UIStoryboard.load(controller: t))
    }

}
