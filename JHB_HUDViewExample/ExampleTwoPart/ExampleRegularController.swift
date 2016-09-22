//
//  ExampleRegularController.swift
//  JHB_HUDViewExample
//
//  Created by Leon_pan on 16/8/23.
//  Copyright © 2016年 bruce. All rights reserved.
//

import UIKit

class ExampleRegularController: UITableViewController {
    var SCREEN_WIDTH = UIScreen.main.bounds.size.width
    var SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    
    
    // 声明一个数组,用来储存cell
    var cellArr = NSMutableArray()
    // 标示
    var ID = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Regular-Type"
        self.setTableView()
    }
    
    
    func setTableView() {
        // 注册cell
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: ID)
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
    }
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ID, for: indexPath)
        cell.textLabel?.numberOfLines = 0
        
        if (indexPath as NSIndexPath).row == 0 {
            cell.textLabel?.text = "1⃣️JHB_HUDView 显示进程(转圈圈~)"
        }else if (indexPath as NSIndexPath).row == 1{
            cell.textLabel?.text = "2⃣️JHB_HUDView 显示进程和信息(转圈圈还有字~)"
        }else if (indexPath as NSIndexPath).row == 2{
            cell.textLabel?.text = "3⃣️JHB_HUDView 显示单行信息~"
        }else if (indexPath as NSIndexPath).row == 3{
            cell.textLabel?.text = "4⃣️JHB_HUDView 显示多行信息~"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath as NSIndexPath).row == 0 {
            let secondVc = ExampleRegularDetailController()
            secondVc.coretype = .coreTypeCircle
            self.navigationController?.pushViewController(secondVc, animated: true)
        }else if (indexPath as NSIndexPath).row == 1 {
            let secondVc = ExampleRegularDetailController()
            secondVc.coretype = .coreTypeCircleWithMsg
            self.navigationController?.pushViewController(secondVc, animated: true)
        }else if (indexPath as NSIndexPath).row == 2 {
            let secondVc = ExampleRegularDetailController()
            secondVc.coretype = .coreTypeSingleMsg
            self.navigationController?.pushViewController(secondVc, animated: true)
        }else if (indexPath as NSIndexPath).row == 3 {
            let secondVc = ExampleRegularDetailController()
            secondVc.coretype = .coreTypeMultiMsg
            self.navigationController?.pushViewController(secondVc, animated: true)
            
        }
    }
    
    // 设置header 和 footer
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UILabel.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 60))
        header.text = "Regular-Type中暂有四种展示类型哦~!😊"
        header.sizeToFit()
        header.numberOfLines = 0
        header.textColor = UIColor.white
        header.font = UIFont.systemFont(ofSize: 18)
        header.textAlignment = NSTextAlignment.center
        header.backgroundColor = UIColor.orange
        return header
    }
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UILabel.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 60))
        footer.text = "是的,每种展示都有许多效果可供选择~!😂"
        footer.sizeToFit()
        footer.numberOfLines = 0
        footer.textColor = UIColor.white
        footer.font = UIFont.systemFont(ofSize: 18)
        footer.textAlignment = NSTextAlignment.center
        footer.backgroundColor = UIColor.orange
        return footer
        
    }
    // ❤️ 如果要展示header 或 footer 就必须要设置他们的高度值!
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

}
