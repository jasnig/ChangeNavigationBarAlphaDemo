//
//  ViewController.swift
//  ChangeNaviBar
//
//  Created by jasnig on 16/5/29.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.redColor()
        tableView.backgroundColor = UIColor.clearColor()
        navigationItem.leftBarButtonItem = addNavBtn("返回")
        navigationItem.rightBarButtonItem = addNavBtn("测试")
        
//        navigationController?.navigationBar.barTintColor = UIColor.redColor()
        //背景色
//        let image = drawImageFromColor(UIColor.redColor().colorWithAlphaComponent(1.0), size: CGSize(width: view.bounds.width, height: 64.0))
        
//        navigationController?.navigationBar.setBackgroundImage(image, forBarMetrics: .Default)
        
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
//        navigationController?.navigationBar.shadowImage = UIImage()
////
//        let test = UIView(frame: CGRect(x: 0.0, y: -20.0, width: UIScreen.mainScreen().bounds.size.width, height: 64.0))
//        test.backgroundColor = UIColor.redColor()
//        navigationController?.navigationBar.insertSubview(test, atIndex: 0)
        
        // 使用分类
        navigationController?.zj_setBackgroundColor(UIColor.redColor(), alpha: 1.0)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addNavBtn(title: String) -> UIBarButtonItem {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        btn.setTitle(title, forState: .Normal)
        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        return UIBarButtonItem(customView: btn)
    }



}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
        cell.textLabel?.text = "ceshi \(indexPath.row)"
        return cell
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y

        if offsetY <= 0 {
            let alpha = offsetY / -64.0
            setNavAlpha(alpha)
        } else {
            setNavAlpha(0.0)
        }
    }
    
    func setNavAlpha(alpha: CGFloat) {
        //1.没有效果
        //navigationController?.navigationBar.alpha = alpha
        //2. 没有效果
//        navigationController?.navigationBar.barTintColor = UIColor(red: 223.0/255.0, green: 223.0/255.0, blue: 223.0/255.0, alpha: alpha)
        //3. 动态更改背景图片的alpha
//        let image = drawImageFromColor(UIColor.redColor().colorWithAlphaComponent(alpha), size: CGSize(width: view.bounds.width, height: 64.0))
//        navigationController?.navigationBar.setBackgroundImage(image, forBarMetrics: .Default)

        //4.改变添加的view的alpha
//        navigationController?.navigationBar.subviews.first?.alpha = alpha
        
        navigationController?.zj_setBackgroundColor(UIColor.redColor(), alpha: alpha)
    }
    
    func drawImageFromColor(color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.set()
        UIRectFill(CGRect(origin: CGPointZero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
        
    }
}

