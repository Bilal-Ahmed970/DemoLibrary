//
//  ShowAuthVC.swift
//  DemoLibrary
//
//  Created by Bilal Ahmad on 10/04/2020.
//  Copyright © 2020 Bilal Ahmed. All rights reserved.
//

import UIKit
import Alamofire

struct AuthToken: Codable {
    var jwt = String()
    var user : user?
}

struct user: Codable {
    var blocked : Bool?
    var confirmed : Bool?
    var created_at : String?
    var email : String?
    var id : Int?
    var provider: String?
    var role : role?
    var updated_at : String?
    var username : String?
}
struct role: Codable {
    var description : String?
    var id : Int?
    var name : String?
    var type : String?
}

class ShowAuthVC: UIViewController {

    let lbl: UILabel = {
        let l = UILabel()
        l.text = "..............."
        l.numberOfLines = 4
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
     
     let btn: UIButton = {
        let b = UIButton()
        b.titleLabel?.textColor = .black
         b.setTitle("show", for: .normal)
         b.addTarget(self, action: #selector(showAction), for: .touchUpInside)
         b.translatesAutoresizingMaskIntoConstraints = false
         return b
     }()
     @objc func showAction() {
         getAuthToken { (output, error) in
             if let out = output {
                 print(out)
                 self.lbl.text = out.jwt
             }
             else if let err = error {
                 print(err)
                 self.lbl.text = err
             }
         }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
            
        view.addSubview(lbl)
        view.addSubview(btn)
        
        lbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lbl.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        lbl.heightAnchor.constraint(equalToConstant: 300).isActive = true
        lbl.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btn.topAnchor.constraint(equalTo: lbl.bottomAnchor, constant: 50).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    let authURL = "https://ladybug.o3interfaces.co/auth/local"
    
    func getAuthToken(completion: @escaping (_ output: AuthToken?,_ hasError: String?) -> ()){
        let paramters: NSDictionary = [
            "identifier": "ios-client",
            "password": "ios!00",
        ]
        
        Alamofire.request("\(authURL)", method: .post,parameters: paramters as? Parameters,encoding: JSONEncoding.default)
            .responseJSON { dataResponse in
                switch(dataResponse.result){
                case .success:
                    print("success")
                    do {
                        let decodedObject = try JSONDecoder().decode(AuthToken.self, from: dataResponse.data!)
                        print(decodedObject)
                        completion(decodedObject, nil)
                    } catch let error as NSError {
                        print(error)
                    }
                    
                    break
                case .failure:
                    completion(nil, "Token Generation failed")
                    print("failure")
                    break
                }
        }
        
    }

}
