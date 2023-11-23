//
//  SignupView.swift
//  Shopify
//
//  Created by sahil on 16/11/23.
//

import SwiftUI

struct SignupView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var nowLogin : Int? = nil
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView(content: {
            ZStack(content: {
                BackgroundBGView()
                VStack(content: {
                    ScrollView {
                        VStack(content: {
                            //                    Spacer()
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
                                
                            }   .padding()
                            
                            VStack{
                                
                                HStack{
                                    
                                    NavigationLink(destination: DashboardView(cartModel: CartViewModel()), tag: 1, selection: $nowLogin) {
                                        Button(action: {
                                            self.nowLogin = 1
                                        }) {
                                            HStack {
                                                Spacer()
                                                Text("Sign Up").foregroundColor(.white)
                                                Spacer()
                                            }
                                        }
                                        .font(.custom(Constant.AppFonts.Roboto_Bold, size: 18))
                                    }
                                    
                                }.padding()
                                    .background(Rectangle().fill(Color.appColor.defaultGreen).cornerRadius(12))
                                
                            } .padding()
                            
                            VStack{
                                
                                HStack(spacing: 16){
                                    HStack {
                                        Button(action: {
                                            
                                            
                                        }) {
                                            HStack {
                                                Image("appleIcon")
                                                    .resizable()
                                                    .scaledToFit()
                                            }
                                        }
                                        
                                        
                                        
                                    }.frame(width: 24, height: 24)
                                        .padding()
                                        .background(Rectangle().fill(Color.white).cornerRadius(12))
                                    
                                    HStack {
                                        Button(action: {
                                            
                                        }) {
                                            HStack {
                                                Image("fbIcon")
                                                    .resizable()
                                                    .scaledToFit()
                                            }
                                        }
                                        
                                        
                                        
                                    } .frame(width: 24, height: 24)
                                        .padding()
                                        .background(Rectangle().fill(Color.white).cornerRadius(12))
                                    
                                    
                                    
                                    HStack {
                                        Button(action: {
                                            
                                        }) {
                                            HStack {
                                                Image("googleIcon")
                                                    .resizable()
                                                    .scaledToFit()
                                            }
                                        }
                                        
                                        
                                        
                                    }   .frame(width: 24, height: 24)
                                        .padding()
                                        .background(Rectangle().fill(Color.white).cornerRadius(12))
                                }
                                
                                
                            }
                            
                            
                            
                            HStack(spacing: 8, content: {
                                Text("If you have an account?")
                                    .foregroundColor(.white)
                                Button("Sign In here"){
                                    self.presentationMode.wrappedValue.dismiss()
                                }.foregroundColor(Color.appColor.defaultGreen)
                                    .font(.custom(Constant.AppFonts.Roboto_Bold, size: 15))
                                
                                
                            })
                            .padding(.top,8)
                            .font(.custom(Constant.AppFonts.Roboto_Regular, size: 15))
                            
                            Spacer()
                        })
                    }
                })
            })
            .navigationBarTitle("")
            .navigationBarHidden(true)//working in iOS 15.0
        })
        .navigationBarBackButtonHidden(true) // working in the latest device
    }
}

#Preview {
    SignupView()
}
