//
//  SideMenuView.swift
//  Shopify
//
//  Created by sahil on 24/11/23.
//

import SwiftUI


enum SideMenuRowType: Int, CaseIterable{
    case dashboard = 0
    case profile
  
    
    var title: String{
        switch self {
        case .dashboard:
            return "Home"
        case .profile:
            return "Profile"
        }
    }
    
    var iconName: String{
        switch self {
        case .dashboard:
            return "house"
        case .profile:
            return "person"
        }
    }
}

struct SideMenuView: View {
    
    @Binding var selectedSideMenuTab: Int
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        HStack {
            
            ZStack{
                Rectangle()
                    .fill(.white)
                    .frame(width: 240)
                    .shadow(color: .green.opacity(0.1), radius: 5, x: 0, y: 3)
                
                VStack(alignment: .leading, spacing: 0) {
                    ProfileImageView()
                        .frame(height: 140)
                        .padding(.bottom, 30)
//                    
                    ForEach(SideMenuRowType.allCases, id: \.self){ row in
                        RowView(isSelected: selectedSideMenuTab == row.rawValue, imageName: row.iconName, title: row.title) {
                            selectedSideMenuTab = row.rawValue
                            presentSideMenu.toggle()
                        }
                    }
                    
                    Spacer()
                }
                .padding(.top, 60)
                .frame(width: 240)
                .background(
                    Color.white
                )
            }
            
            
            Spacer()
        }
        .background(.clear)
    }
    
    func ProfileImageView() -> some View{
        VStack(alignment: .center){
            HStack{
                Spacer()
                Image("logoAudio")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color.appColor.defaultGreen)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 50)
//                            .stroke(.purple.opacity(0.5), lineWidth: 10)
//                    )
//                    .cornerRadius(50)
                Spacer()
            }
        }
    }
    
    func RowView(isSelected: Bool, imageName: String, title: String, hideDivider: Bool = false, action: @escaping (()->())) -> some View{
        Button{
            action()
        } label: {
            VStack(alignment: .leading){
                HStack(spacing: 20){
                    Rectangle()
                        .fill(isSelected ? Color.appColor.defaultGreen : .white)
                        .frame(width: 5)
                    
                    ZStack{
                        Image(systemName: imageName)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(isSelected ? .black : .gray)
                            .frame(width: 24, height: 24)
                    }
                    .frame(width: 32, height: 24)
                    Text(title)
                        .font(.custom(Constant.AppFonts.Roboto_Medium, size: 16))
                        .foregroundColor(isSelected ? .black : .gray)
                    Spacer()
                }
            }
        }
        .frame(height: 50)
        .background(
            LinearGradient(colors: [isSelected ? Color.appColor.defaultGreen.opacity(0.5) : .white, .white], startPoint: .leading, endPoint: .trailing)
        )
    }
}



#Preview {
    SideMenuView(selectedSideMenuTab: .constant(0), presentSideMenu: .constant(false))
}
