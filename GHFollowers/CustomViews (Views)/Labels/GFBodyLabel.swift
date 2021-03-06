//
//  GFBodyLabel.swift
//  GHFollowers
//
//  Created by Anahi Rojas on 23/08/21.
//

import UIKit

class GFBodyLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //Custom initializer
    convenience init(textAligment: NSTextAlignment) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
    }
    
    
    private func configure() {
        textColor                         = .secondaryLabel
        font                              = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontForContentSizeCategory = true
        adjustsFontSizeToFitWidth         = true
        minimumScaleFactor                = 0.75
        //If the title is to long how it's going to manage it
        lineBreakMode                     = .byWordWrapping
        textAlignment                     = textAlignment
        translatesAutoresizingMaskIntoConstraints = false
        
    }

}
