//
//  SwipingController.swift
//  autoLayout
//
//  Created by Anouar El maaroufi on 4/4/24.
//  Copyright © 2024 Anouar El maaroufi. All rights reserved.
//

import UIKit

extension UIColor {
    static var leetGreen: UIColor {
      return UIColor(red: 121/255, green: 165/255, blue: 61/255, alpha: 1)
    }
}

private let reuseIdentifier = "Cell"

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let pages = [Page(imageName: "1337", headerText: "Welcome to 1337", bodyText: "1337 is a coding school, free of charge, with no pre-requisites of educational background, for all young from 18 to 30, First go to candidature.1337.ma to register"), Page(imageName: "controller", headerText: "Online Test Game", bodyText: "You have to pass two games that requires your logical thinking, make sure you are on the focus mode"), Page(imageName: "checkin", headerText: "Checkin Presence", bodyText: "You will have an online meeting on Zoom explaining all school stuffs, so make sure to attend otherwise you won't move to the next step"), Page(imageName: "coding", headerText: "Pool", bodyText: "This is the final part, You will have a 4 week immersion full of coding and challenges")]

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        setupBottomControls()
        // Register cell classes
        self.collectionView!.register(CellPage.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView?.backgroundColor = .white
        self.collectionView?.isPagingEnabled = true
        // Do any additional setup after loading the view.
    }

    private let prevButton: UIButton = {
        let button = UIButton(type: .system)

        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // Add action to the previous button
        button.addTarget(self, action: #selector(handlePrevPage), for: .touchUpInside)
        
        return button
    }()

    private let nextButton: UIButton = {
        let button = UIButton(type: .system)

        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.setTitleColor(UIColor.leetGreen, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // Add action to the next button
        button.addTarget(self, action: #selector(handleNextPage), for: .touchUpInside)
        
        return button
    }()

    // Previous button action
    @objc private func handlePrevPage() {
        
        pageControl.currentPage = pageControl.currentPage - 1 < 0 ? pageControl.currentPage : pageControl.currentPage - 1
        let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
        
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    // Next button action
    @objc private func handleNextPage() {
        
        pageControl.currentPage = pageControl.currentPage + 1 > pageControl.numberOfPages ? pageControl.currentPage : pageControl.currentPage + 1
        
        let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
        
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }

    private lazy var pageControl: UIPageControl = {
        let controlPagination = UIPageControl()

        controlPagination.currentPage = 0
        controlPagination.numberOfPages = pages.count
        controlPagination.pageIndicatorTintColor = UIColor(displayP3Red: 220/255, green: 232/255, blue: 213/255, alpha: 1)
        controlPagination.currentPageIndicatorTintColor = UIColor.leetGreen
        
       return controlPagination
    }()

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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let currentScrollPage = targetContentOffset.pointee.x / view.frame.width

        pageControl.currentPage = Int(currentScrollPage)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return pages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CellPage
        
        // Configure the cell
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }

}
