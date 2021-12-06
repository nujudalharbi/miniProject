//
//  ViewController.swift
//  Project4_API
//
//  Created by نجود  on 02/05/1443 AH.
//

import UIKit
class APIResponse : Codable{
  let total : Int
  let total_pages : Int
  let results : [Result]
}
  struct Result : Codable {
   let id : String
    let urls : URLS
  }
struct URLS : Codable{
  let small : String
}
class ViewController: UIViewController {
    
    var results : [Result] = []
    var images = [UIImage]()
    
    let urlString = "https://api.unsplash.com/search/photos?page=1&query=office&client_id=sa4wSpj9DdDWpknfCmkUNw_xxVTvj406EP0r1xFDmqE"
    override func viewDidLoad() {
        super.viewDidLoad()
   
        getData()
    }
    
    func getData(){
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data ,_, error in
            guard let data = data , error == nil else {
                return
            }
            do{
                let jsonResult = try JSONDecoder().decode(APIResponse.self, from: data)
                print(jsonResult.results)
                
                self?.results.append(contentsOf: jsonResult.results)
                DispatchQueue.main.async{
                    for pho in jsonResult.results{
                        self?.results = jsonResult.results
                        
                    }
                }
            }
            catch{
                print (error)
            }
        }
        task.resume()
    }


}

