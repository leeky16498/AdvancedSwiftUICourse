//
//  ContentView.swift
//  AdvancedSwiftUICourse
//
//  Created by Kyungyun Lee on 06/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var email : String = ""
    @State var password : String = ""
    
    var body: some View {
        ZStack {
            
            Image("background-3")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                VStack(alignment: .leading, spacing: 16){
                    Text("Sign up")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                    Text("Access to 129+ hours of courses, tutorials, and livestreams")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.7))
                    HStack(spacing: 12) {
                        Image(systemName: "envelope.open.fill")
                            .foregroundColor(.white)
                        TextField("E-mail", text: $email)
                            .colorScheme(.dark)
                            .foregroundColor(.white.opacity(0.7))
                            .autocapitalization(.none)
                            .textContentType(.emailAddress)
                    }
                    .frame(height : 52)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.white, lineWidth : 1.0)
                            .blendMode(.overlay)
                    )
                    .background(
                        Color("secondaryBackground")
                            .cornerRadius(16)
                            .opacity(0.8)
                    )
                    
                    HStack(spacing: 12) {
                        Image(systemName: "key.fill")
                            .foregroundColor(.white)
                        SecureField("Password", text: $password)
                            .colorScheme(.dark)
                            .foregroundColor(.white.opacity(0.7))
                            .autocapitalization(.none)
                            .textContentType(.emailAddress)
                    }
                    .frame(height : 52)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.white, lineWidth : 1.0)
                            .blendMode(.overlay)
                    )
                    .background(
                        Color("secondaryBackground")
                            .cornerRadius(16)
                            .opacity(0.8)
                    )
                    
                    GradientButton()
                    
                    Text("By clicking on sign, you agree on our terms and services. Let's start it right now!")
                        .font(.footnote)
                        .foregroundColor(.white.opacity(0.7))
                    Rectangle()
                        .frame(height : 1)
                        .foregroundColor(Color.white.opacity(0.1))
                    VStack(alignment: .leading, spacing: 16){
                        Button(action: {
                            
                        }, label: {
                            HStack{
                                Text("Already have an account?")
                                    .font(.footnote)
                                    .foregroundColor(Color.white.opacity(0.7))
                                GradientText(text: "Sign in")
                            }
                        })
                    }
                }
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.white.opacity(0.2))
                        .background(Color("secondaryBackground").opacity(0.5))
                        .background(VisualEffectBlur(blurStyle: .systemThinMaterialDark))
                        .shadow(color: Color("shadowColor").opacity(0.5), radius: 60, x: 0, y: 30)
                )
                .cornerRadius(30)
                .padding(.horizontal)
                
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    
    public func gredientForeground(colors : [Color]) -> some View{
        self.overlay(LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(self)
    }
    
    
}

struct GradientText: View {
    
    var text : String = "Sign in"
    
    var body: some View {
        Text(text)
            .font(.headline)
            .gredientForeground(colors: [Color("pink-gradient-1"), Color("pink-gradient-2")])
    }
}

struct GradientButton: View {
    var body: some View {
        Button(action: {
            
        }, label: {
            GeometryReader {geometry in
                ZStack {
                    AngularGradient(gradient: Gradient(colors: [.red, .blue]), center: .center, angle: .degrees(0))
                        .blendMode(.overlay)
                        .blur(radius: 8)
                        .mask(
                            RoundedRectangle(cornerRadius: 16)
                                .frame(height : 50)
                                .frame(maxWidth : geometry.size.width - 16)
                        )
                        .blur(radius: 8)
                    
                    GradientText(text: "Sign up")
                        .font(.headline)
                        .frame(width : geometry.size.width - 16)
                        .frame(height : 50)
                        .background(
                            Color("tertiaryBackground")
                                .opacity(0.9)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white, lineWidth: 1.9)
                                .blendMode(.normal)
                                .opacity(0.7)
                        )
                        .cornerRadius(16)
                }
            }
            .frame(height : 50)
        })
    }
}
