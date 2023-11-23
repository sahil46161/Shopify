//
//  SearchView.swift
//  Shopify
//
//  Created by sahil on 17/11/23.
//

import SwiftUI

struct SearchView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var searchText = ""
    @State private var openSearchView = false
    
    private let searchList = ["TMA Wireless","Cable"]
    private let earphoneData = ["RMA Headphone 12C","TMA-2 Modular Headphone","TMA-4 Modular Headphone","TMA-245 ECS Headphone","R12A"]
    
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                HStack{
                    Button{
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image("backImage")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                    Spacer()
                    
                    Text("Search")
                        .font(.custom(Constant.AppFonts.Roboto_Bold, size: 20))
                    
                    Spacer()
                    Button{
                        
                    } label: {
                        Image("cart")
                            .resizable()
                            .frame(width: 28, height: 28)
                    }
                    
                }.padding(.horizontal, 16)
                
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.black.opacity(0.3))
                    TextField("Search headphone",
                              text: $searchText)
                    .tint(Color.appColor.defaultGreen)
                    .font(.custom(Constant.AppFonts.Roboto_Regular, size: 16))
                }
                .padding(.horizontal,24)
                .padding(.vertical,12)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(.black.opacity(0.2), lineWidth: 1.5))
                .padding(.horizontal, 24)
                .padding(.vertical,16)
                
                
                HStack{
                    
                    Text("Latest search")
                        .font(.custom(Constant.AppFonts.Roboto_Regular, size: 16))
                    
                    Spacer()
                } .padding(.horizontal,24)
                    .padding(.vertical,12)
                
                VStack{
                    ForEach(searchList, id: \.self) { searchItem in
                        HStack{
                            Image(systemName: "clock").foregroundColor(.black.opacity(0.3))
                            Text(searchItem)
                                .font(.custom(Constant.AppFonts.Roboto_Regular, size: 15))
                            
                            Spacer()
                            Button{
                                
                            } label: {
                                Image("cross")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            
                        }.padding(.horizontal,8)
                            .padding(.vertical,8)
                    }
                                        
                }.padding(.horizontal,16)
                    .padding(.vertical,1)
                
                HStack{
                    Text("Popular product")
                        .font(.custom(Constant.AppFonts.Roboto_Regular, size: 16))
                    Spacer()
                }.padding(.horizontal,24)
                    .padding(.vertical,12)
                
                VStack{
                    List(earphoneData,id : \.self) { searchItem in
                        
                        HStack{
                            VStack{
                                Image("headphone")
                                    .resizable()
                                
                            }.frame(width: 75,height: 75)
                                .background(Color.appColor.lightGray)
                                .cornerRadius(15)
                            
                            VStack(alignment: .leading){
                                Text(searchItem)
                                    .font(.custom(Constant.AppFonts.Roboto_Regular, size: 18))
                                Text("USD 500")
                                    .font(.custom(Constant.AppFonts.Roboto_Medium, size: 16))
                                
                                HStack{
                                    Image("star-filled")
                                    Text("4.5")
                                        .font(.custom(Constant.AppFonts.Roboto_Regular, size: 14))
                                    Text("99 reviews")
                                        .font(.custom(Constant.AppFonts.Roboto_Regular, size: 14))
                                    Spacer()
                                    
                                    Button{
                                        
                                    } label: {
                                        Image("dots")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                    }
                                    
                                }.frame(height: 32)
                            }
                            .padding(.vertical,8)
                            .padding(.horizontal,8)
                            Spacer()
                            
                        }
                        .listRowInsets(EdgeInsets())
                        .background(
                            NavigationLink(
                                destination: SearchResultView(),
                                isActive: $openSearchView) {
                                    EmptyView()
                                }
                                .opacity(0)
                            
                        )
                        
                        .onTapGesture {
                            self.openSearchView.toggle()
                        }
                        .onLongPressGesture {
                            self.openSearchView.toggle()
                        }
                        .listRowBackground(Color.clear)
                        
                    }
                    .listStyle(PlainListStyle())
                   
                    
                }.padding(.horizontal,12)
                    .padding(.vertical,2)
                
                Spacer()
            }.edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SearchView()
}
