//
//  GFTitleLabel.swift
//  GHFollowers
//
//  Created by Anahi Rojas on 23/08/21.
//

import UIKit

class GFTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //Custom initializer
    init(textAligment: NSTextAlignment, fontSize: CGFloat) {
        //We dont have a frame so you set the value to 0
        super.init(frame: .zero)
    
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configure()
    }
    
    
    private func configure() {
        //.label change depending on dark mode
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        //If the title is to long how it's going to manage it, it will add ... at the end
        lineBreakMode = .byTruncatingTail
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
