//
//  UserViewModel.swift
//  ProtocolOrientedUIKit
//
//  Created by Berkay Kuzu on 28.09.2022.
//

import Foundation

class UserViewModel {
    
    private let userServive : UserService
    weak var output : UserViewModelOutput? // delegate pattern, weak : bu değişken sadece buna erişildiğinde initialized edilecek demek.
    
    init(userServive: UserService) {
        self.userServive = userServive
    }
    
    /* Bu fonksiyonda verileri UserViewModel içerisinde istedim, peki karşı tarafa nasıl veri aktaracağım? Bunu delegate yapısıyla aktaracağız. */
    
    func fetchUsers () {
     
        userServive.fetchUser { [weak self] result in
            switch result {
            case.success(let user):
                self?.output?.updateView(name: user.name, email: user.email, username: user.username)
            case.failure(_):
                self?.output?.updateView(name: "No user", email: "", username: "")
            }
            
        }
        
    }
    
}
