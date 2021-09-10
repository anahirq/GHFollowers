//
//  GFTextField.swift
//  GHFollowers
//
//  Created by Anahi Rojas on 22/08/21.
//

import UIKit

class GFTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.borderWidth  = 2
        layer.borderColor  = UIColor.systemGray4.cgColor
        
        //. label change between black and white when using (or not) darkmode
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        backgroundColor = .tertiarySystemBackground
        //autocorrect words
        autocorrectionType = .no
        returnKeyType = .go
        
        //Add an "x" at the end of the textfield so you can erase all the text
        clearButtonMode = .whileEditing
        
        placeholder = "Enter a username"
    }
}
