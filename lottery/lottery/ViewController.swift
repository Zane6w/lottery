//
//  ViewController.swift
//  lottery
//
//  Created by zhi zhou on 2016/10/18.
//  Copyright © 2016年 zhi zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    var topView: UIView!
    var leftView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK:- scrollView 代理方法
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        topView.frame.origin.y = scrollView.contentOffset.y
        leftView.frame.origin.x = scrollView.contentOffset.x
    }

}

// MARK:- 联动 View 的初始化
extension ViewController {
    /// 初始化滚动 View
    func setupView() {
        /// 左上角占位
        let place: CGFloat = 40.0
        
        /* 按顺序初始化，防止遮挡问题*/
        
        // 初始化内容显示区域 View
        let contentView = UIView(frame: CGRect(x: place, y: place, width: 1000, height: 1000))
        
        let contentImageView = UIImageView(frame: contentView.bounds)
        contentImageView.image = UIImage(named: "basic")
        contentView.addSubview(contentImageView)
        
        scrollView.addSubview(contentView)
        
        // 初始化顶部 View
        topView = UIView(frame: CGRect(x: place, y: 0, width: 1000, height: 40))
        
        let topImageView = UIImageView(frame: topView.bounds)
        topImageView.image = UIImage(named: "topImage")
        topView.addSubview(topImageView)
        
        scrollView.addSubview(topView)
        
        // 初始化左侧 View
        leftView = UIView(frame: CGRect(x: 0, y: place, width: 40, height: 1000))
        
        let leftImageView = UIImageView(frame: leftView.bounds)
        leftImageView.image = UIImage(named: "leftImage")
        leftView.addSubview(leftImageView)
        
        scrollView.addSubview(leftView)
        
        // 初始化左上角遮挡 View
        let placeView = UIView(frame: CGRect(x: 0, y: 0, width: place, height: place))
        placeView.backgroundColor = UIColor.white
        view.addSubview(placeView)
        
        // 设置 scrollView 的 contentSize
        scrollView.contentSize = CGSize(width: place + topView.frame.size.width, height: place + leftView.frame.size.height)
    }
}
