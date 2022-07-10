//
//  Home.swift
//  AppStore
//
//  Created by MINH DUC NGUYEN on 03/07/2022.
//

import SwiftUI

struct Home: View {
    //MARK: - Animation Properties
    @State var currentItem: Today?
    @State var showDetailPage: Bool = false
    
    //MARK: - Matched Geomatry Effect
    @Namespace var animation
    
    //MARK: - Detail Animation Property
    @State var animationView: Bool = false
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack(alignment: .bottom, spacing: 30) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("SUNDAY, JULY 3")
                            .font(.callout)
                            .foregroundColor(.gray)
                        
                        Text("Today")
                            .font(.largeTitle.bold())
                    }
                    
                    Spacer()
                    
                    Button {
                        
                        
                    } label: {
                        Image("Profile")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom)
                
                ForEach(todayItem) { item in
                    Button {
                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                            currentItem = item
                            showDetailPage = true
                        }
                        
                    } label: {
                        CardView(item: item)
                        // For Matched Geometry Effect We Didn't applied Padding
                        // Instead Applying Scaling
                            .scaleEffect(currentItem?.id == item.id && showDetailPage ? 1: 0.95)
                    }
                    .buttonStyle(ScaleButtonStyle())
                }
            }
            .padding(.vertical)
        }
        .overlay {
            if let currentItem = currentItem, showDetailPage {
                DetailView(item: currentItem)
                    .ignoresSafeArea(.container, edges: .top)
            }
        }
    }
    
    //MARK: - Card View
    func CardView(item: Today) -> some View {
        VStack(alignment: .leading, spacing: 15) {
            ZStack(alignment: .topLeading) {
                GeometryReader { proxy in
                    let size = proxy.size
                    Image(item.artwork)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 20))
                }
                .frame(height: 400)
                
                LinearGradient(colors: [
                    .black.opacity(0.5),
                    .black.opacity(0.2),
                    .clear
                ], startPoint: .top, endPoint: .bottom)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(item.platformTitle.uppercased())
                        .foregroundColor(.gray)
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                    Text(item.bannerTitle)
                        .font(.largeTitle.bold())
                        .foregroundColor(.primary)
                }
                .multilineTextAlignment(.leading)
                .padding()
            }
            
            HStack(spacing: 12) {
                Image(item.appLogo)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.platformTitle.uppercased())
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text(item.appName)
                        .fontWeight(.bold)
                    
                    Text(item.appDescription)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Button {
                    
                } label: {
                    Text("GET")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 20)
                        .background {
                            Capsule()
                                .fill(.ultraThinMaterial)
                        }
                    
                }
            }
            .padding([.horizontal, .bottom])
        }
        .background {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(.gray.opacity(0.2))
        }
        .matchedGeometryEffect(id: item.id, in: animation)
    }
    
    //MARK: - Detail View
    func DetailView(item: Today) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                CardView(item: item)
                    .scaleEffect(animationView ? 1 : 0.95)
            }
        }
        .transition(.identity)
        .onAppear {
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)){
                animationView = true
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

//MARK: - ScaleButton Style
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.easeInOut, value: configuration.isPressed)
    }
}

//MARK: - Safe Area Value
extension View {
    func safeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        return safeArea
    }
}
