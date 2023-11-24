//
//  ProductView.swift
//  Shopify
//
//  Created by sahil on 20/11/23.
//

import SwiftUI

struct ProductView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedSegment = 1
    var segments = ["Overview", "Features", "Specifications"]
    var earphoneData = ["MT-CLO", "Features","MT-C5LO"]
    var commmentData = ["MT-CLO", "Features","MT-C5LO"]
    
    @State private var openCart = false
    var selectedProduct : Product?
    var nameSpaceID = ""
    @Binding var isShowingDetail : Bool
    @Namespace var namespace
    
    let animation: Namespace.ID
    @StateObject private var productVM = ProductViewModal()
    
    @State private var isLoading = false
    
    @EnvironmentObject var cartModel: CartViewModel

    
    
    var body: some View {
        NavigationView(content: {
            
            ZStack(content: {
                if openCart{
                    CartView(isShowingDetail: $openCart, animation: animation)
                        .matchedGeometryEffect(id: "Cart", in: animation)
                }else{
                    VStack{
                        HStack{
                            Button{
                               // presentationMode.wrappedValue.dismiss()
                                self.isShowingDetail = false
                            } label: {
                                Image("cross")
                                    .resizable()
                                    .frame(width: 32, height: 32)
                            }
                            Spacer()
                            Button{
                                withAnimation {
                                    openCart = true
                                }
                            } label: {
                                
                                ZStack{
                                    Text("\(cartModel.cartItems.count > 0 ? "\(cartModel.cartItems.count)" : "")")
                                       
                                        .offset(x:2,y : -16)
                                        .foregroundColor(.red)
                                    Image("cart")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .matchedGeometryEffect(id: "Cart", in: animation)

                                }
                            }
                            
                        }.padding(.horizontal, 24)
                        
                        ScrollView (showsIndicators: false){
                            HStack{
                                Text("USD 350")
                                    .font(.custom(Constant.AppFonts.Roboto_Regular, size: 16))
                                    .foregroundStyle(Color.appColor.defaultGreen)
                                Spacer()
                            }.padding(.top,32).padding(.horizontal, 16)
                            HStack{
                                Text(selectedProduct?.title ?? "TMA")
                                    .font(.custom(Constant.AppFonts.Roboto_Bold, size: 30))
        //                                .matchedGeometryEffect(id: selectedProduct?.title ?? "" , in: animation)
                                Spacer()
                            }.padding(.top,4).padding(.horizontal, 16)
                            
                            HStack {
                                VStack(content: {
                                    Button(action: {
                                        withAnimation {
                                            selectedSegment = 1
                                        }
                                        
                                    }, label: {
                                        VStack(content: {
                                            Text("Overview")
                                                .foregroundStyle(Color.black)
                                            if selectedSegment == 1{
                                                VStack(content: {
                                                    
                                                }).frame(width:  24,height: 3)
                                                    .background(Rectangle().fill(Color.appColor.defaultGreen).cornerRadius(radius: 2))
                                            }
                                        })
                                        //.matchedGeometryEffect(id: "Overview", in: namespace)
                                    })
                                    
                                })
                                Spacer()
                                VStack(content: {
                                    Button(action: {
                                        withAnimation {
                                            
                                            selectedSegment = 2
                                        }
                                        
                                    }, label: {
                                        VStack(content: {
                                            Text("Features")
                                                .foregroundStyle(Color.black)
                                            if selectedSegment == 2{
                                                VStack(content: {
                                                    
                                                }).frame(width:  24,height: 3)
                                                    .background(Rectangle().fill(Color.appColor.defaultGreen).cornerRadius(radius: 2))
                                            }else{
                                                
                                            }
                                        })
        //                                    .matchedGeometryEffect(id: "Features", in: namespace)
                                    })
                                    
                                })
                                Spacer()
                                VStack(content: {
                                    Button(action: {
                                        withAnimation {
                                            selectedSegment = 3
                                        }
                                    }, label: {
                                        VStack(content: {
                                            Text("Specification")
                                                .foregroundStyle(Color.black)
                                            if selectedSegment == 3{
                                                VStack(content: {
                                                    
                                                }).frame(width:  24,height: 3)
                                                    .background(Rectangle().fill(Color.appColor.defaultGreen).cornerRadius(radius: 2))
                                            }
                                        })
        //                                    .matchedGeometryEffect(id: "Specification", in: namespace)
                                    })
                                    
                                })
                                
                                
                            }.padding()
                            
                            if selectedSegment == 1{
                                OverviewScreen
        //                                .matchedGeometryEffect(id: self.nameSpaceID, in: namespace)
                            }else if selectedSegment == 2{
                                featuresView
        //                                .matchedGeometryEffect(id: "Features", in: namespace)
                            }else{
                                specificationView
        //                                .matchedGeometryEffect(id: "Specification", in: namespace)
                            }
                            
                        }
                        Spacer()
                    }
                }
            })

        }).navigationBarBackButtonHidden(true)
            .animation(.default, value: openCart)
    
//            .navigationBarTitleDisplayMode(.inline)
//                 .navigationViewStyle(.stack)
            
    }
}

