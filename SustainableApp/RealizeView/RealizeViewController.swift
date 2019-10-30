//
//  realizeViewController.swift
//  SustainableApp
//
//  Created by Masaki on 9/20/1 R.
//  Copyright © 1 Reiwa Sugita Masaki. All rights reserved.
//

import UIKit

class RealizeViewController: UIViewController {
    
    
    @IBOutlet var scrollView: UIScrollView!
    
    var mainVc = UIScrollView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        varticalScroll1()
//        varticalScroll2()
      
    }
    
    //アラート
    @objc func alert() {
        let alert = UIAlertController(title: "成功", message: "タップ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func varticalScroll1() {
        
        mainVc.frame = CGRect(x: 0, y: 160, width: view.frame.size.width, height: 1190)
        

        for i in 0...5 {
            
            let button = UIButton()
            button.frame = CGRect(x: 13, y: (i*160), width: 170, height: 140)
            
            button.tag = i
            setContentsForButton(tag: button.tag, button: button)
//            button.layer.shadowColor = .init(srgbRed: 76, green: 76, blue: 76, alpha: 1)
            button.setTitleColor(.init(red: 76, green: 76, blue: 76, alpha: 1), for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
            button.layer.cornerRadius = 19
            button.layer.masksToBounds = true
            self.navigationItem.titleView = button
            //影
            button.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            button.layer.shadowOpacity = 0.6
            button.layer.shadowRadius = 12
            button.contentHorizontalAlignment = .left
            button.contentVerticalAlignment = .top
            button.titleEdgeInsets = UIEdgeInsets(top: 13, left: 13, bottom: 0.0, right: 0.0)
            button.addTarget(self, action: #selector(alert), for: .touchUpInside)
            mainVc.addSubview(button)
            
        }
        
        
        
        for i in 0...5 {
            
            let button2 = UIButton()
            button2.frame = CGRect(x: 195, y: (i*160), width: 170, height: 140)
            
            button2.tag = i
            setContentsForButton2(tag: button2.tag, button: button2)
            button2.setTitleColor(.init(red: 76, green: 76, blue: 76, alpha: 1), for: .normal)
//            button2.setTitleColor(.white, for: .normal)
            button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
            button2.layer.cornerRadius = 19
            button2.layer.masksToBounds = true
            self.navigationItem.titleView = button2
            //Button内、影
            button2.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            button2.layer.shadowOpacity = 0.6
            button2.layer.shadowRadius = 12
            button2.contentHorizontalAlignment = .left
            button2.contentVerticalAlignment = .top
            button2.titleEdgeInsets = UIEdgeInsets(top: 13, left: 13, bottom: 0.0, right: 0.0)
            button2.addTarget(self, action: #selector(alert), for: .touchUpInside)
            mainVc.addSubview(button2)
            
        }
        
        
        
        scrollView.addSubview(mainVc)
        scrollView.contentSize = mainVc.bounds.size
        
        }
    
    func setContentsForButton(tag: Int, button: UIButton){
    switch tag {
    case 0:
        button.setTitle("地球温暖化", for: .normal)
        button.setBackgroundImage(UIImage(named: "warming"), for: .normal)
    case 1:
        button.setTitle("オゾン層破壊", for: .normal)
        button.setBackgroundImage(UIImage(named: "ozone"), for: .normal)
    case 2:
        button.setTitle("大気汚染", for: .normal)
        button.setBackgroundImage(UIImage(named: "atmosphericpollution"), for: .normal)
    case 3:
        button.setTitle("途上国環境問題", for: .normal)
        button.setBackgroundImage(UIImage(named: "poverty"), for: .normal)
    case 4:
        button.setTitle("海・川の汚染", for: .normal)
        button.setBackgroundImage(UIImage(named: "waterpollution"), for: .normal)
    case 5:
        button.setTitle("有害化学物質", for: .normal)
        button.setBackgroundImage(UIImage(named: "pollution"), for: .normal)
  
    default:
        break
    }

    }


func setContentsForButton2(tag: Int, button: UIButton){
    switch tag {
    case 0:
        button.setTitle("森林破壊", for: .normal)
        button.setBackgroundImage(UIImage(named: "forestfire"), for: .normal)
    case 1:
        button.setTitle("生物の保護", for: .normal)
        button.setBackgroundImage(UIImage(named: "polarbear"), for: .normal)
    case 2:
        button.setTitle("酸性雨", for: .normal)
        button.setBackgroundImage(UIImage(named: "dyingtree"), for: .normal)
    case 3:
        button.setTitle("放射性物質", for: .normal)
        button.setBackgroundImage(UIImage(named: "chernobyl"), for: .normal)
    case 4:
        button.setTitle("外来種", for: .normal)
        button.setBackgroundImage(UIImage(named: "nonnativespecies"), for: .normal)
    case 5:
        button.setTitle("リサイクル", for: .normal)
        button.setBackgroundImage(UIImage(named: "rubbishheap"), for: .normal)

    default:
        break
            
        }
    }
   }


