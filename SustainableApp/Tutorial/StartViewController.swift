//
//  StartViewController.swift
//  SustainableApp
//
//  Created by Masaki on 9/15/1 R.
//  Copyright © 1 Reiwa Sugita Masaki. All rights reserved.
//

import UIKit
import AVFoundation

class StartViewController: UIViewController {

    var player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let video = Bundle.main.path(forResource: "river", ofType: "mp4")!
        let player = AVPlayer(url: URL(fileURLWithPath: video))
        player.play()
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.zPosition = -1
        playerLayer.repeatCount = 0
        view.layer.insertSublayer(playerLayer, at: 0)
        
        let playerRepeat = NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem,
            queue: .main) { [weak playerLayer] _ in
                playerLayer?.player?.seek(to: CMTime.zero)
                playerLayer?.player?.play()
        }

        
        
        let label = UILabel(frame: CGRect(x: 0, y: 150, width: 300, height: 300))
        label.numberOfLines = 4
        label.text = "Think \nabout \nthe \nEarth"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 55)
//        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.center.x = view.center.x
        label.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        view.addSubview(label)

        let startButton = UIButton(frame: .init(x: 30, y: view.frame.height - 140, width: view.frame.width - 70, height: 50))
        startButton.setTitle("はじめよう", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
//        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = UIColor.white.cgColor
        startButton.backgroundColor = UIColor(red: 0, green: 168.0/255, blue: 107.0/255, alpha: 1)
        startButton.layer.cornerRadius = 5
        startButton.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        startButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        view.addSubview(startButton)
        


        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc func didTapButton() {
        let tabBarController = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
        self.show(tabBarController, sender: nil)
//        self.present(MainViewController, animated: true, completion: nil)
        
        player.pause()
        
    }
    

    
    
    



}
