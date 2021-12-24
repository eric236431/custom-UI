//
//  customView.swift
//  customTest
//
//  Created by imac on 2021/11/30.
//

import UIKit

class customView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelText: UILabel!
    
    @IBOutlet weak var btn: UIButton!
    
    var tagInt = 0
    
    var delegate: customViewListener?
    
    override func awakeFromNib() {
        addXibView()
        
    }
    
    //view在設計時想要看到畫面要用這個
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        addXibView()
    }

    @IBAction func btnAction(_ sender: Any) {
        delegate?.target?(tag: tagInt, label: labelText)
    }
    
    
    func setInit(tag: Int, text: String, image: UIImage){
        labelText.text = text
        imageView.image = image
        tagInt = tag
    }
    

}

//只有這個檔可以呼叫
fileprivate extension customView {
    //加入畫面
    func addXibView() {
        
        if let loadView = Bundle(for: customView.self).loadNibNamed("customView", owner: self, options: nil)?.first as? UIView{
            addSubview(loadView)
            loadView.frame = bounds
        }
        
    }
}


@objc protocol customViewListener: NSObjectProtocol{
    @objc optional func target(tag: Int, label: UILabel)
}
