//
//  UINavigationExtension.swift
//  ChangeNaviBar
//
//  Created by jasnig on 16/6/3.
//  Copyright © 2016年 ZeroJ. All rights reserved.
// github: https://github.com/jasnig
// 简书: http://www.jianshu.com/users/fb31a3d1ec30/latest_articles

//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


import UIKit

var alphaViewKey = "alphaViewKey"
extension UINavigationController {
    var zj_alphaView: UIView? {
        set {
            objc_setAssociatedObject(self, &alphaViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        
        get {
            return objc_getAssociatedObject(self, &alphaViewKey) as? UIView
        }
    }
    
    func zj_setBackgroundColor(color: UIColor, alpha: CGFloat) {
        
        if zj_alphaView == nil {
            zj_alphaView = UIView(frame: CGRect(x: 0.0, y: -20.0, width: UIScreen.mainScreen().bounds.width, height: 64.0))
            navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
            navigationBar.shadowImage = UIImage()
        }
        zj_alphaView?.backgroundColor = color.colorWithAlphaComponent(alpha)
        navigationBar.insertSubview(zj_alphaView!, atIndex: 0)
        
        
    }
}
