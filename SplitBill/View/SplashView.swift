//
//  SplashView.swift
//  SplitBill
//
//  Created by Gül Çavdar on 13.07.2026.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                VStack(spacing: 16) {
                    Image("miniAppIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .cornerRadius(24)
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
                    
                    Text("SPLİT BİLL")
                        .font(.custom(FontBook.PoppinsBold.rawValue, size: 28))
                        .foregroundColor(Colors.lightBlue) 
                        .tracking(2.0)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 2.5)) {
                        self.size = 1.0
                        self.opacity = 1.0
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white.ignoresSafeArea())
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation(.easeOut(duration: 0.5)) {
                        self.isActive = true 
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
