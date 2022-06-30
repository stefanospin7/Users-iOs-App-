//
//  Network.swift
//  UserApiFetchApp
//
//  Created by Stefano  on 29/06/22.
//

import Foundation


//The changes in the class will automatically sent in our View

class Network: ObservableObject {
    
    //This users array will contain User
    
    @Published var users: [User] = []
    
    
    
    
    //This function is used to call the api and fetch data in the array
    func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        //json decoder is used to convert the data from json to swift
                        let decodedUsers = try JSONDecoder().decode([User].self, from: data)
                        self.users = decodedUsers
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }

    
    

}

