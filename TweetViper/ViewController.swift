//
//  ViewController.swift
//  TweetViper
//
//  Created by Bao  Tran on 8/9/17.
//  Copyright © 2017 Bao Tran. All rights reserved.
//

import UIKit
import TwitterKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let parameters = ["screen_name": "stevenhepting", "count": "3"]
        var error : NSError?
        let req = TWTRAPIClient().urlRequest(withMethod: "GET", url: "https://api.twitter.com/1.1/statuses/user_timeline.json", parameters: parameters, error: &error)
        TWTRAPIClient().sendTwitterRequest(req, completion: { (response, data, error) in
            do {
                let response = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [[String : Any]]
                if response != nil {
                    print((response! as NSArray).debugDescription)
                }
            }
            catch {
                print(error.localizedDescription)
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

