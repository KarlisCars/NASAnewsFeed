//
//  ViewController.swift
//  NASAnewsFeed
//
//  Created by Karlis Cars on 23/11/2019.
//  Copyright © 2019 Karlis Cars. All rights reserved.
//

import UIKit
import Gloss

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var items: [Item] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      //  handeGetData()
    }

    @IBAction func getDataTapped(_ sender: Any) {
        handeGetData()
        
    }
    
    
    func handeGetData(){
        let jsonUrl = "https://newsapi.org/v2/everything?q=bitcoin&from=2019-10-26&sortBy=publishedAt&apiKey=0629659f28b841eb9c5bbdf3ad1cd649"
        
        guard let url = URL(string: jsonUrl) else {return}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-type")
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: urlRequest) {(data, response, error) in
            
            if let err = error{
                print("Error: \(err.localizedDescription)")
                return
            }
            
            guard let data = data else{
                print("Data error")
                return
            }
            do{
                if let dictData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]{
                    //print("dictData:", dictData)
                    self.populateData(dictData)
                }
            }catch{
                print("Err when converting JSON")
            }
        }
        task.resume()
    }//handle data
    
    func populateData(_ dict: [String:Any]){
        guard let responseDict = dict["articles"] as? [Gloss.JSON] else {
            return
        }
        items = [Item].from(jsonArray: responseDict) ?? []
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].title
        return cell
    }
   // MARK: Navigate to 2nd VC
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let detailController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "SecondViewController") as? SecondViewController
        {
            
            detailController.contentString = items[indexPath.row].content_html
            detailController.titleString = items[indexPath.row].title
            detailController.webUrlString = items[indexPath.row].url
        
            
            navigationController?.pushViewController(detailController, animated: true)
        }
        
        
        
      //  self.navigationController?.pushViewController(SecondViewController, animated: true)
        
    }
    
}//end

