//
//  TableViewCell.swift
//  RandomDogSamui
//
//  Created by Bulat Kamalov on 29.03.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var DogImageView = UIImageView()
    var DogTitlelabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(DogImageView)
        addSubview(DogTitlelabel)
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(imageDog: TableViewCellModel) {
        DogImageView.image = imageDog.image
        DogTitlelabel.text = imageDog.title
    }
    
    func configureImageView() {
        DogImageView.layer.cornerRadius = 10
        DogImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        DogTitlelabel.numberOfLines = 0
        DogTitlelabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        DogImageView.translatesAutoresizingMaskIntoConstraints = false
        DogImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        DogImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        DogImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        DogImageView.widthAnchor.constraint(equalTo: DogImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func setTitleLabelConstraints() {
        DogTitlelabel.translatesAutoresizingMaskIntoConstraints = false
        DogTitlelabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        DogTitlelabel.leadingAnchor.constraint(equalTo: DogImageView.trailingAnchor, constant: 20).isActive = true
        DogTitlelabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        DogTitlelabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
