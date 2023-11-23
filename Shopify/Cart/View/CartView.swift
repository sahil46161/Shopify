//
//  CartView.swift
//  Shopify
//
//  Created by sahil on 20/11/23.
//

import SwiftUI

struct CartView: View {
    
    @Environment(\.presentationMode) var presentationMode
    private let cartItems = ["A","B"]
    @Binding var isShowingDetail : Bool
    let animation: Namespace.ID
//    @StateObject var cartModel = CartViewModel()
    @EnvironmentObject var cartModel: CartViewModel
    
    @State private var showAlertForAll = false
    @State private var showAlertForSingleDelete = false
    
    
    
    var body: some View {
        NavigationView(content: {
            VStack{
                HStack{
                    Button{
//                        presentationMode.wrappedValue.dismiss()
                        isShowingDetail = false
                    } label: {
                        Image("cross")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                    Spacer()
                    
                   
                    Text("Shopping cart")
                        .font(.custom(Constant.AppFonts.Roboto_Medium, size: 16))
                    
                    Spacer()
                    Button{
                        showAlertForAll = true
                        
                    } label: {
                       Image("trash")
                            .foregroundStyle(.black)
                    }
                    .alert("Are you sure want to delete all items from your cart?", isPresented: $showAlertForAll) {
                        Button("Clear", role: .destructive) {
                            cartModel.cartItems.removeAll()
                        }
//                        Button("Cancel",role:.none){}
                    }
                    
                }.padding(.horizontal, 16)
                
                ScrollView(showsIndicators: false, content: {
                    
                    ForEach(cartModel.cartItems.indices,id: \.self) { item in
                        HStack{
                            VStack{
//                                Spacer()
                                ImageView(urlString: Constant.Endpoints.getRandomImage100x100)
                                    .frame(width: 85,height: 85)
                                    .cornerRadius(radius: 8)
                            }
                            .frame(width: 85,height: 87)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.black.opacity(0.1), lineWidth: 1))
                            .background(Color.appColor.lightGray)
                            
                            
                            VStack(spacing: 0){
                                HStack(content: {
                                    Text(cartModel.cartItems[item].product?.title ?? "NA")
                                        .font(.custom(Constant.AppFonts.Roboto_Medium, size: 16))
                                        .foregroundStyle(Color.black)
                                    Spacer()
                                   
                                }).padding(.vertical,8)
                                VStack(content: {
                                    
                                    HStack(content: {
                                        Text("USD 40")
                                            .font(.custom(Constant.AppFonts.Roboto_Regular, size: 14))
                                            .foregroundStyle(Color.black)
                                        Spacer()
                                    })
                                })
                                HStack(content: {
                                    Button{
                                        if cartModel.cartItems[item].count > 1{
                                            cartModel.cartItems[item].count -= 1
                                        }
                                    } label: {
                                      Text("-")
                                            .foregroundStyle(Color.black)
                                            .frame(width: 32,height: 32)
                                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.black.opacity(0.2), lineWidth: 1.5))
                                            
                                    }
                                    
                                    Text("\(cartModel.cartItems[item].count)")
                                        .font(.custom(Constant.AppFonts.Roboto_Medium, size: 16))
                                        .foregroundStyle(Color.black).padding(.horizontal,8)
                                    Button{
                                        cartModel.cartItems[item].count += 1

                                    } label: {
                                      Text("+")
                                            .foregroundStyle(Color.black)
                                            .frame(width: 32,height: 32)
                                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.black.opacity(0.2), lineWidth: 1.5))
                                            
                                    }
                                    Spacer()
                                    Button{
                                        showAlertForSingleDelete = true
                                        
                                        
                                    } label: {
                                       Image("trash")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .foregroundStyle(Color.black.opacity(0.5))
                                    }
                                    .alert("Are you sure want to delete \(cartModel.cartItems[item].product?.title ?? "")?", isPresented: $showAlertForSingleDelete) {
                                        Button("Delete", role: .destructive) {
                                            cartModel.cartItems = cartModel.cartItems.filter{$0.product?.id !=                                             cartModel.cartItems[item].product?.id}
                                        }
                                        
                                        Button("Cancel", role: .cancel) {
                                            //
                                        }

                                    }
                                   
                                }).padding(.vertical,8)
                                
                                Spacer()
                            }
                            Spacer()
                        }.padding(.top,32).padding(.horizontal, 16)
                    }
                    
                })
                
                Spacer()
            }
            .onAppear {
                print("here it is==>",cartModel.count)
            }
        })
//        .environmentObject(cartModel)
        .navigationBarBackButtonHidden(true)
//        NavigationView{
//
//        }.navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    @Namespace var ns
//    CartView(animation: ns)
//}
struct CartView_Previews: PreviewProvider {
    
    struct TestView: View {
        @Namespace var ns
        @EnvironmentObject var cartModel: CartViewModel
        
        var body: some View {
            CartView(isShowingDetail: .constant(false), animation: ns).environmentObject(CartViewModel())
        }
    }
    static var previews: some View {
        TestView()
    }
}
