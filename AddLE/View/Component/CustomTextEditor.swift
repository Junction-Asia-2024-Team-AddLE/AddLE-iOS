//
//  CustomTextEditor.swift
//  AddLE
//
//  Created by 이정동 on 8/11/24.
//

import SwiftUI

struct CustomTextEditor: UIViewRepresentable {
  @Binding var text: String
  
  func makeUIView(context: Context) -> UITextView {
    let textView = UITextView()
    textView.delegate = context.coordinator
    textView.backgroundColor = UIColor(resource: .grayKey) // 배경색 변경
    textView.textColor = UIColor.black // 텍스트 색상 변경
    textView.tintColor = UIColor.black // 커서 색상 변경
    textView.font = UIFont.systemFont(ofSize: 18)
    return textView
  }
  
  func updateUIView(_ uiView: UITextView, context: Context) {
    uiView.text = text
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  class Coordinator: NSObject, UITextViewDelegate {
    var parent: CustomTextEditor
    
    init(_ parent: CustomTextEditor) {
      self.parent = parent
    }
    
    func textViewDidChange(_ textView: UITextView) {
      parent.text = textView.text
    }
  }
}
