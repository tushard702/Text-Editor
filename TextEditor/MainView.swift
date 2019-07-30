//
//  MainView.swift
//  TextEditor
//
//  Created by Tushar Garg on 12/06/19.
//  Copyright © 2019 Tushar Garg. All rights reserved.
//

import UIKit

class MainView: UIView {

    let topBar = UILabel()
    let bottomBar = UIView()
    let colorlabel = UITextField()
    let sizelabel = UITextField()
    let leftPanel = UITextView()
    let righttPanel = UITextView()
    let sizePicker = UIPickerView()
    let colorPicker = UIPickerView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    func setupViews(){
        
        addSubview(topBar)
        
        topBar.text = "Text Editor"
        topBar.font = UIFont(name: "Chalkduster", size: 20)
        topBar.backgroundColor = .black
        topBar.textColor = .white
        topBar.textAlignment = .center
        
        topBar.translatesAutoresizingMaskIntoConstraints = false
        topBar.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        topBar.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        topBar.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        topBar.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        addSubview(bottomBar)
        
        bottomBar.backgroundColor = .black
        
        bottomBar.translatesAutoresizingMaskIntoConstraints = false
        bottomBar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bottomBar.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        bottomBar.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        bottomBar.topAnchor.constraint(equalTo: self.bottomAnchor, constant: -65).isActive = true
        
        
        
        addSubview(colorlabel)
        
        colorlabel.backgroundColor = .white
        colorlabel.textColor = .black
        colorlabel.textAlignment = .center
        colorlabel.text = "Black"
        colorlabel.layer.masksToBounds = true
        colorlabel.layer.cornerRadius = 13
        
        colorlabel.translatesAutoresizingMaskIntoConstraints = false
        colorlabel.centerYAnchor.constraint(equalTo: bottomBar.centerYAnchor).isActive = true
        colorlabel.leftAnchor.constraint(equalTo: bottomBar.leftAnchor, constant: 16).isActive = true
        colorlabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        colorlabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        
        addSubview(sizelabel)
        
        sizelabel.backgroundColor = .white
        sizelabel.textColor = .black
        sizelabel.textAlignment = .center
        sizelabel.text = "16"
        sizelabel.layer.masksToBounds = true
        sizelabel.layer.cornerRadius = 13
        
        sizelabel.translatesAutoresizingMaskIntoConstraints = false
        sizelabel.centerYAnchor.constraint(equalTo: bottomBar.centerYAnchor).isActive = true
        sizelabel.rightAnchor.constraint(equalTo: bottomBar.rightAnchor, constant: -16).isActive = true
        sizelabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        sizelabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        addSubview(leftPanel)
        
        leftPanel.backgroundColor = .gray
        leftPanel.text = "1."
        leftPanel.textAlignment = .left
        leftPanel.font = UIFont.systemFont(ofSize: 20)
        leftPanel.isEditable = false
        leftPanel.showsVerticalScrollIndicator = false
        leftPanel.showsHorizontalScrollIndicator = false
        
        leftPanel.translatesAutoresizingMaskIntoConstraints = false
        leftPanel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        leftPanel.topAnchor.constraint(equalTo: topBar.bottomAnchor).isActive = true
        leftPanel.bottomAnchor.constraint(equalTo: bottomBar.topAnchor).isActive = true
        leftPanel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier:1/10).isActive = true
        
        
        
        addSubview(righttPanel)
        
        righttPanel.backgroundColor = .lightGray
        righttPanel.textAlignment = .left
        righttPanel.font = UIFont.systemFont(ofSize: 20)
        
        righttPanel.translatesAutoresizingMaskIntoConstraints = false
        righttPanel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        righttPanel.topAnchor.constraint(equalTo: topBar.bottomAnchor).isActive = true
        righttPanel.bottomAnchor.constraint(equalTo: bottomBar.topAnchor).isActive = true
        righttPanel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier:9/10).isActive = true
        
        
        sizePicker.isHidden = true
        
        righttPanel.addSubview(sizePicker)
        
        sizePicker.translatesAutoresizingMaskIntoConstraints = false
        sizePicker.centerXAnchor.constraint(equalTo: righttPanel.centerXAnchor).isActive = true
        sizePicker.centerYAnchor.constraint(equalTo: righttPanel.centerYAnchor).isActive = true
        sizePicker.heightAnchor.constraint(equalToConstant: 200).isActive = true
        sizePicker.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        colorPicker.isHidden = true
        
        righttPanel.addSubview(colorPicker)
        
        colorPicker.translatesAutoresizingMaskIntoConstraints = false
        colorPicker.centerXAnchor.constraint(equalTo: righttPanel.centerXAnchor).isActive = true
        colorPicker.centerYAnchor.constraint(equalTo: righttPanel.centerYAnchor).isActive = true
        colorPicker.heightAnchor.constraint(equalToConstant: 200).isActive = true
        colorPicker.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
