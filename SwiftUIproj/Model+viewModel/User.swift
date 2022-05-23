//
//  Petition.swift
//  SwiftUIproj
//
//  Created by Ines Sakly on 7/10/2021.
//

import SwiftUI
import NetworkingManager

struct User: Codable, Identifiable {
    var id: String
    var createdAt: String
    var name: String
    var avatar: String
    enum CodingKeys: CodingKey {
        case id
        case createdAt
        case name
        case avatar
    }
}


class ReadData: ObservableObject  {
    @Published var users = [User]()
    init(){
        getData()
    }
    func getData(){
        guard let url = URL(string: "https://60c86ffcafc88600179f70e2.mockapi.io/api/getRequest") else { fatalError("Invalid URL") }

        NetworkingManager().request(fromURL: url, httpMethod: .get) { (result: Result<[User], Error>) in
            switch result {
            case .success(let users):
                debugPrint("successful result with \(users.count) users.")
                self.users = users
            case .failure(let error):
                debugPrint("failure trying to get the users: \(error.localizedDescription)")
        }
        }
    }
}
