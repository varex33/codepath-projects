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
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.dataSource=self
        moviesTableView.delegate=self

    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell=tableView.dequeueReusableCellWithIdentifier("movieCell")
        //println("Hello this is row \(indexPath.row), at a section \(indexPath.section)")
//        cell.textLabel?.text="Hello this is row \(indexPath.row), at a section \(indexPath.section)"
        return cell
    }


}
