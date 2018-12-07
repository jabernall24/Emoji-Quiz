//
//  ScoreSystemViewController.swift
//  Emoji Quiz
//
//  Created by Jesus Andres Bernal Lopez on 4/2/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

class ScoreSystemViewController: UIViewController {
    
    private let textView: UITextView = {
       let text = UITextView()
        text.textAlignment = .center
        text.font = UIFont.boldSystemFont(ofSize: 40)
        text.isEditable = false
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpLayout()
    }
    
    func setUpLayout(){
        view.addSubview(textView)
        textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
