//
//  TextField.swift
//  Poz-v2
//
//  Created by Kish Parikh on 3/11/21.
//

import SwiftUI

struct MFTextField: UIViewRepresentable {
    
    @Binding var text: String
    
    func makeCoordinator() -> Coordinator {
        return MFTextField.Coordinator(parent1: self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MFTextField>) -> UITextView {
        let textView = UITextView()
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        textView.isScrollEnabled = true
        textView.text = "Type Something"
        textView.textColor = .gray
        textView.font = .systemFont(ofSize: 16)
        textView.delegate = context.coordinator
        return textView;
        
    }
     
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<MFTextField>) {
    }
    
    class Coordinator : NSObject, UITextViewDelegate {
        
        var parent : MFTextField
        
        init (parent1 : MFTextField) {
            parent = parent1
        }
        
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.text  = textView.text
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            textView.text = ""
            textView.textColor = .label
        }
    }
}

//struct TextField_Previews: PreviewProvider {
//    static var previews: some View {
//        TextField()
//    }
//}
