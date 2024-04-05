//
//  ViewController.swift
//  autoLayout
//
//  Created by Anouar El maaroufi on 4/2/24.
//  Copyright © 2024 Anouar El maaroufi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    
    private let prevButton: UIButton = {
        let button = UIButton(type: .system)

        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    private let nextButton: UIButton = {
        let button = UIButton(type: .system)

        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    private let pageControl: UIPageControl = {
        let controlPagination = UIPageControl()

        controlPagination.currentPage = 0
        controlPagination.numberOfPages = 4
        controlPagination.pageIndicatorTintColor = UIColor.init(displayP3Red: 0, green: 0, blue: 255/255, alpha: 0.4)
        controlPagination.currentPageIndicatorTintColor = UIColor.init(displayP3Red: 0, green: 0, blue: 255/255, alpha: 0.8)
        
       return controlPagination
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(descriptionTextView)

        setupLayout()
        setupBottomControls()
    }

    fileprivate func setupBottomControls() {
        let bottomControlStackView = UIStackView()
        
        bottomControlStackView.addArrangedSubview(prevButton)
        bottomControlStackView.addArrangedSubview(pageControl)
        bottomControlStackView.addArrangedSubview(nextButton)
        bottomControlStackView.distribution = .fillEqually
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomControlStackView)

        NSLayoutConstraint.activate([bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), bottomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor), bottomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), bottomControlStackView.heightAnchor.constraint(equalToConstant: 50)])
        
    }
    
    private func setupLayout() {
        let topImageContainerView = UIView()

        view.addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false

        // auto layout constraints for the contaienr view
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

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
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}
