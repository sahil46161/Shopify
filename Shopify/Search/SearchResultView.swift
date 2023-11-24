//
//  SearchResultView.swift
//  Shopify
//
//  Created by sahil on 17/11/23.
//

import SwiftUI

struct SearchResultView: View {
    
    private let categories = ["Filter","Popularity","Newest","Most Expensive"]
    private let earphoneData = ["RMA Headphone 12C","TMA-2 Modular Headphone","TMA-4 Modular Headphone","TMA-245 ECS Headphone","R12A"]
    @Environment(\.presentationMode) var presentationMode
    
    @State var isFilterPresent = false
    @State var openProductView = false
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                HStack{
                    Button{
//                        presentationMode.wrappedValue.dismiss()
                        presentSideMenu.toggle()
                    } label: {
                        Image("menu")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                    Spacer()
                    
                    Button{
                        
                    } label: {
                        Image("cart")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    
                }.padding(.horizontal, 24)
                
                ScrollView (showsIndicators: false){
                    HStack{
                        Text("Headphone")
                            .font(.custom(Constant.AppFonts.Roboto_Regular, size: 16))
                        Spacer()
                    }.padding(.top,32).padding(.horizontal, 16)
                    HStack{
                        Text("TMA Wireless")
                            .font(.custom(Constant.AppFonts.Roboto_Bold, size: 30))
                        Spacer()
                    }.padding(.top,4).padding(.horizontal, 16)
                    
                    ScrollView(.horizontal,showsIndicators: false) {
                        LazyHStack {
                            ForEach(categories, id: \.self) { str in
                                
                                HStack {
                                    
                                    if str == self.categories[0]{
                                        
                                        Button(action: {
                                            isFilterPresent = true
                                            
                                        }, label: {
                                            HStack{
                                                Image("filter")
                                                    .padding(.horizontal,8)
                                                Text(String(str))
                                                    .padding(.horizontal,0)
                                                    .padding(.vertical,14)
                                                    .foregroundStyle(.black)
                                                    .font(.custom(Constant.AppFonts.Roboto_Regular, size: 16))
                                                Spacer()
                                            }
                                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(.black.opacity(0.2), lineWidth: 1.5))
                                            
                                        })
                                  
                                   
                                        
                                    }else{
                                        Text(String(str))
                                            .foregroundStyle(.black)
                                            .font(.custom(Constant.AppFonts.Roboto_Regular, size: 16))
                                    }
                                }
                                .padding(.horizontal,14)
                                .padding(.vertical,3)
                                
                                
                                .cornerRadius(8)
                                
                            }
                        }
                    }.padding(.vertical,16)
                        .padding(.horizontal,8)
                    
                    VStack {
                        
                        
                        
                        
                        ScrollView {
                            LazyVGrid(columns: [GridItem(), GridItem()]) {
                                
                                ForEach(earphoneData,id: \.self) { item in
                                    HStack {
                                        VStack{
                                            Image("headphone")
                                            Spacer()
                                            HStack{
                                                Text("String(item)")
                                                    .foregroundStyle(Color.black)
                                                    .font(.custom(Constant.AppFonts.Roboto_Regular, size: 18))
                                                Spacer()
                                            }
                                            
                                            HStack{
                                                Text("USD 35")
                                                    .foregroundStyle(Color.black)
                                                    .font(.custom(Constant.AppFonts.Roboto_Medium, size: 14))
                                                Spacer()
                                            }.padding(.vertical,1)
                                                .padding(.horizontal,2)
                                            Spacer()
                                            HStack{
                                                Image("star-filled")
                                                Text("4.5")
                                                    .font(.custom(Constant.AppFonts.Roboto_Regular, size: 13))
                                                Text("99 reviews")
                                                    .font(.custom(Constant.AppFonts.Roboto_Regular, size: 13))
                                                Spacer()
                                                
//                                                NavigationLink(
//                                                    destination: ProductView(namespaceID: item),
//                                                    isActive: $openProductView) {
//                                                        EmptyView()
//                                                    }
                                                
                                                Button{
                                                    openProductView = true
                                                } label: {
                                                    Image("dots")
                                                        .resizable()
                                                        .frame(width: 20, height: 20)
                                                }
                                                
                                            }.frame(height: 32)
                                            
                                            Spacer()
                                        }
                                    }
                                    .padding(.horizontal,14)
                                    .padding(.vertical,8)
                                    
                                    .background {
                                        Color.white
                                    }
                                    .cornerRadius(22)
                                    .padding(.horizontal,2)
                                    .padding(.vertical,2)

                                }
                               
                            }
                            
                        }
                        .padding(.vertical,12)
                        .padding(.horizontal, 2)
                        
                    }
                    .padding(.vertical,16)
                    .padding(.horizontal, 16)
                    .background(Color.appColor.lightGray)
                    .clipShape(RoundedRectangle(cornerRadius: 35))
                }
                Spacer()
            }.edgesIgnoringSafeArea(.bottom)
                .popup(isPresented: $isFilterPresent) {
                    BottomPopupView {
                        FilterView(isPresented: $isFilterPresent)
                    }
                }
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    SearchResultView(presentSideMenu: .constant(false))
}
