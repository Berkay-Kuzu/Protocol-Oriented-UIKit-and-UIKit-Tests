//
//  UserViewModelOutput.swift
//  ProtocolOrientedUIKit
//
//  Created by Berkay Kuzu on 28.09.2022.
//

import Foundation

protocol UserViewModelOutput : AnyObject {
    func updateView(name: String, email: String, username: String) // Bu fonksiyon görünümleri güncelleyecek. Bunları iletmek istiyorum.
}
