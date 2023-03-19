//
//  ViewController.swift
//  UIKit_Marathon_7
//
//  Created by user228564 on 3/19/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let scrollView = UIScrollView(frame: view.bounds)
        let imageView = UIImageView(image: UIImage(named: "hosegoat.png"))
        
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 270)
        
        scrollView.addSubview(imageView)
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 1000)
        
        view.addSubview(scrollView)
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let shiftVertical = scrollView.contentOffset.y
        let imageView = scrollView.subviews.first as? UIImageView
        imageView?.frame.origin.y = min(0, shiftVertical)
        imageView?.frame.size.height = max(270 - shiftVertical, 270)
        
        scrollView.showsVerticalScrollIndicator = true
        
        switch shiftVertical {
        case _ where shiftVertical < 0:
            scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 210 - shiftVertical, left: 0, bottom: 180 - shiftVertical, right: 0)
        case _ where shiftVertical > 0:
            scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 210 + shiftVertical, left: 0, bottom: 180 - shiftVertical, right: 0)
        default:
            scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 210, left: 0, bottom: 180 - shiftVertical, right: 0)
        }
    }
    
}
