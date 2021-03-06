import SwiftUI

struct Onboarding: View {
    var body: some View {
        OnboardOne()
        //OnboardTwo()
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

struct OnboardOne: View {
    var body: some View {
        //OnboardOne
        VStack {

            //heading text
            Welcome_Text()
            
            
            // big image
            HeroImage()
            .padding(.top, -60)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
    }
}

// home screen text
struct Welcome_Text: View {
    var body: some View {
    //    Spacer()
        Text("Welcome to Poz")
            .font(Font.custom("Blueberry Regular", size: 48))
            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
            .padding(.top, 80)
            .padding(.bottom, 2)
        Text("Take a moment for yourself")
            .font(Font.custom("Poppins-Regular", size: 20))
            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
     //   Spacer()
    }
}

//home screen image // Illustration by Freepik Storyset
struct HeroImage: View {
    var body: some View {
        ZStack {
            Image("Alone-cuate").resizable()
                .frame(width: 400, height: 400)
        }
    }
}

