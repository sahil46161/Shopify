//
//  FilterView.swift
//  Shopify
//
//  Created by sahil on 17/11/23.
//

import SwiftUI

struct FilterView: View {
    @Binding var isPresented: Bool
    @State var text = ""
    private let categories = ["Apple","Boat","Skull Candy","MI","Samsung","OnePlus+"]
    @State var minPrice = ""
    @State var maxPrice = ""


       var body: some View {
           VStack(alignment: .leading, spacing: 16) {
             
               HStack {
                   Text("Filter")
                       .font(.custom(Constant.AppFonts.Roboto_Bold, size: 22))
                       .foregroundStyle(Color.white)
                   Spacer()
                   Button(action: {
                       isPresented = false
                   }, label: {
                       Image("cross")
                           .imageScale(.small)
                           .frame(width: 32, height: 32)
                           .background(Color.white.opacity(0.7))
                           .cornerRadius(16)
                           .foregroundColor(.black)
                   })
               }
               HStack {
                   Text("Category")
                       .font(.custom(Constant.AppFonts.Roboto_Regular, size: 18))
                       .foregroundStyle(Color.white)
                   Spacer()
              
               }.padding(.vertical,1)
               VStack{
                   
                 

                   
                ScrollView(.horizontal,showsIndicators: false) {
                    LazyHStack {
                        ForEach(categories, id: \.self) { index in
                            
                            HStack {
                                Text(String(index))
                                    .foregroundStyle(.white)
                                    .font(.custom(Constant.AppFonts.Roboto_Regular, size: 16))
                            }
                            .padding(.horizontal,14)
                            .padding(.vertical,3)
                            
                            .background {
                                Color.appColor.defaultGreen
                            }
                            .cornerRadius(12)
                        }
                    }
                }.padding(.vertical,8)
                       .padding(.horizontal,0)
                   
               }
               .frame(height: 42)
               
               HStack(spacing: 12){
                   VStack{
                       HStack{
                           Text("Price Range")
                               .font(.custom(Constant.AppFonts.Roboto_Regular, size: 18))
                               .foregroundStyle(Color.white)
                           Spacer()
                       }
//                       ZStack(content: {
//                           if minPrice.isEmpty{
//                               Text("Min Price")
//                                   .font(.custom(Constant.AppFonts.Roboto_Regular, size: 18))
//                                   .foregroundStyle(Color.white)
//                           }else{
//                               TextField("Min Price", text: $minPrice)
//                                   .foregroundStyle(Color.white)
//                                   .padding(.vertical,8)
//                                   .padding(.horizontal,8)
//                                   .overlay(
//                                       RoundedRectangle(cornerRadius: 8)
//                                        .stroke(Color.white.opacity(0.7), lineWidth: 1)
//                                        
//                                   )
//                           }
//                       })
                       TextField("Min Price", text: $minPrice)
                           .foregroundStyle(Color.white)
                           .padding(.vertical,8)
                           .padding(.horizontal,8)
                           .overlay(
                               RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white.opacity(0.7), lineWidth: 1)
                                
                           )
                     
                   }
                   VStack{
                     
                       
//                       ZStack(content: {
//                           if maxPrice.isEmpty{
//                               Text("Max Price")
//                                   .font(.custom(Constant.AppFonts.Roboto_Regular, size: 18))
//                                   .foregroundStyle(Color.white)
//
//                           }else{
//                               TextField("Max Price", text: $maxPrice)
//                                   .foregroundStyle(Color.white)
//                                  
//                                   .padding(.vertical,8)
//                                   .padding(.horizontal,8)
//                                   .overlay(
//                                       RoundedRectangle(cornerRadius: 8)
//                                        .stroke(Color.white.opacity(0.7), lineWidth: 1)
//                                   )
//                           }
//                       })
                      
                       HStack{
                           Text("Price Range")
                               .font(.custom(Constant.AppFonts.Roboto_Regular, size: 18))
                               .foregroundStyle(Color.clear)
                           Spacer()
                       }
                       TextField("Max Price", text: $maxPrice)
                           .foregroundStyle(Color.white)
                          
                           .padding(.vertical,8)
                           .padding(.horizontal,8)
                           .overlay(
                               RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white.opacity(0.7), lineWidth: 1)
                           )
                  
                   }
                   
                   
                   Spacer()
               }
               
               Button(action: {
                   isPresented = false
               }) {
                   HStack {
                       Spacer()
                       Text("Apply Filter").foregroundColor(.white)
                       Spacer()
                   }.padding()
                       .background(Rectangle().fill(Color.appColor.defaultGreen).cornerRadius(12))
                   
               }
               .font(.custom(Constant.AppFonts.Roboto_Bold, size: 18))

               
           }
           .padding()
       }
}

#Preview {
    FilterView(isPresented: .constant(true))
}
