//
//  DashboardView.swift
//  Shopify
//
//  Created by sahil on 16/11/23.
//

import SwiftUI
import Lottie

struct DashboardView: View {
    
    @State private var searchText = ""
    @State private var nowSearch : Int? = nil
    private let categories = ["Apple","Boat","Skull Candy","MI","Samsung","OnePlus+"]
    @State private var selectedCategory = "Apple"
    
    private let earphoneData = ["RMA Headphone 12C","TMA-2 Modular Headphone","TMA-4 Modular Headphone","TMA-245 ECS Headphone","R12A"]
    @Namespace private var namespace

    @StateObject var dashboardVM = DashboardVM()
    @State private var isLoading = true
    @State private var showCartView = false
    
    @State private var selectedProduct : Product?
    @State private var showProductView = false
    @Namespace var animation
    
    
    @StateObject var cartModel = CartViewModel()
    
    @State private var updateBounceCount = false

    

    var body: some View {
        NavigationView(content: {
            
            dashboardView

            
//            .background(Color.red)
            
//            .navigationBarTitle("")
//            .navigationBarHidden(true)
        })
//        .navigationTitle("Audio")
//        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        
        .animation(.default, value: showProductView)
        .environmentObject(cartModel)
    }
    
    
    

    
}
extension DashboardView{
    var dashboardView : some View{
        ZStack{
            if showProductView{
                if showCartView{
                    CartView(isShowingDetail: $showProductView, animation: animation)
                        .matchedGeometryEffect(id: "Cart", in: animation)

                }else{
                    if let pro = selectedProduct{
                        ProductView(selectedProduct: pro,nameSpaceID: pro.title, isShowingDetail: $showProductView, animation: animation)
                            .matchedGeometryEffect(id: pro.title, in: animation)
                    }
                }
              
            }else{
                VStack{
                    HStack{
                        Button{
                            
                        } label: {
                            Image("menu")
                                .resizable()
                                .frame(width: 32, height: 32)
                        }
                        Spacer()
                        
                        Image("audioIcon")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("Audio")
                            .font(.custom(Constant.AppFonts.Roboto_Bold, size: 20))
                        
                        Spacer()
                        Button{
                            withAnimation {
                                showProductView = true
                                showCartView = true
                            }
                        } label: {
                            ZStack(content: {
                                if updateBounceCount{
                                    Text("\(cartModel.cartItems.count > 0 ? "\(cartModel.cartItems.count)" : "")")
                                        .matchedGeometryEffect(id: "count", in: namespace)
                                        .offset(x:2,y : -24)
                                        .foregroundColor(.red)
                                        .font(.custom(Constant.AppFonts.Roboto_Medium, size: 14))

                                }else{
                                    Text("\(cartModel.cartItems.count > 0 ? "\(cartModel.cartItems.count)" : "")")
                                        .matchedGeometryEffect(id: "count", in: namespace)
                                        .offset(x:2,y : -16)
                                        .foregroundColor(Color.red)
                                        .font(.custom(Constant.AppFonts.Roboto_Medium, size: 14))


                                }
//                                LottieView(animation: .named("cart"))
//                                    .looping()
//                                    .frame(width: 38,height:38)
                                Image("cart")
                                    .matchedGeometryEffect(id: "Cart", in: animation)
                            })
                        }
                        
                        
                    }.padding(.horizontal, 24)
                        .onAppear(perform: {
                            Task{
                                print("now calling---=====")
                                if dashboardVM.productsList.count == 0{
                                    try await dashboardVM.getProducts()
                                    withAnimation {
                                        self.isLoading = false
                                    }
                                }
                                
                            }
                        })
                   
                  
                    
                    ScrollView (showsIndicators: false){
                        HStack{
                            if isLoading{
                                CustomShimmerView(width: 100, height: 32)
                            }else{
                                Text("Hey, Andrea")
                                    .font(.custom(Constant.AppFonts.Roboto_Regular, size: 16))
                                
                            }
                            Spacer()
                        }.padding(.top,32).padding(.horizontal, 16)
                        HStack{
                            
                            if isLoading{
                                CustomShimmerView(width: UIScreen.screenWidth - 32, height: 60)
                            }else{
                                Text("What are you looking for today?")
                                    .font(.custom(Constant.AppFonts.Roboto_Bold, size: 30))
                                
                            }
                            
                            Spacer()
                        }.padding(.top,4).padding(.horizontal, 16)
                        
                        if isLoading{
                            CustomShimmerView(width: UIScreen.screenWidth - 32, height: 60)
                        }else{
                            HStack {
                                
                                
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(Color.black.opacity(0.3))
                                NavigationLink(destination: SearchView(), tag: 2, selection: $nowSearch) {
                                    
                                }
                                
                                TextField("Search headphone",
                                          text: $searchText,onEditingChanged: { flag in
                                    self.nowSearch = 2
                                    
                                })
                                
                                .font(.custom(Constant.AppFonts.Roboto_Regular, size: 16))
                                .padding(.horizontal,8)
                                
                            }
                            .padding(.horizontal,16)
                            .padding(.vertical,12)
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(.black.opacity(0.2), lineWidth: 1.5))
                            .padding(.horizontal, 16)
                        }
                        
                        
                        
                        
                        
                        
                        
                        VStack {
                            
                            if isLoading{
                                VStack{
                                    CustomShimmerView(width: UIScreen.screenWidth - 32, height: 32)
                                }
                                
                            }else{
                                ScrollView(.horizontal,showsIndicators: false) {
                                    ScrollViewReader(content: { scroller in
                                        LazyHStack {
                                            ForEach(categories, id: \.self) { index in
                                                
                                                Button {
                                                    withAnimation(.linear) {
                                                        self.selectedCategory = String(index)
                                                    }
                                                    
                                                } label: {
                                                    if selectedCategory == String(index){
                                                        HStack {
                                                            Text(String(index))
                                                                .foregroundStyle(.white)
                                                                .font(.custom(Constant.AppFonts.Roboto_Regular, size: 14))
                                                        }
                                                        .padding(.horizontal,14)
                                                        .padding(.vertical,3)
                                                        
                                                        .background {
                                                            Color.appColor.defaultGreen
                                                        }
                                                        .cornerRadius(8)
                                                        .id(String(index))
                                                    }else{
                                                        HStack {
                                                            Text(String(index))
                                                                .foregroundStyle(.black)
                                                                .font(.custom(Constant.AppFonts.Roboto_Regular, size: 14))
                                                        }
                                                        .padding(.horizontal,14)
                                                        .padding(.vertical,3)
                                                        
                                                        .cornerRadius(8)
                                                        .id(String(index))
                                                    }
                                                }
                                                
                                            }
                                        }
                                        .onAppear {
                                            scroller.scrollTo(self.selectedCategory, anchor: .center)
                                        }
                                    })
                                    
                                    
                                }.padding(.vertical,8)
                            }
                            
                            if isLoading{
                                CustomShimmerView(width: UIScreen.screenWidth - 32, height: 140)
                            }else{
                                ScrollView(.horizontal,showsIndicators: false) {
                                    ScrollViewReader(content: { proxy in
                                        LazyHStack {
                                            ForEach(self.dashboardVM.productsList, id: \.title) { product in
                                                
                                                HStack {
                                                    VStack{
                                                        Text(product.title)
                                                            .frame(width: 170)
                                                            .foregroundStyle(.black)
                                                            .font(.custom(Constant.AppFonts.Roboto_Bold, size: 25))
                                                            .lineLimit(4)
                                                        
                                                        Spacer()
                                                        
                                                        HStack{
                                                            Button {
                                                                print("my product name",product.id)
                                                                
                                                                if cartModel.cartItems.filter({$0.product?.id == product.id}).count > 0{
                                                                    print("already added in cart")
                                                                }else{
                                                                    withAnimation {
                                                                        self.cartModel.cartItems.append(CartItemsModel(id: product.id, count: 1, product: product))
                                                                        self.selectedProduct = product
                                                                    }
                                                                 
    //                                                                showCartView = false
    //                                                                withAnimation {
    //                                                                    showProductView = true
                                                                        //                                                                        proxy.scrollTo(self.selectedProduct?.id, anchor: .center)
    //                                                                }
                                                                    
                                                                    
                                                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3)) {
                                                                        self.updateBounceCount = true
                                                                        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { time in
                                                                            withAnimation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3)) {
                                                                                self.updateBounceCount = false
                                                                            }
                                                                        }
                                                                        
                                                                    }
                                                                }
                                                                
                                                           
                                                            } label: {
                                                                Text("\(cartModel.cartItems.filter({$0.product?.id == product.id}).count > 0 ? "Added" : "Add to cart")")
                                                                    .foregroundStyle(Color.appColor.defaultGreen)
                                                                    .font(.custom(Constant.AppFonts.Roboto_Medium, size: 16))
                                                                    .padding(.vertical,8)
                                                            }
                                                            Spacer()
                                                        }
                                                    }
                                                    Spacer()
                                                    VStack{
                                                        //                                           Image("headphone")
                                                        ImageView(urlString: Constant.Endpoints.getRandomImage100x100)
                                                            .frame(width: 100, height: 100)
                                                            .cornerRadius(8)
                                                    }
                                                    
                                                }
                                                .padding(.horizontal,14)
                                                .padding(.vertical,3)
                                                
                                                .background {
                                                    Color.gray.opacity(0.1)
                                                }
                                                .cornerRadius(8)
                                                
                                                .id(product.title)
//                                                .matchedGeometryEffect(id: product.title, in: animation)
                                            }
                                        }
                                        .onAppear {
                                            proxy.scrollTo(self.selectedProduct?.title, anchor: .center)
                                        }
                                        
                                    })
                                    
                                }.padding(.vertical,8)
                                
                            }
                            
                            
                            HStack {
                                if isLoading{
                                    CustomShimmerView(width: 100, height: 32)
                                    // .shimmering()
                                }else{
                                    Text("Featured Products")
                                        .font(.custom(Constant.AppFonts.Roboto_Regular, size: 16))
                                    
                                }
                                Spacer()
                                Button(action: {
                                    //
                                    
                                }, label: {
                                    if isLoading{
                                        CustomShimmerView(width: 60, height: 32)
                                    }else{
                                        Text("See All")
                                            .font(.custom(Constant.AppFonts.Roboto_Regular, size: 16))
                                            .foregroundStyle(Color.gray.opacity(0.6))
                                        
                                    }
                                })
                                
                            }.padding(.vertical)
                            
                            if isLoading{
                                HStack {
                                    CustomShimmerView(width: 150, height: 220)
                                    
                                    CustomShimmerView(width: 150, height: 220)
                                }
                            }else{
                                ScrollView(.horizontal,showsIndicators: false) {
                                    ScrollViewReader { scroller in
                                        LazyHStack {
                                            ForEach(self.dashboardVM.productsList, id: \.title) { product in
                                                
                                                Button {
                                                    self.selectedProduct = product
                                                    showCartView = false
                                                    withAnimation {
                                                        showProductView = true
                                                    }
                                                } label: {
                                                    HStack {
                                                        
                                                        VStack{
                                                            ImageView(urlString: Constant.Endpoints.getRandomImage120x140)
                                                            
                                                                .frame(width: 120, height: 140)
                                                                .cornerRadius(8)
                                                            Spacer()
                                                            HStack{
                                                                Text(product.title)
                                                                    .foregroundStyle(Color.black)
                                                                    .font(.custom(Constant.AppFonts.Roboto_Medium, size: 14))
                                                                    .lineLimit(3)
                                                                Spacer()
                                                            }
                                                            
                                                            HStack{
                                                                Text("USD 35")
                                                                    .foregroundStyle(Color.black)
                                                                    .font(.custom(Constant.AppFonts.Roboto_Medium, size: 14))
                                                                Spacer()
                                                            }.padding(.vertical,8)
                                                            
                                                        }.frame(width:130)
                                                            .matchedGeometryEffect(id: product.title, in: animation)

                                                    }
                                                    .padding(.horizontal,14)
                                                    .padding(.vertical,16)
                                                    .background {
                                                        Color.gray.opacity(0.1)
                                                    }
                                                    .cornerRadius(8)
                                                    .id(product.title)
                                                    
                                                }
                                                
                                                
                                            }
                                        }
                                        .onAppear {
                                            scroller.scrollTo(self.selectedProduct?.title, anchor: .center)
                                        }
                                    }
                                    
                                }.padding(.vertical,8)
                            }
                            Spacer()
                        }
                        .ignoresSafeArea()
                        .padding(.vertical,16)
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        //                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(.black.opacity(0.2), lineWidth: 1.5))
                    }
//                        .ignoresSafeArea(edges: .all)
                    
                    Spacer()
                }
                
               // Spacer()
            }
        }
    }
}



#Preview {
    DashboardView(cartModel: CartViewModel())
}
