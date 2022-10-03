//
//  ViewController.swift
//  ProtocolOrientedUIKit
//
//  Created by Berkay Kuzu on 27.09.2022.
//

import UIKit

class UserViewController: UIViewController, UserViewModelOutput {
    
    func updateView(name: String, email: String, username: String) {
        self.nameLabel.text = name
        self.emailLabel.text = email
        self.usernameLabel.text = username
    }
   
    private let viewModel : UserViewModel
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        //fetchUsers()
        viewModel.fetchUsers()
    }

    private func setupViews() {
        
        view.backgroundColor = .yellow
        
        view.addSubview(emailLabel)
        view.addSubview(nameLabel)
        view.addSubview(usernameLabel)
     
        
        NSLayoutConstraint.activate(
            [
        
                nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                nameLabel.heightAnchor.constraint(equalToConstant: 60),
                nameLabel.widthAnchor.constraint(equalToConstant: 200),
                nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        
                emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                emailLabel.heightAnchor.constraint(equalToConstant: 60),
                emailLabel.widthAnchor.constraint(equalToConstant: 200),
                emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
                
                usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                usernameLabel.heightAnchor.constraint(equalToConstant: 60),
                usernameLabel.widthAnchor.constraint(equalToConstant: 200),
                usernameLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
        
        
            ]
        )
    }
    
    /*
    private func fetchUsers() {
        APIManager.shared.fetchUser { result in
            switch result {
            case .success(let user):
                self.usernameLabel.text = user.username
                self.emailLabel.text = user.email
                self.nameLabel.text = user.name
                
            case .failure:
                self.nameLabel.text = "No user found"
            }
        }
    }
     */
}

