//
//  MainViewController.swift
//  VK
//
//  Created by Alexander Bubeshka on 22.05.22.
//
import UIKit
import WebKit
import RealmSwift

class MainViewController: UIViewController {
    
    @IBOutlet weak var vkImage: UIImageView!
    @IBOutlet weak var vkLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var buttonEnter: UIButton!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        
        webview.navigationDelegate = self
        
        super.viewDidLoad()
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "8216394"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value:"https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        guard let url = urlComponents.url else { return }
        print(url)
        let request = URLRequest(url: url)
        
        webview.load(request)
    }
}

extension MainViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        decisionHandler(.allow)
        
        guard
            let url = navigationResponse.response.url,
            url.path == "/blank.html",
            let fragment = url.fragment
        else { return }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=")}
            .reduce([String : String](), { partialResult, param in
                var dict = partialResult
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            })
        guard
            let token = params["access_token"]
        else { return }
        
        Session.instance.token = token
        
        print(Session.instance.token)
        
        performSegue(withIdentifier: "ToTabBarController", sender: nil)
    }
    
}

func sendGetRequestFrindsList() {
    
    var components = URLComponents(string: "http://api.vk.com/method/friends.get")
    components?.queryItems = [
        URLQueryItem(name: "access_token", value: Session.instance.token),
        URLQueryItem(name: "fields", value: "name"),
        URLQueryItem(name: "fields", value: "photo_200_orig"),
        URLQueryItem(name: "v", value: "5.131")
    ]
    
    guard let url = components?.url else { return }
    
    print (url)
    
    URLSession.shared.dataTask(with: url) { data, _, _  in
        guard
            let data = data,
            let model = try? JSONDecoder().decode(GetFriendsResponse.self, from: data)
        else { return }
        
//        print(model)
        
        let friends = model.response.items
        
        let friendsRealm: [FriendsRealm] = friends.map { friend in
            let friendsRealm = FriendsRealm()
            friendsRealm.id = friend.id
            friendsRealm.firstName = friend.firstName
            friendsRealm.lastName = friend.lastName
            friendsRealm.photo = friend.photo
            
            return friendsRealm
        }
        saveFriends(friends: friendsRealm)
    }.resume()
}
private func saveFriends(friends: [FriendsRealm]) {
    do {
        let realm = try Realm()
        try realm.write {
            friends.forEach { realm.add($0)}
        }
    } catch {
        print(error)
    }
}

func sendGetRequestPhotoList() {
    
    var components = URLComponents(string: "http://api.vk.com/method/photos.get")
    components?.queryItems = [
        URLQueryItem(name: "access_token", value: Session.instance.token),
        URLQueryItem(name: "owner_id", value: "13138774"),
        URLQueryItem(name: "album_id", value: "profile"),
        URLQueryItem(name: "v", value: "5.131")
    ]
    
    guard let url = components?.url else { return }
    
    URLSession.shared.dataTask(with: url) { (data, _, _ ) in
        guard
            let data = data,
            let model = try? JSONDecoder().decode(GetPhotoResponse.self, from: data)
        else { return }
        
//        print(model)
        
        let photosRealm: [RealmGetPhoto] = model.response.items.map { photos in
            let photosRealm = RealmGetPhoto()
            photosRealm.id = photos.id
            
            let sizeRealm: [RealmPhotoSizes] = photos.sizes.map { post in
                let  sizeRealm = RealmPhotoSizes()
                sizeRealm.url = post.url
                return sizeRealm
            }
            photosRealm.sizes.append(objectsIn: sizeRealm)
            return photosRealm
        }
        savePhotos(photosUrl: photosRealm)
    }.resume()
}
private func savePhotos(photosUrl: [RealmGetPhoto]) {
    do {
        let realm = try Realm()
        try realm.write {
            photosUrl.forEach { realm.add($0)}
            
        }
    } catch {
        print(error)
    }
}

func sendGetRequestGroupsList() {
    
    var components = URLComponents(string: "http://api.vk.com/method/groups.get")
    components?.queryItems = [
        URLQueryItem(name: "access_token", value: Session.instance.token),
        URLQueryItem(name: "extended", value: "1"),
        URLQueryItem(name: "v", value: "5.131")
    ]
    
    guard let url = components?.url else { return }
    
    URLSession.shared.dataTask(with: url) { (data, _, _ ) in
        guard
            let data = data,
            let model = try?
                JSONDecoder().decode(GetGroupsResponse.self, from: data)
        else { return }
        
        let groupsRealm: [RealmGetGroups] = model.response.items.map { groups in
            let groupsRealm = RealmGetGroups()
            groupsRealm.id = groups.id
            groupsRealm.name = groups.name
            groupsRealm.photo200 = groups.photo200
            
            return groupsRealm
        }
        saveGroups(groups: groupsRealm)
    }.resume()
}
private func saveGroups(groups: [RealmGetGroups]) {
    do {
        let realm = try Realm()
        try realm.write {
            groups.forEach { realm.add($0)}
        }
    } catch {
        print(error)
    }
}


