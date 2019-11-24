//
//  SecondViewController.swift
//  NASAnewsFeed
//
//  Created by Karlis Cars on 23/11/2019.
//  Copyright © 2019 Karlis Cars. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var webUrlString = String()
    var titleString = String()
    var contentString = String()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "NASA"
//        print(webUrlString)
//        print(titleString)
//        print(contentString)
        
        titleLabel.text = titleString
        contentTextView.text = contentString
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let destinationVC: ThirdViewController = segue.destination as! ThirdViewController
        // Pass the selected object to the new view controller.
        destinationVC.urlString = webUrlString
        
        
    }
    

}
