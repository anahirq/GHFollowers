//
//  SearchVC.swift
//  GHFollowers
//
//  Created by Anahi Rojas on 12/08/21.
//

import UIKit

class SearchVC: UIViewController {

    //initialize objects
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUsernameEntered: Bool {
        return !usernameTextField.text!.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Change the background color according dark mode is enable or not
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
    }
    
    
    //Disable navigation bar when this view appears
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
  
    
    func createDismissKeyboardTapGesture() {
        //endEditing: What view intercepts the tap target when you actually touch the screen 
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }

    //essentially this is how you pass data
    @objc func pushFollowerListVC() {
        
        guard isUsernameEntered else { 
            presentGFAlertOnMainThread(title: "Empty username", message: "Please enter a username. We need to know who to look for 🤡", buttonTitle: "Ok")
            return
            
        }
        
        //Create the object
        let followerListVC = FollowerListVC()
        //Configure the data you wanna pass
        followerListVC.username = usernameTextField.text
        followerListVC.title = usernameTextField.text
        //Push the vc
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    //MARK: - UI
    
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")!
        
        //Array of constraints
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    func configureTextField() {
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            //Leading edge is left
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            //Trailing edge is right
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    
    func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
}

extension SearchVC: UITextFieldDelegate {
    
    //This happens when you press the go button on the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
