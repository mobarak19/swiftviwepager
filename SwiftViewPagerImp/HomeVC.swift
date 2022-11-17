//
//  ViewController.swift
//  SwiftViewPagerImp
//
//  Created by Genusys Inc on 11/17/22.
//

import UIKit

class HomeVC: UIViewController {

    private var firstVC = FirstVC()
    private var secondVC = SecondVC()
    private var thirdVC = ThirdVC()

    private var scrollView:UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: view.frame.size.width*3, height: 0)
        view.addSubview(scrollView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        addChildViews()
    }
    private func addChildViews(){
        addChild(firstVC)
        addChild(secondVC)
        addChild(thirdVC)
        
        scrollView.addSubview(firstVC.view)
        scrollView.addSubview(secondVC.view)
        scrollView.addSubview(thirdVC.view)
        
        firstVC.view.frame = CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
        secondVC.view.frame = CGRect(x:scrollView.frame.size.width, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
        thirdVC.view.frame = CGRect(x: scrollView.frame.size.width*2, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
        firstVC.didMove(toParent: self)
        secondVC.didMove(toParent: self)
        thirdVC.didMove(toParent: self)

    }
    @IBAction func didChangeMenuSegment(_ sender: UISegmentedControl) {
       if sender.selectedSegmentIndex == 0{
           scrollView.setContentOffset(.zero, animated: true)
       }else if sender.selectedSegmentIndex == 1{
           scrollView.setContentOffset(CGPoint(x: view.frame.size.width, y: 0) , animated: true)

       }else{
           scrollView.setContentOffset(CGPoint(x: view.frame.size.width*2, y: 0), animated: true)

       }
    }
}

