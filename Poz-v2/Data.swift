import SwiftUI

struct Post: Codable, Identifiable {
    var id = UUID()
    var title: String
    var body: String
}

class Api {
//    func getPosts() {
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
//        
//        URLSession.shared.dataTask(with: url) { (data, _, _) in
//            let posts = try? JSONDecoder().decode([Post].self, from: data!)
//            print(posts as Any)
//        }
//        .resume()
//    }
}
