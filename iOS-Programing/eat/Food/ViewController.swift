//
//  ViewController.swift
//  Food
//
//  Created by 소프트웨어컴퓨터 on 2025/04/03.
//

import UIKit
var name = ["1한식","2분식","3중식","4학식","5집밥"]
var image = ["1.png","2.png","3.png","4.png","6.png"]
var text = ["맛없어요","맛있어요","맛있을지도","맛있던가","인스타갬성"]
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.description)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //       let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "myCell")
        //        cell.textLabel?.text = name[indexPath.row]//"\(indexPath.row)"
        //        cell.detailTextLabel?.text = text[indexPath.row]
        //        cell.imageView?.image = UIImage(named: image[indexPath.row])
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
        cell.myLabel.text = name[indexPath.row]
        cell.myImage.image = UIImage(named: image[indexPath.row])
        //print(indexPath.description)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
    }
    
    
}

