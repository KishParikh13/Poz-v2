//
//  CustomPicker.swift
//  Poz-v2
//
//  Created by Kish Parikh on 3/3/21.
//

import SwiftUI

struct CustomPicker : UIViewRepresentable {
    
    @Binding var selected : String
    
    func makeCoordinator() -> CustomPicker.Coordinator {
        
        return CustomPicker.Coordinator(parent1: self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<CustomPicker>) -> UIPickerView {
        
        let picker = UIPickerView()
        picker.dataSource = context.coordinator
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
    class Coordinator : NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
        
        var parent : CustomPicker
        init(parent1 : CustomPicker) {
            parent = parent1
            
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            
            return emojies.count
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
//        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//
//            return emojies[row]
//        }
        
        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 100, height: 120))
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
            
            label.text = emojies[row]
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 100)
            
//            view.backgroundColor = .red
            
            view.addSubview(label)
            return view
        }
        
        func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
            
            return UIScreen.main.bounds.width - 100
        }
        
        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
           
            return 120
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            
            self.parent.selected = emojies[row]
        }
        
    }
}

var emojies = ["🤩", "😊", "🙂", "😬", "😑"]
