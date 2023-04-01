//
//  HomePageVC.swift
//  RandomDogSamui
//
//  Created by Bulat Kamalov on 29.03.2023.
//

import UIKit

class HomePageVC: UIViewController {
    
    let networkManager = NetworkManager.shared
    
    var dogRandom: DogRandom? = nil
    
    var randomDogImages = UIImage()

    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit // Устанавливаем режим масштабирования изображения
        
//        imageView.image = UIImage(named: "dog1") // Устанавливаем изображение (замените "yourImageName" на название своего изображения)
    
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let button1: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Кнопка 1", for: .normal)
        button.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside) // Добавляем обработчик нажатия кнопки
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .lightGray
        return button
    }()
    
    let button2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Кнопка 2", for: .normal)
        button.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside) // Добавляем обработчик нажатия кнопки
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        uploadRandomDog()
        view.addSubview(imageView)
        view.addSubview(button1)
        view.addSubview(button2)
        setup()
        
       
        
    }
    
    private func uploadRandomDog() {
        NetworkManager.shared.fetchRandomDog(from: "https://dog.ceo/api/breeds/image/random") { dogRandom in
            self.dogRandom = dogRandom
        }
    }
    
    func setup() {
        NSLayoutConstraint.activate([
            // Размещаем imageView по центру экрана
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            imageView.bottomAnchor.constraint(equalTo: button1.bottomAnchor, constant: -30),
//            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            imageView.widthAnchor.constraint(equalToConstant: 300),
//            imageView.heightAnchor.constraint(equalToConstant: 300),
            
            // Размещаем первую кнопку внизу слева
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            button1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            button1.heightAnchor.constraint(equalToConstant: 50),
            
            // Размещаем вторую кнопку внизу справа
            button2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            button2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            button2.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
   
    
   

    
    // Обработчик нажатия первой кнопки
    @objc func button1Tapped() {
        uploadRandomDog()
        networkManager.uploadImage(dogRandom?.message) { image in
            self.imageView.image = image
        }
        print("Кнопка 1 была нажата!")
    }
    
    // Обработчик нажатия второй кнопки
    @objc func button2Tapped() {
        print("Кнопка 2 была нажата!")
    }
    
    
}
