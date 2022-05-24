//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Iurasova Katya on 23.05.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private let photosView: UIView = {
        let photosView = UIView()
        photosView.translatesAutoresizingMaskIntoConstraints = false
        photosView.backgroundColor = .white
        return photosView
    }()
    
    private let photosLabel: UILabel = {
        let photosLabel = UILabel()
        photosLabel.translatesAutoresizingMaskIntoConstraints = false
        photosLabel.text = "Фото"
        photosLabel.textColor = .black
        photosLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        photosLabel.numberOfLines = 1
        return photosLabel
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.layer.cornerRadius = 6
        stackView.backgroundColor = .white
        stackView.clipsToBounds = true
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        return stackView
    }()
    
    private var rightArrowImageView: UIImageView = {
        let rightArrowImageView = UIImageView()
        rightArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        rightArrowImageView.image = UIImage(systemName: "arrow.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        rightArrowImageView.sizeToFit()
        rightArrowImageView.clipsToBounds = false
        return rightArrowImageView
    }()
    
    private var oneImageView: UIImageView = {
        let oneImageView = UIImageView()
        oneImageView.translatesAutoresizingMaskIntoConstraints = false
        oneImageView.image = UIImage(named: "norwich1")
        oneImageView.backgroundColor = .black
        oneImageView.contentMode = .scaleAspectFill
        oneImageView.layer.cornerRadius = 6
        oneImageView.clipsToBounds = true
        return oneImageView
    }()
    
    private var twoImageView: UIImageView = {
        let twoImageView = UIImageView()
        twoImageView.translatesAutoresizingMaskIntoConstraints = false
        twoImageView.image = UIImage(named: "norwich2")
        twoImageView.backgroundColor = .black
        twoImageView.contentMode = .scaleAspectFill
        twoImageView.layer.cornerRadius = 6
        twoImageView.clipsToBounds = true
        return twoImageView
    }()
    
    private var freeImageView: UIImageView = {
        let freeImageView = UIImageView()
        freeImageView.translatesAutoresizingMaskIntoConstraints = false
        freeImageView.image = UIImage(named: "norwich3")
        freeImageView.backgroundColor = .black
        freeImageView.contentMode = .scaleAspectFill
        freeImageView.layer.cornerRadius = 6
        freeImageView.clipsToBounds = true
        return freeImageView
    }()
    
    private var fourImageView: UIImageView = {
        let fourImageView = UIImageView()
        fourImageView.translatesAutoresizingMaskIntoConstraints = false
        fourImageView.image = UIImage(named: "norwich4")
        fourImageView.backgroundColor = .black
        fourImageView.contentMode = .scaleAspectFill
        fourImageView.layer.cornerRadius = 6
        fourImageView.clipsToBounds = true
        return fourImageView
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        customizeCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customizeCell() {
        photosView.layer.cornerRadius = 0
        photosView.layer.borderWidth = 0
        photosView.layer.borderColor = UIColor.black.cgColor
    }
    
    private func setupLayout() {
        let firstInset: CGFloat = 12
        let secondInset: CGFloat = 12
        
        [oneImageView, twoImageView, freeImageView, fourImageView].forEach { stackView.addArrangedSubview($0) }
        
        [photosView, photosLabel, rightArrowImageView, stackView].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
           
            photosView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photosView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photosView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photosView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
          
            photosLabel.topAnchor.constraint(equalTo: photosView.topAnchor, constant: firstInset),
            photosLabel.leadingAnchor.constraint(equalTo: photosView.leadingAnchor, constant: firstInset),
            photosLabel.trailingAnchor.constraint(equalTo: photosView.trailingAnchor, constant: -firstInset),
           
            rightArrowImageView.topAnchor.constraint(equalTo: photosView.topAnchor, constant: firstInset),
            rightArrowImageView.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            rightArrowImageView.trailingAnchor.constraint(equalTo: photosView.trailingAnchor, constant: -firstInset),
            rightArrowImageView.widthAnchor.constraint(equalToConstant: 24),
            rightArrowImageView.heightAnchor.constraint(equalToConstant: 28),
          
            stackView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: firstInset),
            stackView.leadingAnchor.constraint(equalTo: photosView.leadingAnchor, constant: firstInset),
            stackView.trailingAnchor.constraint(equalTo: photosView.trailingAnchor, constant: -firstInset),
            stackView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - (firstInset * 2 + secondInset * 3)) / 4),
            stackView.bottomAnchor.constraint(equalTo: photosView.bottomAnchor, constant: -firstInset)
        ])
        
    }
    
}
