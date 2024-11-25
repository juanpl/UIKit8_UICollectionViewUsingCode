//
//  ViewController.swift
//  UIKit8_UICollectionViewUsingCode
//
//  Created by Juan Pablo Lasprilla Correa on 18/11/24.
//

import UIKit

struct Device {
    let title: String
    let imageName: String
}

let house = [
    Device(title: "Laptop", imageName: "laptopcomputer"),
    Device(title: "Mac mini", imageName: "macmini"),
    Device(title: "Mac Pro", imageName: "macpro.gen3"),
    Device(title: "Pantallas", imageName: "display.2"),
    Device(title: "Apple TV", imageName: "appletv")
]

class ViewController: UIViewController, UICollectionViewDataSource {

    
    private let swiftBetaCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 200, height: 200)
        //layout.minimumLineSpacing = 200
        //layout.minimumInteritemSpacing = 200
        
        
        let colectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colectionView.translatesAutoresizingMaskIntoConstraints = false
        return colectionView
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        swiftBetaCollectionView.backgroundColor = .blue
        swiftBetaCollectionView.dataSource = self
        swiftBetaCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        view.addSubview(swiftBetaCollectionView)
        
        NSLayoutConstraint.activate([
            swiftBetaCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            swiftBetaCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            swiftBetaCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            swiftBetaCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
            
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        house.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        cell.backgroundColor = .red
        
        let model = house[indexPath.row]
        
        var listContentConfiguration = UIListContentConfiguration.cell()
        listContentConfiguration.text = model.title
        listContentConfiguration.image = UIImage(systemName: model.imageName)
        
        cell.contentConfiguration = listContentConfiguration
        
        return cell
    }
    


}

