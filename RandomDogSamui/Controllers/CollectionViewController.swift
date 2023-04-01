//
//  CollectionViewController.swift
//  RandomDogSamui
//
//  Created by Bulat Kamalov on 29.03.2023.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    var collectionView: UICollectionView!
    var layout: UICollectionViewFlowLayout!
    var button = UIButton()
    var dogImages: [TableViewCellModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        dogImages = fetchDataCV()
        setupButton()
        
    }
    
    func setupCollectionView() {
        layout = setupFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 80).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        collectionView.dataSource = self
        
        collectionView.register(PhotoCellCV.self , forCellWithReuseIdentifier: "\(PhotoCellCV.self)")
    }
    
    
    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = .init(top: 30, left: 30, bottom: 30, right: 30)
        
        return layout
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dogImages.count
    }
    
    func setupButton() {
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 8).isActive = true
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        button.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        button.setTitle("Change", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.backgroundColor = .lightGray
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 300)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.alpha = 0.9
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)

        
        
    }
    
    


func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(PhotoCellCV.self)", for: indexPath) as? PhotoCellCV else {
        return UICollectionViewCell()
    }
    cell.imageView.image = dogImages[indexPath.item].image
    return cell
}
    
    @objc func buttonAction() {
        layout.scrollDirection = layout.scrollDirection == .horizontal ? .vertical : .horizontal
        
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }

}



extension CollectionViewController {
    func fetchDataCV() -> [TableViewCellModel] {
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
