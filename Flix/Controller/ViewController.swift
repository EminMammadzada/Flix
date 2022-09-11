//
//  ViewController.swift
//  Flix
//
//  Created by Emin Mammadzada on 11.09.22.
//

import UIKit

class ViewController: UIViewController {
    
    var movies = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(ProcessInfo.processInfo.environment["API_KEY"] ?? "")")!
        let request = URLRequest(url:url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { [self] (data, response, error) in
                 
                 if let error = error {
                     
                        print(error.localizedDescription)
                     
                 } else if let data = data {
                     
                        let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                        self.movies = dataDictionary["results"] as! [[String:Any]]
            
                 }
            }
            task.resume()
    }


}

