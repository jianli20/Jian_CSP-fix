//
//  TheInternet.swift
//  Jian_CSP
//
//  Created by Li, Jian Hong on 11/29/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit

public class InternetMasterViewController : UITableViewController
{
    private (set) lazy var internetTopics : [String] =
    {
        return [
            "Definitions",
            "CSP",
            "CTEC",
            "Canyons",
            "Twitter",
            "Swift Guide"
        ]
    }()

    private var detailViewController : InternetDetailViewController?
    
    private lazy var addresses : [String] = []
    
    private func setup() -> Void
    {
        addresses = [
            "https://apstudent.collegeboard.org/apcourse/ap-computer-science-principles/",
            "http://www.canyonsdistrict.org/",
            "https://ctec.canyonsdistrict.org/",
            "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html",
           "https://twitter.com"
        ]
        
        if let splitView = splitViewController
        {
            let currentControllers = splitView.viewControllers
            detailViewController = currentControllers[0] as?InternetDetailViewController
        }
    }
            
    
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()
        setup()
        self.clearsSelectionOnViewWillAppear = false
        
    }
    
    //Mark: - Table view data source
    
    override public func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning INcomplete implementation, retunmber of sections
        return 1
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int
    {
        return internetTopics.count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIndentifier", for: indexPath)
        let currentText = internetTopics[indexPath.row]
        cell.textLabel!.text = currentText
        
        return cell
    }
    
    
        //MARK: Handle the internal transfer
        override public func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
            if segue.identifier! == "showDetail"
            {
                if let indexPath = self.tableView.indexPathForSelectedRow
                {
                    let urlString = addresses[indexPath.row]
                    let pageText : String
                    
                    if indexPath.row == 0
                    {
                        pageText = "URL- Uniform Resource Locator.The address of a WWW page on the internet. TCP- Transmission Control Protocol. A set of rules that governs the delivery of data over the Internet or other network that uses the Internet Protocol. IP - Internet Protocol. The unique number label assigned to every device connected to the internet, used for identification and communication. DNS- Domain Name System. Internet’s system for converting alphabetic names into IP addresses"

                    }
                    else
                    {
                        pageText = internetTopics[indexPath.row]
                    }
                    
                    let controller = segue.destination as!
                        InternetDetailViewController
                    
                    controller.detailAddress = urlString
                    controller.detailText = pageText
                    controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                    controller.navigationItem.leftItemsSupplementBackButton = true
                }
            }
        }
}

