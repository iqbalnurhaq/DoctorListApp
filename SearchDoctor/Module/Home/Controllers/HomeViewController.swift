//
//  ViewController.swift
//  SearchDoctor
//
//  Created by Iqbal Nur Haq on 22/01/24.
//

import UIKit

class HomeViewController: UIViewController {
//    let screenSize: CGRect = UIScreen.main.bounds
    
    
    let searchTextField: UITextField = {
        let tf = UITextField.init(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.width - 40, height: 40))
        tf.layer.borderColor = CustomColors.secondaryColor?.withAlphaComponent(0.5).cgColor
        tf.font = UIFont(name: CustomFont.poppinsMedium, size: 16)
        tf.layer.cornerRadius = 8
        tf.layer.borderWidth = 1.3
        tf.setRightIcon(UIImage(named: "search")!)
        let leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        tf.leftView = leftView
        tf.leftViewMode = .always
        return tf
    }()
    
    lazy var collectionView: UICollectionView = {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 130)
        layout.minimumLineSpacing = 18
        
        let cv = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.register(DoctorCollectionViewCell.self, forCellWithReuseIdentifier: "DoctorCollectionViewCell")
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(searchTextField)
        view.addSubview(collectionView)
        setUpNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    func setUpNavigationBar(){
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
//        navigationController?.navigationBar.layer.zPosition = -1
        navigationController?.navigationBar.barTintColor = CustomColors.primaryColor
        
        let title = UILabel()
        title.text = "Teleconsultation"
        title.font = UIFont(name: CustomFont.poppinsMedium, size: 18)
        
        self.navigationItem.titleView = title
    }
    
    func setUpConstraint() {
        NSLayoutConstraint.activate([
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchTextField.topAnchor.constraint(equalTo: view.topAnchor),
            
            collectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DoctorCollectionViewCell", for: indexPath)
        return cell
    }
}
