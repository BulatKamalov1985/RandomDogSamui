//
//  TableViewController.swift
//  RandomDogSamui
//
//  Created by Bulat Kamalov on 29.03.2023.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var tableView = UITableView()
    var videos: [Video] = []

    override func viewDidLoad() {
        title = "Random Dogs"
        super.viewDidLoad()
        videos = fetchData()
        configureTableView()
       
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.backgroundColor = .cyan
        tableView.rowHeight = 100
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        let image = videos[indexPath.row]
        cell.set(imageDog: image)
     
        return cell
    }

}


extension UIView {
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}

extension TableViewController {
    
    func fetchData() -> [Video] {
        let image1 = Video(image: Images.dog1 , title: "DOG 1")
        let image2 = Video(image: Images.dog2 , title: "DOG 2")
        let image3 = Video(image: Images.dog3 , title: "DOG 3")
        let image4 = Video(image: Images.dog4 , title: "DOG 4")
        let image5 = Video(image: Images.dog5 , title: "DOG 5")
        let image6 = Video(image: Images.dog6 , title: "DOG 6")
        let image7 = Video(image: Images.dog7 , title: "DOG 7")
        let image8 = Video(image: Images.dog8 , title: "DOG 8")
        
        return [image1, image2, image3, image4, image5, image6, image7, image8]
    }
}
