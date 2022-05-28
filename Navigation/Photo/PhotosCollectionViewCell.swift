//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Iurasova Katya on 23.05.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private var startingFrame: CGRect?
    private var buttonClose = UIButton()
    private var backView = UIView(frame: .zero)
    private var zoomingImageView = UIImageView(frame: .zero)

    private lazy var photosImageView: UIImageView = {
        let photosImageView = UIImageView()
        photosImageView.translatesAutoresizingMaskIntoConstraints = false
        photosImageView.backgroundColor = .black
        photosImageView.contentMode = .scaleAspectFill
        photosImageView.layer.cornerRadius = 0
        photosImageView.clipsToBounds = true
        photosImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(zoomImageView)))
        photosImageView.isUserInteractionEnabled = true
        return photosImageView
        }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photosImageView.image = nil
    }
    
    private func setupLayout() {
        addSubview(photosImageView)
        
        photosImageView.heightAnchor.constraint(equalTo: photosImageView.widthAnchor, multiplier: 0.5).isActive = true
        photosImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        photosImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        photosImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        photosImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
 
    
    func setup(with image: UIImage?) {
        self.photosImageView.image = image
    }
    
    @objc func zoomImageView() {
        self.startingFrame = photosImageView.superview?.convert(photosImageView.frame, to: nil)
        zoomingImageView = UIImageView(frame: startingFrame!)
        zoomingImageView.backgroundColor = .systemPink
        zoomingImageView.image = photosImageView.image
        
        if let keyWindow = UIApplication.shared.connectedScenes.compactMap({ $0 as? UIWindowScene }).flatMap({ $0.windows }).first(where: { $0.isKeyWindow }) {
            backView = UIView(frame: keyWindow.frame)
            
            setup(buttonClose)
            setup(backView)
            
            keyWindow.addSubview(backView)
            keyWindow.addSubview(zoomingImageView)
            keyWindow.addSubview(buttonClose)
            
            NSLayoutConstraint.activate([
                self.buttonClose.topAnchor.constraint(equalTo: self.backView.safeAreaLayoutGuide.topAnchor, constant: 16),
                self.buttonClose.trailingAnchor.constraint(equalTo: self.backView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                self.buttonClose.widthAnchor.constraint(equalToConstant: 50),
                self.buttonClose.heightAnchor.constraint(equalToConstant: 50)
            ])
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
                self.backView.alpha = 0.8
                
                self.zoomingImageView.frame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: self.backView.frame.height / 3)
                self.zoomingImageView.center = keyWindow.center
            } completion: { _ in }
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
                self.buttonClose.alpha = 1
            } completion: { _ in }


        }
    }
    func setupCell(_ photo: PhotosModel) {
        photosImageView.image = UIImage(named: photo.image)
       }
    
    func setup(_ button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "clear.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 50)), for: .normal)
        button.tintColor = .white
        button.alpha = 0
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func setup(_ view: UIView) {
        view.backgroundColor = .systemGray3
        view.alpha = 0
    }
    
    @objc func buttonTapped() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.buttonClose.alpha = 0
            self.backView.alpha = 0
            self.photosImageView.alpha = 1
            self.photosImageView.isHidden = false
            self.zoomingImageView.frame = self.startingFrame!
            self.zoomingImageView.alpha = 0
        }, completion: nil)
    }
}
