//
//  GFButton.swift
//  GHFollowers
//
//  Created by Anahi Rojas on 22/08/21.
//

import UIKit

class GFButton: UIButton {

    //You only override when you do custom stuff
    override init(frame: CGRect) {
        super.init(frame: frame)
        //custom code
        configure()
    }
    
    //This handles initialization via storyboards
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //custom init
    init(backgroundColor: UIColor, title: String) {
        //We dont have a frame so you set the value to 0
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    
    private func configure() {
        //Set the look of the button
        layer.cornerRadius = 10
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        //Use auto layout
        translatesAutoresizingMaskIntoConstraints = false
    }
}
