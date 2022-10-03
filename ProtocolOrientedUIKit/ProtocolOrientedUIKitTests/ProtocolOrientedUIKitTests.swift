//
//  ProtocolOrientedUIKitTests.swift
//  ProtocolOrientedUIKitTests
//
//  Created by Berkay Kuzu on 27.09.2022.
//

import XCTest
@testable import ProtocolOrientedUIKit

final class ProtocolOrientedUIKitTests: XCTestCase {

    private var userViewModel : UserViewModel!
    private var userService: MockUserService!
    private var output : MockUserViewModelOutput!
    
    override func setUpWithError() throws {
        userService = MockUserService()
        userViewModel = UserViewModel(userServive: userService)
        output = MockUserViewModelOutput()
        userViewModel.output = output
    }

    override func tearDownWithError() throws {
        userService = nil
        userViewModel = nil
    }

    //API success döndüğü zaman, kullanıcıyı aldığı zaman kullanıcıyı gösteriyor mu?
    // updateView fonksiyonunu güncelliyor mu diye test ediyoruz.
    
    func testUpdateView_whenAPISuccess_showsEmailNameUserName() throws {
        let mockUser = User(id: 1, name: "Berkay", username: "berkaykuzu", email: "berkay@gmail.con", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: ""))
        
        userService.fetchUserMockResult = .success(mockUser)
        userViewModel.fetchUsers()
        
        XCTAssertEqual(output.updateViewArray.first?.username, "berkaykuzu")
        
    }
    
    func testUpdateView_whenAPIFailure_showsNoUser() throws {
        userService.fetchUserMockResult = .failure(NSError())
        userViewModel.fetchUsers()
        
        XCTAssertEqual(output.updateViewArray.first?.name, "No user")
        
    }

}

// API taklit eden sınıf:
class MockUserService : UserService {
    var fetchUserMockResult : Result<ProtocolOrientedUIKit.User, Error>?
    func fetchUser(completion: @escaping (Result<ProtocolOrientedUIKit.User, Error>) -> Void) {
        if let result = fetchUserMockResult {
            completion(result)
        }
    }
}

class MockUserViewModelOutput : UserViewModelOutput {
    var updateViewArray : [(name: String, email: String, username: String)] = [] // En baştan boş bir listeye koydum.
    func updateView(name: String, email: String, username: String) {
        updateViewArray.append((name,email,username))
    }
    
    
}
