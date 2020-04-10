//
//  SentryEventVC.swift
//  DemoLibrary
//
//  Created by Bilal Ahmad on 10/04/2020.
//  Copyright © 2020 Bilal Ahmed. All rights reserved.
//

import UIKit
import Sentry
class SentryEventVC: UIViewController {
    let imageview : UIImageView = {
       let img = UIImageView()
        img.image = UIImage(named: "Avatar")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let btn: UIButton = {
       let b = UIButton()
        b.setTitle("Gooo", for: .normal)
        b.addTarget(self, action: #selector(goAction), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    @objc func goAction() {
        SentrySDK.capture(message: "My first test message")
        self.present(ShowAuthVC(), animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
            
        view.addSubview(imageview)
        view.addSubview(btn)
        
        imageview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageview.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageview.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageview.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btn.topAnchor.constraint(equalTo: imageview.bottomAnchor, constant: 50).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    

}
