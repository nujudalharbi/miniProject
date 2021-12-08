//
//  searchLastMonth.swift
//  Project4_API
//
//  Created by نجود  on 03/05/1443 AH.
//

import UIKit

//--------------------------------
struct newPhoto : Codable {
    
    let new_photos : Int
     
}
//----------------------------

class searchLastMonth: UIViewController {
  
    
    @IBOutlet weak var lbImage: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
           fetchData()
        
    }
//    ----------------------------------------------------------
    
    func fetchData(){
        
        let urlStringPhoto = "https://api.unsplash.com/stats/month?client_id=sa4wSpj9DdDWpknfCmkUNw_xxVTvj406EP0r1xFDmqE"
        
        let task =  URLSession.shared.dataTask(with: URL(string : urlStringPhoto)!, completionHandler: {data , response , error in
            guard let data = data , error == nil else {
                print ("wrong ")
                return
            }
            var jsonResult : newPhoto?
         
            do{
                 jsonResult = try JSONDecoder().decode(newPhoto.self, from: data)
                
                DispatchQueue.main.async {
                    self.lbImage.text = jsonResult?.new_photos.description
                }
                
                
            }
            catch {
                
                print ("faild\(error.localizedDescription)")
                
            }
            guard let json = jsonResult else {
                return
            }
            print (json.new_photos)
        })
.resume()
        
    }
    

    }



