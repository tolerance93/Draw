//
//  ViewController.swift
//  Draw
//
//  Created by Tolerance on 2020/09/27.
//  Copyright © 2020 Tolerance. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let canvas = Canvas()
    
    let undoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Undo", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleUndo), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func handleUndo() {
        print("undo lines drawn")
        canvas.undo()
    }
    
    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Clear", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleClear), for: .touchUpInside)
        return button
    }()
    
    @objc func handleClear() {
        canvas.clear()
    }
    
    override func loadView(){
        self.view = canvas
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.addSubview(canvas)
        canvas.backgroundColor = .white
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        //canvas.frame = view.frame
        let stackView = UIStackView(arrangedSubviews: [
            undoButton,
            clearButton
        ])
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        //stackView.frame = CGRect(
        stackView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

