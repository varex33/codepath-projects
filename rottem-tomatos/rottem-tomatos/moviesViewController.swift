//
//  moviesViewController.swift
//  rottem-tomatos
//
//  Created by Samuel Argote on 10/18/14.
//  Copyright (c) 2014 Sam Argote. All rights reserved.
//

import UIKit

class moviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var moviesTableView: UITableView!
    var movies: [NSDictionary] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.dataSource=self
        moviesTableView.delegate=self
        var url="http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=4aqms2zr3pjp7t8vrgrgxymz&q=us"
        var request = NSURLRequest(URL: (NSURL (string: url)))
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in
            var object = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
             self.movies=object["movies"] as [NSDictionary]
            print("object: \(object)")
            
        }
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell=tableView.dequeueReusableCellWithIdentifier("movieCell") as movieCell
        //println("Hello this is row \(indexPath.row), at a section \(indexPath.section)")
//        cell.textLabel?.text="Hello this is row \(indexPath.row), at a section \(indexPath.section)"
        cell.titleLabel.text="this is the title"
        cell.synopsisLabel.text="this is the synopsis"
        return cell
    }


}
