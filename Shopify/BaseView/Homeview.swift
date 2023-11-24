//
//  HomeView.swift
//  Shopify
//
//  Created by sahil on 24/11/23.
//

import SwiftUI

struct HomeView: View {
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
    var body: some View {
        
        NavigationView(content: {
            ZStack(content: {
                
                switch selectedSideMenuTab{
                case 0:
                    DashboardView(presentSideMenu: $presentSideMenu)
                        .tag(0)
                case 1:
                    SearchResultView(presentSideMenu: $presentSideMenu)
                        .tag(1)
                    
                default:
                    DashboardView(presentSideMenu: $presentSideMenu)
                        .tag(0)
                }
                

                SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
            })
        })
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    HomeView()
}
