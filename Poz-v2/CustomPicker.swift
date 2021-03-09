import SwiftUI

struct CustomPicker : UIViewRepresentable {
    
    //variable to hold selected value
    @Binding var selected : String
    
    //code and functionality adapted from Kavsoft: https://www.youtube.com/watch?v=uPFk2BuNT5M
    
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
        
        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            
            //set location and size of picker
            let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 100, height: 120))
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
            
            //format text
            label.text = emojies[row]
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 100)
  
            view.addSubview(label)
            return view
        }
        
        func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
            
            return UIScreen.main.bounds.width - 100
        }
        
        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
           
            //height of picker
            return 120
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            
            self.parent.selected = emojies[row]
        }
        
    }
}


//all emoji data
var emojies = ["", "🤩", "🥳", "😎", "😍", "😇", "🥸", "🤯", "🤠", "😂", "😝", "🥲", "😏", "😊", "☺️", "😌", "🙃", "🙂", "😬", "😐", "😕", "🙁", "☹️", "😟", "😧", "🤒", "🥴", "😩", "😭", "😓", "🙄", "😳", "😵", "🤔", "🥱", "🤢", "😤", "🥵", "🤬"]
