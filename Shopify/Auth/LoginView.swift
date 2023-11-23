//
//  LoginView.swift
//  Shopify
//
//  Created by sahil on 16/11/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    @State private var messageStr = ""
    @State private var showAlert = false

    
    @State var nowLogin : Int? = nil
    
    var body: some View {
        NavigationView{
            
            ZStack(content: {
               BackgroundBGView()
                VStack(spacing: 16, content: {
                    Text("Audio")
                        .font(.custom(Constant.AppFonts.Roboto_Bold, size: 54))
                        .foregroundStyle(.white)
                        .padding(.top,32)
                    Text("It's modular and designed to last")
                        .font(Font.custom(Constant.AppFonts.Roboto_Bold, size: 14))
                        .foregroundStyle(.white)
                        .padding(.bottom,32)
                    Spacer()
                    
                    
                    VStack {
                        HStack {
                            Image(systemName: "envelope")
                                .foregroundColor(Color.black.opacity(0.3))
                            TextField("Email",
                                      text: $email)
                            
                            .font(.custom(Constant.AppFonts.Roboto_Regular, size: 16))
                            
                        }   .padding()
                            .background(Rectangle().fill(Color.white).cornerRadius(12))
                            .padding(.bottom,12)
                        
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(Color.black.opacity(0.3))
                            TextField("Password",
                                      text: $password)
                            .font(.custom(Constant.AppFonts.Roboto_Regular, size: 16))
                            
                        }   .padding()
                            .background(Rectangle().fill(Color.white).cornerRadius(12))
                        
                        
                        VStack{
                            Button("Forgot Password"){
                                
                            }.padding(.top,24)
                                .foregroundColor(.white)
                                .font(.custom(Constant.AppFonts.Roboto_Bold, size: 16))
                            
                        }
                    }   .padding()
                    
                    VStack{
                        
                        HStack{
                            NavigationLink(destination: SignupView(), tag: 1, selection: $nowLogin) {
                                Button(action: {
                                    self.nowLogin = 1
                                }) {
                                    HStack {
                                        Spacer()
                                        Text("Sign In").foregroundColor(.white)
                                        Spacer()
                                    }
                                }
                                .font(.custom(Constant.AppFonts.Roboto_Bold, size: 18))
                                
                            }
                            
                          
                            
                            
                        }.padding()
                            .background(Rectangle().fill(Color.appColor.defaultGreen).cornerRadius(12))
                        
                    } .padding()
                    
                    HStack(spacing: 8, content: {
                        Text("Didn’t have any account?")
                            .foregroundColor(.white)
                        Button("Sign Up here"){
                            
                        }.foregroundColor(Color.appColor.defaultGreen)
                            
                        
                    })
                    .padding(.top,8)
                    .font(.custom(Constant.AppFonts.Roboto_Regular, size: 16))
                })
                
            })
           // BackgroundBGView()
               
                
        }.navigationBarBackButtonHidden(true)
        
        
    }
}



#Preview {
    LoginView()
}


