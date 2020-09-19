//
//  BaseCollectionView.swift
//  Talkies
//
//  Created by santhoshkumar nampally on 23/03/20.
//  Copyright © 2020 santhoshkumar nampally. All rights reserved.
//

import UIKit

enum ViewType {
    case collectionView
    case tableView
}

protocol BaseListViewDataSource: class {
    func numberOfSections(_ type:ViewType) -> Int
    func numberOfRowsForSection(_ section: Int, type:ViewType) -> Int
    func sizeForItemAtIndex(_ indexPath: IndexPath, type:ViewType) -> CGSize
    func cardConfigForIndexPath(_ indexPath: IndexPath, type:ViewType) -> CardConfig
    func dataSourceForCellAtIndex(_ indexPath: IndexPath, type:ViewType) -> BaseCardCellDataSource
    func minimumInterItemSpacing(_ section: Int, type:ViewType) -> CGFloat
    func minimumLineSpacing(_ section: Int, type:ViewType) -> CGFloat
}

extension BaseListViewDataSource {
    func minimumInterItemSpacing(_ section: Int, type:ViewType) -> CGFloat {
        return 10
    }

    func minimumLineSpacing(_ section: Int, type:ViewType) -> CGFloat {
        return 10
    }
}

protocol BaseListViewDelegate: class {
    
}

class BaseListView: UIView {
    @IBOutlet weak var collectionView: UICollectionView?
    @IBOutlet weak var tableView: UITableView?
    
    
    weak var baseDataSource: BaseListViewDataSource? {
        didSet {
            reloadData()
        }
    }
    weak var baseDelegate: BaseListViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView?.backgroundColor = .clear
        tableView?.backgroundColor = .clear
    }
    
    func reloadData() {
        reloadTableViewData()
        registerCells()
        collectionView?.reloadData()
    }
    
    func reloadTableViewData()
    {
        registerTableViewCells()
        tableView?.reloadData()
    }
    
    func registerCells() {
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        let sections = baseDataSource?.numberOfSections(.collectionView) ?? 0
        
        for section in 0..<sections {
            let rows = baseDataSource?.numberOfRowsForSection(section, type: .collectionView) ?? 0
            
            for row in 0..<rows {
                if let config = baseDataSource?.cardConfigForIndexPath(IndexPath(row: row, section: section), type: .collectionView) {
                    collectionView?.register(UINib(nibName: config.nibName, bundle: config.bundle), forCellWithReuseIdentifier: config.reuseIdentifier)
                }
            }
        }
    }
    
    func registerTableViewCells() {
        tableView?.delegate = self
        tableView?.dataSource = self
        
        let sections = baseDataSource?.numberOfSections(.tableView) ?? 0
        
        for section in 0..<sections {
            let rows = baseDataSource?.numberOfRowsForSection(section, type: .tableView) ?? 0
            
            for row in 0..<rows {
                if let config = baseDataSource?.cardConfigForIndexPath(IndexPath(row: row, section: section), type: .tableView) {
                    tableView?.register(UINib(nibName: config.nibName, bundle: config.bundle), forCellReuseIdentifier: config.reuseIdentifier)
                }
            }
        }
    }
    
    func reloadcell(_ ref: BaseTableViewCell) {
        
    }
}

extension BaseListView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return baseDataSource?.numberOfSections(.collectionView) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return baseDataSource?.numberOfRowsForSection(section, type: .collectionView) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cellConfig = baseDataSource?.cardConfigForIndexPath(indexPath, type: .collectionView) {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellConfig.reuseIdentifier, for: indexPath) as? BaseCardCollectionViewCell {
                cell.updateData(dataSource: baseDataSource?.dataSourceForCellAtIndex(indexPath, type: .collectionView) as? BaseCardCollectionViewCellDataSource)
                cell.updateDelegate(delegate: self)
                return cell
            }
        }
        
        return UICollectionViewCell()
    }
}

extension BaseListView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
    }
}

extension BaseListView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return baseDataSource?.sizeForItemAtIndex(indexPath, type: .collectionView) ?? CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return baseDataSource?.minimumLineSpacing(section, type: .collectionView) ?? 10

    }

    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

        return baseDataSource?.minimumInterItemSpacing(section, type: .collectionView) ?? 10

    }
}

extension BaseListView: BaseCardCollectionViewCellDelegate,BaseTableViewCellDelegate  {
   
}

extension BaseListView: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return baseDataSource?.numberOfSections(.tableView) ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return baseDataSource?.numberOfRowsForSection(section, type: .tableView) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cellConfig = baseDataSource?.cardConfigForIndexPath(indexPath, type: .tableView)
        {
            if let cell = tableView.dequeueReusableCell(withIdentifier: cellConfig.reuseIdentifier, for: indexPath) as? BaseTableViewCell {
                cell.updateData(dataSource: baseDataSource?.dataSourceForCellAtIndex(indexPath, type: .tableView) as? BaseTableViewCellDataSource)
                cell.updateDelegate(delegate: self)
                return cell
            }
        }
        
        return UITableViewCell()
    }
}

extension BaseListView: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return baseDataSource?.sizeForItemAtIndex(indexPath, type: .tableView).height ?? 40
    }
}


