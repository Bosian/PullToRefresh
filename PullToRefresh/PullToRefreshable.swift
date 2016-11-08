//
//  File.swift
//  Test
//
//  Created by 劉柏賢 on 2016/9/24.
//  Copyright © 2016年 劉柏賢. All rights reserved.
//

import UIKit

protocol PullToRefreshable: class {
    
    weak var tableView: UITableView! { get }
    
    func setupPullToRefresh(selector: Selector, attributedTitle: NSAttributedString)
    func refresh(sender: UIRefreshControl)
}

extension PullToRefreshable
{
    func setupPullToRefresh(selector: Selector, attributedTitle: NSAttributedString = NSAttributedString(string: "下拉更新。。。"))
    {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = attributedTitle
        refreshControl.addTarget(self, action: selector, for: .valueChanged)
        
        tableView.addSubview(refreshControl)
    }
}
