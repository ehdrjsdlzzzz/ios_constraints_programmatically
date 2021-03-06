//
//  ViewController.swift
//  Practice2
//
//  Created by 이동건 on 2017. 11. 7..
//  Copyright © 2017년 이동건. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let colorView = UIView()
    let changeConsBtn = UIButton()
    var ConsArray:[NSLayoutConstraint] = []
    var newConsArray:[NSLayoutConstraint] = []
    
    var isNewCons:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setButton()
        setView()
    }
    
    func setView(){
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.backgroundColor = .orange
        self.view.addSubview(colorView)
    
        let leadingCons = colorView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingCons = colorView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let topCons = colorView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let bottomCons = colorView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50)
        
        ConsArray = [leadingCons, trailingCons, topCons, bottomCons]
        NSLayoutConstraint.activate(ConsArray)
    }
    
    func setButton(){
        changeConsBtn.translatesAutoresizingMaskIntoConstraints = false
        changeConsBtn.backgroundColor = .darkGray
        changeConsBtn.setTitle("Change Constraints", for: .normal)
        changeConsBtn.setTitleColor(.white, for: .normal)
        changeConsBtn.addTarget(self, action: #selector(changeBtnTapped), for: .touchUpInside)
        self.view.addSubview(changeConsBtn)
        
        changeConsBtn.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
        changeConsBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        changeConsBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        changeConsBtn.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
    }
    
    @objc func changeBtnTapped(){
        if isNewCons {
            NSLayoutConstraint.deactivate(newConsArray)
            NSLayoutConstraint.activate(ConsArray)
            isNewCons = false
        }else {
            NSLayoutConstraint.deactivate(ConsArray)
            
            let heightCons = colorView.heightAnchor.constraint(equalToConstant: 200.0)
            let widthCons = colorView.widthAnchor.constraint(equalToConstant: 200.0)
            let horizontalCons = colorView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            let verticalCons = colorView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            
            newConsArray = [heightCons, widthCons, horizontalCons, verticalCons]
            NSLayoutConstraint.activate(newConsArray)
            isNewCons = true
        }
    }
}

