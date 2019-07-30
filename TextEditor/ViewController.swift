//
//  ViewController.swift
//  TextEditor
//
//  Created by Tushar Garg on 11/06/19.
//  Copyright © 2019 Tushar Garg. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{

    let mainView = MainView()
    
    var lineNumber = 1
    var textString = "1."
    
    let sizes = [12,14,16,18,20]
    let color = ["black", "Red", "blue"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        mainView.leftPanel.delegate = self
        mainView.righttPanel.delegate = self
        mainView.sizePicker.delegate = self
        mainView.sizePicker.dataSource = self
        mainView.sizelabel.delegate = self
        mainView.colorlabel.delegate = self
        mainView.colorPicker.delegate = self
        mainView.colorPicker.dataSource = self
        setupViews()
    }
    
    func setupViews(){
        
        view.addSubview(mainView)
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == mainView.leftPanel{
            mainView.righttPanel.contentOffset = mainView.leftPanel.contentOffset
        }
        
        else if scrollView == mainView.righttPanel{
            mainView.leftPanel.contentOffset = mainView.righttPanel.contentOffset
        }
    }

    func textViewDidChange(_ textView: UITextView) {
        
        lineNumber = 1
        
        for character in textView.text{
            
            if character == "\n"{
                
                lineNumber += 1
                textString = ""
                
                for i in 1 ... lineNumber{
                    
                    textString = textString + "\(i).\n"
                    
                }
            }
        }
        
        mainView.leftPanel.text = textString
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == mainView.colorPicker{
            return color.count
        }else{
            
            return sizes.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == mainView.sizePicker{
            return String(sizes[row])
        }
        
        else{
            return String(color[row])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == mainView.sizePicker{
        
            mainView.righttPanel.font = UIFont.systemFont(ofSize: CGFloat(sizes[row]))
            mainView.leftPanel.font = UIFont.systemFont(ofSize: CGFloat(sizes[row]))
            mainView.sizelabel.text = String(sizes[row])
            mainView.sizePicker.isHidden = true
            
        }else{
        
            mainView.colorPicker.isHidden = true
            if color[row] == "black"{
                
                mainView.righttPanel.textColor = .black
                mainView.colorlabel.textColor = .black
                mainView.colorlabel.text = "black"
                mainView.colorlabel.resignFirstResponder()
            }
            
            else if color[row] == "Red"{
                
                mainView.righttPanel.textColor = .red
                mainView.colorlabel.textColor = .red
                mainView.colorlabel.text = "red"
                mainView.colorlabel.resignFirstResponder()
            }
            
            else if color[row] == "blue"{
                
                mainView.righttPanel.textColor = .blue
                mainView.colorlabel.textColor = .blue
                mainView.colorlabel.text = "blue"
                mainView.colorlabel.resignFirstResponder()
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == mainView.sizelabel{
            mainView.sizePicker.isHidden = false
        }else{
            mainView.colorPicker.isHidden = false
        }
    }
}

