//
//  ViewController.swift
//  API1
//
//  Created by MAC on 02/05/1443 AH.
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
  let full : String
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

