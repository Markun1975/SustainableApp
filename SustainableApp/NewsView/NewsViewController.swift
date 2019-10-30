//
//  NewsViewController.swift
//  SustainableApp
//
//  Created by Masaki on 9/27/1 R.
//  Copyright © 1 Reiwa Sugita Masaki. All rights reserved.
//

import UIKit
import SegementSlide

class NewsViewController: SegementSlideViewController {
    


    override func viewDidLoad() {
        super.viewDidLoad()
        

        reloadData()
        scrollToSlide(at: 0, animated: true)
        
    }
    

//    override var headerView: UIView?{
//
//        let headerView = UIImageView()
//        headerView.isUserInteractionEnabled = true
//        headerView.contentMode = .scaleToFill
//        headerView.image = UIImage(named: "news")
//        headerView.translatesAutoresizingMaskIntoConstraints = false
//        let headerHeight:CGFloat
//        if #available(iOS 11.0, *){
//            headerHeight = view.bounds.height/5 + view.safeAreaInsets.top
//        } else{
//            headerHeight = view.bounds.height/5 + topLayoutGuide.length
//        }
//        headerView.heightAnchor.constraint(equalToConstant: headerHeight).isActive = true
//        return headerView
//
//    }
    
    
    override var titlesInSwitcher: [String]{
        return["Sustainable Japan","サイエンスポータル","環境ビジネス","IDEAS FOR GOOD"]
        
    }
    
    override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
        switch index {
        case 0:
            return Page1ViewController()
        case 1:
            return Page2ViewController()
        case 2:
            return Page3ViewController()
        case 3:
            return Page4ViewController()
        default: return Page1ViewController()
        }
    }

}
