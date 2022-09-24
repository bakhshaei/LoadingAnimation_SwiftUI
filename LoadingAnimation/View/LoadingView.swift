//
//  LoadingView.swift
//  LoadingAnimation
//
//  Created by Bakhshaei on 8/17/22.
//

import SwiftUI

struct LoadingView: View {
    @State var scaleFactor = 0.3
    var circleSize : CGSize {
        return CGSize(width: 270 * self.scaleFactor, height: 270 * self.scaleFactor)
    }
    var wingSize : CGSize {
        //return CGSize(width: 565 * self.scaleFactor, height: 690 * self.scaleFactor)
        return CGSize(width: 535 * self.scaleFactor, height: 635 * self.scaleFactor)
    }
    
    var yOffset : CGFloat {
        return 36 * self.scaleFactor
    }
    
    let timer = Timer.publish(every: 0.7, on: .main, in: .common).autoconnect()

    @State var centerOffset: CGSize = CGSize(width: 0, height: 0)
    @State var rotationOffset : Double = 0
    @State var isAnimating : Bool = false
    
    func animateLogo() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeOut(duration: 0.7)) {
                isAnimating = true
                rotationOffset += 120
                centerOffset = CGSize(width: -8, height: -8)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.68) {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.0)) {
                centerOffset = CGSize(width: 0, height: 0)
            }
        }
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Image("centercircle")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: circleSize.width)
                    .position(x: geo.size.width / 2,
                              y: geo.size.height / 2)
                    .scaleEffect(
                        CGSize(width: 1 + centerOffset.width / 100, height: 1 + centerOffset.height / 100),
                        anchor: .center
                    )
                
                Image("wing-up")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: wingSize.width)
                    .position(x: geo.size.width / 2,
                              y: (geo.size.height / 2) - circleSize.height / 2 - yOffset)
                    .offset(centerOffset)
                    .rotationEffect(.degrees(rotationOffset))
                    
                
                Image("wing-up")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: wingSize.width)
                    .position(x: geo.size.width / 2,
                              y: (geo.size.height / 2) - circleSize.height / 2 - yOffset)
                    .offset(centerOffset)
                    .rotationEffect(.degrees(120 + rotationOffset))
                
                Image("wing-up")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: wingSize.width)
                    .position(x: geo.size.width / 2,
                              y: (geo.size.height / 2) - circleSize.height / 2 - yOffset)
                    .offset(centerOffset)
                    .rotationEffect(.degrees(-120 + rotationOffset))
                
            } //GeometryReader
            /*.animation(
                Animation.easeOut(duration: 1.0),//interactiveSpring(response: 1.0, dampingFraction: 1.0, blendDuration: 1.0),
                value: isAnimating
            )*/
            
        }//ZStack
        .task {
            animateLogo()
            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { _ in
                animateLogo()
            }
        }
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
