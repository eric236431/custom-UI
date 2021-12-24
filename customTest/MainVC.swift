//
//  MainVC.swift
//  customTest
//
//  Created by imac on 2021/11/30.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet weak var customView: customView!
    
    @IBOutlet weak var secondView: customView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
        customView.setInit(tag: 0, text: "123", image: UIImage(systemName: "pencil")!)
        
        secondView.delegate = self
        secondView.setInit(tag: 1, text: "456", image: UIImage(systemName: "person")!)
       
    }


}

extension MainVC: customViewListener{
    
    func target(tag: Int, label: UILabel) {
        switch tag{
        case 0:
            print("hello")
            label.text = "p"
        case 1:
            print("world")
        default:
            break
        }
    }
    
}
