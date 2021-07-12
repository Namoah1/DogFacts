//
//  DogFactsCollectionViewController.swift
//  DogFacts
//
//  Created by Nana Adwoa Odeibea Amoah on 7/11/21.
//

import UIKit


class DogFactsCollectionViewController: UICollectionViewController {

    var dogFacts: [DogFact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFacts()
    }


    func getFacts() {
        print("Run")
        if let url = URL(string: "https://dog-facts-api.herokuapp.com/api/v1/resources/dogs?number=2"){
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            URLSession.shared.dataTask(with: request) {(data, response, error) in
                print("cHECK")
                if error != nil {
                    print("Error encountered")
                } else if data != nil {
                    if let factsFromAPI = try? JSONDecoder().decode([DogFact].self, from: data!){
                        DispatchQueue.main.async {
                            print(factsFromAPI)
                            self.dogFacts = factsFromAPI
                            self.collectionView.reloadData()
                        }
                    }
                }
            }.resume()
        }
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogFacts.count
    }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DogFactCell", for: indexPath) as? FactCollectionViewCell {
            let dogFact = dogFacts[indexPath.row]
            cell.factLabel.text = dogFact.fact
            return cell
        } else {
            return UICollectionViewCell()
        }
    

    }
    




}
