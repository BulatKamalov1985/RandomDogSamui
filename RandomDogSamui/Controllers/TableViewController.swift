//
//  TableViewController.swift
//  RandomDogSamui
//
//  Created by Bulat Kamalov on 29.03.2023.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView()
    var dogImages: [TableViewCellModel] = []
    
    override func viewDidLoad() {
        title = "Random Dogs"
        super.viewDidLoad()
        dogImages = fetchData()
        configureTableView()
    }

    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "\(TableViewCell.self)")
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(TableViewCell.self)") as! TableViewCell
        let image = dogImages[indexPath.row]
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
    func fetchData() -> [TableViewCellModel] {
        let image1 = TableViewCellModel(image: Images.dog1 , title: "DOG 1")
        let image2 = TableViewCellModel(image: Images.dog2 , title: "DOG 2")
        let image3 = TableViewCellModel(image: Images.dog3 , title: "DOG 3")
        let image4 = TableViewCellModel(image: Images.dog4 , title: "DOG 4")
        let image5 = TableViewCellModel(image: Images.dog5 , title: "DOG 5")
        let image6 = TableViewCellModel(image: Images.dog6 , title: "DOG 6")
        let image7 = TableViewCellModel(image: Images.dog7 , title: "DOG 7")
        let image8 = TableViewCellModel(image: Images.dog8 , title: "DOG 8")
        let image11 = TableViewCellModel(image: Images.dog11 , title: "DOG 11")
        let image13 = TableViewCellModel(image: Images.dog13, title: "DOG 13")
        let image14 = TableViewCellModel(image: Images.dog14 , title: "DOG 14")
        let image15 = TableViewCellModel(image: Images.dog15 , title: "DOG 15")
        let image18 = TableViewCellModel(image: Images.dog18 , title: "DOG 18")
        
        return [image1, image2, image3, image4, image5, image6, image7, image8, image11, image13, image14, image15, image18]
    }
}
