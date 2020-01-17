//
//  ViewController.swift
//  UISEGMENTEDCONTROL-1
//
//  Created by Syed.Reshma Ruksana on 01/10/19.
//  Copyright © 2019 Syed.Reshma Ruksana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var serverConnection = online()
    
    var allLabelValues = [UILabel]()
    var allButtonValues = [UIButton]()
    var allSwitchValues = [UISwitch]()
    
    
    var onOffSegment:UISegmentedControl!
    var labelSegment:UISegmentedControl!
    var verticalSegment:UISegmentedControl!
    var valueLbl:UILabel!
    var getBtn:UIButton!
    
    var createBtn:UIButton!
    
    
    var onSlider:UISlider!
    var onStepper:UIStepper!
    
    var scroll:UIScrollView!
    var scrollView:UIScrollView!
    
    var loopCount = 1
    
    var xpos = 10
    var ypos = 30
    
    var onlineStepper = UIStepper()
    var convertedData:[String:Any] = [:]
    var componentNumber = 0
    var executionCount = 0
    var componentQuantity = 0
    var maxPerRow =  10
    var visitedOnline = 0
    var displayNumber = 1
    var alphabetNumber = 0
    var component = ""
    var axis = ""
    var addStepper = 0
    var segmentCount = 0
    var componentCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        
        createUISegment()
        
        onStepper.addTarget(self, action: #selector(stepperValue), for: UIControl.Event.valueChanged)
        
        onSlider.addTarget(self, action: #selector(sliderValue), for: UIControl.Event.valueChanged)
        
        onOffSegment.addTarget(self, action: #selector(offLine(onAndOffSC:)), for: UIControl.Event.valueChanged)
        
        createBtn.addTarget(self, action: #selector(onCreateBtn), for: UIControl.Event.touchUpInside)
        
        getBtn.addTarget(self, action: #selector(getDataBtn), for: UIControl.Event.touchUpInside)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
    
    
    @objc func createUISegment(){
        
        
        labelSegment = UISegmentedControl(items: ["Label","Button","Switch"])
        labelSegment.frame = CGRect(x: 30, y: 130, width: 200, height: 40)
        labelSegment.backgroundColor = .cyan
        labelSegment.layer.cornerRadius = 18
        labelSegment.tintColor = UIColor.orange
        view.addSubview(labelSegment)
        
        
        verticalSegment = UISegmentedControl(items: ["Horizontal","Vertical"])
        verticalSegment.frame = CGRect(x: 255, y: 130, width: 140, height: 40)
        verticalSegment.backgroundColor = .white
        verticalSegment.tintColor = .orange
        verticalSegment.layer.cornerRadius = 17
        view.addSubview(verticalSegment)
        
        
        
        
        onOffSegment = UISegmentedControl(items: ["Offline","Online"])
        onOffSegment.frame = CGRect(x: 125, y: 70, width: 150, height:  40)
        onOffSegment.backgroundColor = .brown
        onOffSegment.tintColor = UIColor.white
        view.addSubview(onOffSegment)
        
        
        onSlider = UISlider()
        onSlider.frame = CGRect(x: 40, y: 210, width: 150, height: 25)
        onSlider.minimumTrackTintColor = .red
        onSlider.maximumTrackTintColor = .green
        onSlider.thumbTintColor = .blue
        onSlider.minimumValue = 1
        onSlider.maximumValue = 1000
        onSlider.value = 1
        view.addSubview(onSlider)
        
        valueLbl = UILabel()
        valueLbl.frame = CGRect(x: 210, y: 200, width: 65, height: 50)
        valueLbl.textColor =  .white
        valueLbl.textAlignment = NSTextAlignment.center
        view.addSubview(valueLbl)
        
        
        onStepper = UIStepper()
        onStepper.frame = CGRect(x: 300, y: 210, width: 20, height: 20)
        onStepper.minimumValue = 1
        onStepper.maximumValue = 1000
        onStepper.value = 1
        view.addSubview(onStepper)
        
        
        createBtn = UIButton()
        createBtn.frame = CGRect(x: 125, y: 300, width: 150, height: 45)
        createBtn.backgroundColor = .black
        createBtn.layer.cornerRadius = 20
        createBtn.setTitle("Create", for: UIControl.State.normal)
        view.addSubview(createBtn)
        
        
        scroll = UIScrollView()
        scroll.frame = CGRect(x: 20, y: 375, width: 380, height: 450)
        scroll.contentSize = CGSize(width: 1000, height: 1550)
        scroll.backgroundColor = .orange
        view.addSubview(scroll)
        
        getBtn = UIButton()
        getBtn.frame = CGRect(x: 125, y: 250, width: 150, height: 45)
        getBtn.backgroundColor = .orange
        getBtn.layer.cornerRadius = 20
        getBtn.setTitle("GetData", for: UIControl.State.normal)
        getBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        
        
        scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 20, y: 375, width: 380, height: 450)
        scrollView.contentSize = CGSize(width: 1000, height: 1550)
        scrollView.backgroundColor = .gray
        
    }
    
    
    
    @objc func stepperValue(){
        
        valueLbl.text = String(Int(onStepper.value))
        onSlider.value = Float(onStepper.value)
        onViewChange(viewSC: verticalSegment)
        onStepper.addTarget(self,action: #selector(onCreateBtn), for:UIControl.Event.valueChanged)
        
    }
    
    @objc func sliderValue(){
        
        valueLbl.text = String(Int(onSlider.value))
        onStepper.value = Double(onSlider.value)
    }
    
    
    @objc func offLine(onAndOffSC:UISegmentedControl){
        
        switch onAndOffSC.selectedSegmentIndex {
            
        case 0:
            view.backgroundColor = .gray
            scrollView.subviews.forEach({ $0.removeFromSuperview() })
            onlineStepper.removeFromSuperview()
            
            view.addSubview(labelSegment)
            view.addSubview(verticalSegment)
            view.addSubview(onSlider)
            view.addSubview(valueLbl)
            view.addSubview(onStepper)
            view.addSubview(createBtn)
            view.addSubview(scroll)
            getBtn.removeFromSuperview()
            scrollView.removeFromSuperview()
            
        case 1:
            view.backgroundColor = .yellow
            labelSegment.removeFromSuperview()
            verticalSegment.removeFromSuperview()
            onSlider.removeFromSuperview()
            valueLbl.removeFromSuperview()
            onStepper.removeFromSuperview()
            createBtn.removeFromSuperview()
            scroll.removeFromSuperview()
            view.addSubview(scrollView)
            view.addSubview(getBtn)
            
        default:
            ("Error")
        }
        
    }
    
    
    @objc func component(componentSC:UISegmentedControl){
        
        switch componentSC.selectedSegmentIndex {
        case 0:
            var label:UILabel!
            label = UILabel()
            label.frame = CGRect(x: xpos+10, y: ypos, width: 42, height: 20)
            label.text = "\(loopCount)"
            label.backgroundColor = UIColor.white
            allLabelValues.append(label)
            scroll.addSubview(label)
        case 1:
            
            var button:UIButton!
            button = UIButton()
            self.allButtonValues.append(button)
            button.frame = CGRect(x: xpos, y: ypos, width: 35, height: 20)
            button.backgroundColor = UIColor.black
            button.setTitle("\(loopCount)", for: UIControl.State.normal)
            self.scroll.addSubview(button)
            
            
        case 2:
            var mySwitch:UISwitch!
            mySwitch = UISwitch()
            self.allSwitchValues.append(mySwitch)
            mySwitch.tintColor = .black
            
            mySwitch.thumbTintColor = .white
            mySwitch.frame = CGRect(x: xpos, y: ypos, width: 20, height: 20)
            scroll.addSubview(mySwitch)
            
            
        default:
            break
        }
       
    }
    
    
    @objc func onViewChange(viewSC:UISegmentedControl){
        for val in allLabelValues{
            val.removeFromSuperview()
        }
        for val in allButtonValues{
            val.removeFromSuperview()
        }
        for val in allSwitchValues{
            val.removeFromSuperview()
        }
        
        switch viewSC.selectedSegmentIndex {
            
        case 0:
            
            
            
            for _ in 1...(Int(onSlider.value)){
                for _ in 1...20 {
                    if (loopCount <= (Int(onSlider.value)))
                    {
                        component(componentSC:labelSegment)
                        loopCount += 1
                        xpos += 50
                    }
                }
                xpos = 10
                ypos += 30
            }
            loopCount = 1
            xpos = 10
            ypos = 20
            
            
            
        case 1:
            
            for _ in 1...(Int(onSlider.value)){
                for _ in 1...60 {
                    if (loopCount <= (Int(onSlider.value))){
                        component(componentSC:labelSegment)
                        loopCount += 1
                        ypos += 40
                    }
                }
                ypos = 20
                xpos += 50
            }
            loopCount = 1
            xpos = 10
            ypos = 20
        default:
            break
        }
        
    }
    
    
    
    @objc func onCreateBtn(){
        onViewChange(viewSC:verticalSegment)
        
        
    }
    @objc func getDataBtn(){
        // serverConnection.onlineDetails()
        getDataFromServer()
        
    }
    @objc func getDataFromServer(){
        
        onlineStepper.removeFromSuperview()
        
        
        convertedData = serverConnection.onlineDetails()
        print(convertedData)
        axis = serverConnection.axis
        if(axis == "Horizontal") {
            maxPerRow = serverConnection.maxPerRow
        }else {
            maxPerRow = serverConnection.maxPerColumn
        }
        
        component = serverConnection.component
        componentQuantity = serverConnection.componentQuantity
        displayNumber = serverConnection.displayNumbers
        addStepper = serverConnection.changeQuantity
        
        alphabetNumber = 0
        createComponents()
        
        if(addStepper == 1){
            onlineStepper.frame =  CGRect(x: 165, y: 135, width: 30, height: 30)
            view.addSubview(onlineStepper)
        }
        
    }
    
    // creating function for Axis control for server based creations
    
    @objc func createComponents() {
        
        scrollView.isScrollEnabled = true
       
         scrollView.subviews.forEach({ $0.removeFromSuperview() })
        
        
        
       // view.addSubview(scrollView)
        
        
        
       
        
        
        if(componentQuantity > 0 && maxPerRow > 0){
            
            for  _ in 1...componentQuantity {
                
                
                for _ in 1...maxPerRow{
                    
                    if(componentCount < componentQuantity){
                        
                        componentNumber += 1
                        
                        selectedComponents(selectedValue: component)
                        
                        if(axis == "Horizontal"){
                            xpos += 60
                        }
                        if(axis == "Vertical"){
                            ypos += 50
                        }
                        componentCount += 1
                        
                    }
                    
                }
                
                if(axis == "Horizontal"){
                    xpos = 10
                    ypos += 40
                }
                if(axis == "Vertical"){
                    ypos = 20
                    xpos += 60
                }
                
            }
            
            xpos = 10
            ypos = 20
            componentCount = 0
            componentNumber = 0
            
        }
        onlineStepper.addTarget(self, action: #selector(stepperFunction(stepper:)), for: UIControl.Event.valueChanged)
        onStepper.value = Double(componentQuantity)
        onlineStepper.value = Double(componentQuantity)
    }
    
    // creating function for creating components using server
    
    func selectedComponents(selectedValue: String) {
        
        switch selectedValue{
        case "Label":
            let label = UILabel()
            label.frame = CGRect(x: xpos, y: ypos, width: 35, height: 38)
            label.backgroundColor = UIColor.green
            label.textAlignment = .center
            if(displayNumber == 1){
                label.text = "\(componentNumber)"
            }
            else {
                if(alphabetNumber == 26){
                    alphabetNumber = 0
                }
                
                label.text = "\(serverConnection.alphabets[alphabetNumber])"
                alphabetNumber += 1
            }
            label.textColor = UIColor.black
            scrollView.addSubview(label)
            
        case "Button":
            let button = UIButton()
            button.frame = CGRect(x: xpos, y: ypos, width: 50, height: 30)
            button.backgroundColor = UIColor.brown
            if(displayNumber == 1){
                button.setTitle("\(componentNumber)", for: UIControl.State.normal)
            }
            else {
                
                if(alphabetNumber == 26){
                    alphabetNumber = 0
                }
                
                button.setTitle("\(serverConnection.alphabets[alphabetNumber])", for: UIControl.State.normal)
                alphabetNumber += 1
            }
            
            button.setTitleColor(UIColor.black, for: UIControl.State.normal)
            scrollView.addSubview(button)
            
        case "Switch":
            let switchView = UISwitch()
            switchView.frame = CGRect(x: xpos, y: ypos, width: 35, height: 38)
            scrollView.addSubview(switchView)
            
            
        default:
            print("Something's not right")
            
        }
    }
    
    // creating function for stepper
    
    @objc func stepperFunction(stepper: UIStepper) {
        alphabetNumber = 0
        if(stepper == onStepper){
            componentQuantity = Int(onStepper.value)
            
            onSlider.setValue(Float(onStepper.value), animated: true)
            valueLbl.text = "\(Int(onSlider.value))"
            
            onViewChange(viewSC: verticalSegment)
        }
        if(stepper == onlineStepper){
            componentQuantity = Int(onlineStepper.value)
            
            createComponents()
        }
        
    }
    
}
