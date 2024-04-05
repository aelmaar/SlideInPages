//
//  CellPage.swift
//  autoLayout
//
//  Created by Anouar El maaroufi on 4/4/24.
//  Copyright © 2024 Anouar El maaroufi. All rights reserved.
//

import UIKit

class CellPage: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            
            guard let unwrappedPage = page else { return }
            bearImageView.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])

            attributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.gray]))

            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }

    private let bearImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "money-bag"))
        imageView.translatesAutoresizingMaskIntoConstraints = false

        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()

        let attributedText = NSMutableAttributedString(string: "How to save your money", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])

        attributedText.append(NSAttributedString(string: "\n\n\nLet's get started with all the necessary tools that should make you rich and start earning the money", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false

        return textView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(descriptionTextView)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
            let topImageContainerView = UIView()

            addSubview(topImageContainerView)
            topImageContainerView.translatesAutoresizingMaskIntoConstraints = false

            // auto layout constraints for the contaienr view
            topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
            topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
            topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

            // add image view to the container
            topImageContainerView.addSubview(bearImageView)

            // auto layout constraints for the image view
            bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
            bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
            bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true

    //        bearImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    //        bearImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
    //        bearImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    //        bearImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true

            // auto layout constraints for the text view
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
            descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
            descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
            descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        }

}