//#Preview {
//    ProductView(isShowingDetail: .constant(false))
//}
struct ProductView_Previews: PreviewProvider {
    
    struct TestView: View {
        @Namespace var ns
        var body: some View {
            ProductView(isShowingDetail: .constant(false),animation: ns).environmentObject(CartViewModel())
        }
    }
    static var previews: some View {
        TestView()
    }
}

extension ProductView{
    var OverviewScreen : some View{
        VStack{
            VStack(content: {
                VStack(content: {
                    ScrollView(.horizontal,showsIndicators: false) {
                        LazyHStack (spacing: 0){
                            ForEach(earphoneData, id: \.self) { index in
                                
                                VStack{
                                    ImageView(urlString: Constant.Endpoints.getRandomImage300x300)
                                        .cornerRadius(8)
                                }.scaledToFill()
                                
                                    .background {
                                        Color.appColor.lightGray
                                    }
                                    .cornerRadius(10)
                                    .frame(height: 300)
                                    .padding(.horizontal, 20)
                            }
                        }
                    }.padding(.vertical,8)
                    
                })
                
               
                HStack{ if isLoading{
                    CustomShimmerView(width: 100, height: 42)
                }else{
                    Text("Review \(productVM.comments.count)")
                        .font(.custom(Constant.AppFonts.Roboto_Regular, size: 16))
                        .foregroundStyle(Color.black)

                }
                    Spacer()
                }.padding(.top,32).padding(.horizontal, 16)
                
                if commmentData.count > 0 {
                    commentView
                    VStack(content: {
                        Button(action: {
                            
                        }, label: {
                            Text("See All Reviews")
                                .font(.custom(Constant.AppFonts.Roboto_Regular, size: 14))
                                .foregroundStyle(Color.black.opacity(0.6))
                        })
                    }).padding()
                    
                }
                
                VStack(spacing:0) {
                    HStack{
                        Text("Another Product")
                            .padding()
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text("See All")
                                .font(.custom(Constant.AppFonts.Roboto_Regular, size: 14))
                                .foregroundStyle(Color.black.opacity(0.6))
                        }).padding()
                        
                    }
                    
                    ScrollView(.horizontal,showsIndicators: false) {
                        LazyHStack {
                            ForEach(earphoneData, id: \.self) { index in
                                
                                HStack {
                                    
                                    VStack{
                                        Image("headphone")
                                        Spacer()
                                        HStack{
                                            Text(String(index))
                                                .foregroundStyle(Color.black)
                                                .font(.custom(Constant.AppFonts.Roboto_Medium, size: 14))
                                            Spacer()
                                        }.frame(width:130)
                                        
                                        HStack{
                                            Text("USD 35")
                                                .foregroundStyle(Color.black)
                                                .font(.custom(Constant.AppFonts.Roboto_Medium, size: 14))
                                               
                                            Spacer()
                                        }
                                    }
                                }
                                .padding(.horizontal,16)
                                .padding(.vertical,8)
                                
                                .background {
                                    Color.white
                                }
                                .cornerRadius(8)
                                
                            }
                        }
                    }.padding(.vertical,8)
                        .padding(.horizontal,16)
                    
                    
                    
                    Spacer()
                }
                .background(
                    Color.appColor.lightGray
                )
                
                VStack{
                    Button(action: {
                        if cartModel.cartItems.filter({$0.product?.id == selectedProduct?.id}).count > 0 {
                            
                        }else{
                            withAnimation {
                                cartModel.cartItems.append(CartItemsModel(id: selectedProduct?.id ?? 0, count: 1, product: selectedProduct))
                            }
                        }
                        
                    }) {
                        HStack {
                            Spacer()
                            Text(cartModel.cartItems.filter{$0.product?.id == selectedProduct?.id}.count > 0 ? "Added in Cart" : "Add To Cart")
                                .foregroundColor(.white)
                            Spacer()
                        }.padding()
                            .background(Rectangle().fill(Color.appColor.defaultGreen).cornerRadius(12))
                        
                    }
                    .font(.custom(Constant.AppFonts.Roboto_Bold, size: 18))
                }.padding()
            })
            .onAppear {
                if self.productVM.comments.count == 0{
                    
                    withAnimation {
                        self.isLoading = true
                    }
                   
                    Task{
                       try await productVM.getproductComments()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                            withAnimation {
                                self.isLoading = false
                            }
                        })
                    }
                }
            }
            
        }

    }
}


