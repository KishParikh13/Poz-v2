import SwiftUI

struct EnterName: View {
    
    @EnvironmentObject var user: User
    
    @State public var isEditing = false
    
    var body: some View {
        VStack {

            //heading text
            EnterName_Text()
            
            // text field
            TextField("Your name", text: $user.name)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .border(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                .padding(.horizontal, 40)
                .padding(.bottom, 100)
                .font(Font.custom("Poppins-Regular", size: 16))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
        //.navigationBarBackButtonHidden(true)
    }
}

struct userNameOutput: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        if ((user.name == "")) {
            Text("""
                Good morning,
                you
                """)
                .font(Font.custom("Blueberry", size: 32))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 0)
                .padding(.top, 15)
                .padding(.leading, 16)
        } else {
            Text(
                """
                Good Morning,
                """ + user.name)
                .font(Font.custom("Blueberry", size: 32))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 0)
                .padding(.top, 15)
                .padding(.leading, 16)
        }
    }
}


// heading text
struct EnterName_Text: View {
    var body: some View {
        Text("Enter Your Name")
            .font(Font.custom("Blueberry", size: 40))
            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
            .padding(.top, 20)
            .padding(.bottom, 2)
        Text("For a personal touch")
            .font(Font.custom("Poppins-Regular", size: 20))
            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
        Spacer()
    }
}
