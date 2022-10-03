//
//  UserService.swift
//  ProtocolOrientedUIKit
//
//  Created by Berkay Kuzu on 28.09.2022.
//

import Foundation

protocol UserService {
    func fetchUser (completion : @escaping(Result<User,Error>) -> Void )
}