extension ProductView{
    var commentView : some View{
        
        VStack{
            if isLoading{
                VStack{
                    
                    CustomShimmerView(width: UIScreen.screenWidth - 32, height: 300)
                }
            }else{
                ForEach(productVM.comments,id: \.id) { comment in
                    HStack{
                        VStack{
                            Image("dummyProfile")
                            Spacer()
                        }
                        VStack(spacing: 0){
                            HStack(content: {
                                Text(comment.name)
                                    .font(.custom(Constant.AppFonts.Roboto_Medium, size: 16))
                                    .foregroundStyle(Color.black)
                                Spacer()
                                Text("1 Month ago")
                                    .font(.custom(Constant.AppFonts.Roboto_Regular, size: 13))
                                    .foregroundStyle(Color.black.opacity(0.4))
                            })
                            VStack(content: {
                                HStack(content: {
                                    Image("star-filled")
                                    
                                    Spacer()
                                }).padding(.vertical,8)
                                
                                HStack(content: {
                                    Text(comment.body)
                                        .font(.custom(Constant.AppFonts.Roboto_Regular, size: 14))
                                        .foregroundStyle(Color.black)
                                        .lineLimit(7)
                                    Spacer()
                                }).padding(.vertical,0)
                            })
                            
                            Spacer()
                        }
                        Spacer()
                    }.padding(.top,32).padding(.horizontal, 16)
                }
            }
        }

    }
    
    var featuresView : some View{
        VStack{
            HStack(content: {
                Text("Highly Detailed Audio")
                    .font(.custom(Constant.AppFonts.Roboto_Bold, size: 16))
                    .foregroundStyle(Color.black)
                Spacer()
            }).padding(.vertical,16)
                .padding(.horizontal,16)
            
            HStack(content: {
                Text("The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. \n\n The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.  ")
                    .font(.custom(Constant.AppFonts.Roboto_Regular, size: 14))
                    .foregroundStyle(Color.black)
                Spacer()
            }).padding(.vertical,0)
                .padding(.horizontal,16)
            
            ForEach(earphoneData,id: \.self) { name in
                HStack{
                    VStack{
                        Image("remote")
                        Spacer()
                    }
                    VStack(spacing: 0){
                        HStack(content: {
                            Text(name)
                                .font(.custom(Constant.AppFonts.Roboto_Medium, size: 16))
                                .foregroundStyle(Color.black)
                            Spacer()
                            Text("1 Month ago")
                                .font(.custom(Constant.AppFonts.Roboto_Regular, size: 13))
                                .foregroundStyle(Color.black.opacity(0.4))
                        })
                        VStack(content: {
                           
                            HStack(content: {
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ")
                                    .font(.custom(Constant.AppFonts.Roboto_Regular, size: 14))
                                    .foregroundStyle(Color.black)
                                    .lineLimit(6)
                                Spacer()
                            }).padding(.vertical,8)
                        })
                        
                        
                        
                        Spacer()
                    }
                    Spacer()
                }.padding(.top,32).padding(.horizontal, 16)
            }
            
            VStack{
                Button(action: {
                   
                }) {
                    HStack {
                        Spacer()
                        Text("Add To Cart").foregroundColor(.white)
                        Spacer()
                    }.padding()
                        .background(Rectangle().fill(Color.appColor.defaultGreen).cornerRadius(12))
                    
                }
                .font(.custom(Constant.AppFonts.Roboto_Bold, size: 18))
            }.padding(.vertical,32)
                .padding(.horizontal,16)
            
        }
    }
    
    
    var specificationView : some View{
        VStack{
           
            Image("Nodata")
                .resizable()
                .scaledToFill()
            
        }
    }
    
}



