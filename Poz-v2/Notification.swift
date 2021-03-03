//
//  Notification.swift
//  Poz-v2
//
//  Created by Kish Parikh on 3/3/21.
//

import SwiftUI


struct Notification: View {
    
    @State private var notificationText: String = "Success"

    var body: some View {
        Text(notificationText)
            .padding()
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width-20, height: 60)
            .background(Color.green)
            .cornerRadius(20)
        
    }
}

struct Notification_Previews: PreviewProvider {
    static var previews: some View {
        Notification()
    }
}
