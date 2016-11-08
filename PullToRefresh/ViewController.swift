//
//  ViewController.swift
//  PullToRefresh
//
//  Created by 劉柏賢 on 2016/11/9.
//  Copyright © 2016年 劉柏賢. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PullToRefreshable {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPullToRefresh(selector: #selector(refresh(sender:)))
    }
    
    /// 下拉更新
    ///
    /// - Parameter sender: sender description
    func refresh(sender: UIRefreshControl) {
        
        print("下載資料")
        
        // 3秒後停止更新
        DispatchQueue.global().asyncAfter(deadline: .now() + 3, execute: { [weak self] in
            
            // UI Thread
            DispatchQueue.main.async {
                
                print("下載完成")
                
                sender.endRefreshing()
                
                self?.tableView.reloadData()
            }
        })
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let id = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        
        return cell
    }
}
