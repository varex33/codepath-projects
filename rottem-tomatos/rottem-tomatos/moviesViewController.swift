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
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
        var url = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=4aqms2zr3pjp7t8vrgrgxymz&q=us"
        var request = NSURLRequest(URL: (NSURL (string: url)))
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in
            
            var object = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
            
             self.movies = object["movies"] as [NSDictionary]
            print("object: \(object)")
            self.moviesTableView.reloadData()
        }
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("movieCell") as movieCell
        var movie = movies[indexPath.row]
        cell.titleLabel.text = movie["title"] as? String
        cell.synopsisLabel.text = movie["synopsis"] as? String
        
        var posters = movie["posters"] as NSDictionary
        var posterUrl = posters["thumbnail"] as String
        
        cell.poster.setImageWithURL(NSURL(string: posterUrl))
        return cell
    }


}
