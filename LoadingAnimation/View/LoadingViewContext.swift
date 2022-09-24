//
//  LoadingViewContext.swift
//  LoadingAnimation
//
//  Created by Bakhshaei on 8/18/22.
//

import SwiftUI

struct LoadingViewContext: View {
    
    @State var scaleFactor = 0.5
    @State var rotationOffset : Double = 0

    var circleSize : CGSize {
        return CGSize(width: 270 * self.scaleFactor, height: 270 * self.scaleFactor)
    }
    var wingSize : CGSize {
        return CGSize(width: 535 * self.scaleFactor, height: 635 * self.scaleFactor)
    }
    
    var yOffset : CGFloat {
        return 36 * self.scaleFactor
    }
    
    
    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                let centerCircle = Image("centercircle")
                let wing = Image("wing-up")
                
                context.draw(
                    centerCircle,
                    at: CGPoint(x: size.width/2, y: size.height / 2)
                )
                for _ in 0..<3 {
                    context.draw(
                        wing,
                        at: CGPoint(x: size.width / 2, y: size.height / 2 - circleSize.height - 30)
                    )
                    context.rotate(by: Angle.degrees(120))
                    
                }
                
            }///Canvas
        }///TimelineView
        .frame(width: 1000, height: 1000)
    }///Body
}

struct LoadingViewContext_Previews: PreviewProvider {
    static var previews: some View {
        LoadingViewContext()
            .previewLayout(.sizeThatFits)
    }
}
