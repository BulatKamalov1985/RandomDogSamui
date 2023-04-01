//
//  Network.swift
//  RandomDogSamui
//
//  Created by Bulat Kamalov on 31.03.2023.
//
import Foundation
import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchRandomDog(from url: String?, with completion: @escaping (DogRandom?) -> Void) {
        
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
                print("Have Error")
                return
            }
            
            guard let data = data else { return }
            
            do {
                let randomDog = try JSONDecoder().decode(DogRandom.self, from: data)
                DispatchQueue.main.async {
                    completion(randomDog)
                    print("Have Parsed")
                }
            } catch let error {
                print("Somthing Wrong")
                print(error.localizedDescription)
            }
        }.resume()
    }
    

    
    func uploadImage(_ stringUrl: String?, with comletion: @escaping (UIImage) -> Void){
        guard let stringUrl = stringUrl,
              let url = URL(string: stringUrl)
        else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {  data, _, error in
            guard let data = data else {
                return
            }
            guard let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                comletion(image)
                print("Image is recived")
            }
        }
        .resume()
    }
}
