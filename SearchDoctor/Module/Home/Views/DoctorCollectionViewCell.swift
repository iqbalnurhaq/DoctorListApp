//
//  DoctorCollectionViewCell.swift
//  SearchDoctor
//
//  Created by Iqbal Nur Haq on 23/01/24.
//

import UIKit

class DoctorCollectionViewCell: UICollectionViewCell {
    
    let doctorView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.shadowColor = CustomColors.secondaryColor?.cgColor
        v.layer.shadowOpacity = 0.5
        v.layer.shadowOffset = .zero
        v.layer.shadowRadius = 6
        v.layer.cornerRadius = 12
        v.backgroundColor = .white
        return v
    }()
    
    let descriptionView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let image: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "doctor")
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 12
        return img
    }()
    
    let name: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Dr. Rahmalia Nur Nur Nur Nur Nur Nur Nur"
//        l.numberOfLines = 1
//        l.lineBreakMode = .byCharWrapping
        l.font = UIFont(name: CustomFont.poppinsMedium, size: 16)
       
        return l
    }()
    
    let speciality: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "General"
        l.font = UIFont(name: CustomFont.poppinsRegular, size: 12)
        l.textColor = CustomColors.primaryColor
        return l
    }()
    
    
    let rs: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "RS. UI"
        l.font = UIFont(name: CustomFont.poppinsRegular, size: 12)
       
        return l
    }()
    
    let onlineView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 4
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let circleView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .green
        v.layer.cornerRadius = 4
        return v
    }()
    
    
    let online: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Online"
        l.textColor = .green
        l.font = UIFont(name: CustomFont.poppinsRegular, size: 8)
        return l
    }()
    
    let pinImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "pin")
        return img
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(doctorView)
        doctorView.addSubview(image)
        doctorView.addSubview(descriptionView)
        descriptionView.addSubview(name)
        descriptionView.addSubview(speciality)
        descriptionView.addSubview(rs)
        descriptionView.addSubview(pinImage)
        descriptionView.addSubview(onlineView)
        
        onlineView.addArrangedSubview(circleView)
        onlineView.addArrangedSubview(online)
        setUpConstraints()
    }
    
    func setUpConstraints() {
        doctorView.pin(self)
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: doctorView.leadingAnchor, constant: 8),
            image.topAnchor.constraint(equalTo: doctorView.topAnchor, constant: 8),
            image.bottomAnchor.constraint(equalTo: doctorView.bottomAnchor, constant: -8),
            image.widthAnchor.constraint(equalToConstant: 115),
            
            descriptionView.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            descriptionView.topAnchor.constraint(equalTo: doctorView.topAnchor),
            descriptionView.trailingAnchor.constraint(equalTo: doctorView.trailingAnchor),
//            descriptionView.bottomAnchor.constraint(equalTo: doctorView.bottomAnchor),
//            descriptionView.centerYAnchor.constraint(equalTo: doctorView.centerYAnchor),
            
            name.topAnchor.constraint(equalTo: descriptionView.topAnchor),
            name.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor),
            name.trailingAnchor.constraint(equalTo: pinImage.leadingAnchor, constant: -10),
            
            
            
            speciality.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 4),
            rs.topAnchor.constraint(equalTo: speciality.bottomAnchor, constant: 12),
//            circleView.topAnchor.constraint(equalTo: rs.bottomAnchor, constant: 12),
            circleView.widthAnchor.constraint(equalToConstant: 8),
            circleView.heightAnchor.constraint(equalToConstant: 8),
            
            pinImage.topAnchor.constraint(equalTo: descriptionView.topAnchor),
            pinImage.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -13),
            pinImage.widthAnchor.constraint(equalToConstant: 12),
            pinImage.heightAnchor.constraint(equalToConstant: 15),
            
            onlineView.topAnchor.constraint(equalTo: rs.bottomAnchor, constant: 12),
            onlineView.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
