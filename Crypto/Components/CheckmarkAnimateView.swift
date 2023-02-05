//
//  CheckmarkAnimate.swift
//  Crypto
//
//  Created by Илья Меркуленко on 05.02.2023.
//

import SwiftUI

struct CheckmarkAnimateView: View {
    
    @State private var checkViewAppear = false
    
    var body: some View {
        GeometryReader { geometry in
                    Path { path in
                            let width: CGFloat = min(geometry.size.width, geometry.size.height)
                            let height = geometry.size.height
                                    
                            path.addLines([
                                        .init(x: width/2 - 10, y: height/2 - 10),
                                        .init(x: width/2, y: height/2),
                                        .init(x: width/2 + 20, y: height/2 - 20),
                                        ])
                    }
                    .trim(from: 0, to: checkViewAppear ? 1 : 0)
                    .stroke(style: StrokeStyle(lineWidth: 4.0, lineCap: .round))
                    .animation(.easeIn(duration: 0.4))
                    .frame(width: 50, height: 50)
                    .aspectRatio(1, contentMode: .fit)
                    .onAppear() {
                        self.checkViewAppear.toggle()
                    }
                }
        .padding(.top, 15)
        .padding(.horizontal, 5)
        .frame(width: 50, height: 50)
        .background(
            GlassBackGround(width: 70, height: 70, color: .gray)
                .shadow(color: .black, radius: 12, x: 5, y: 5)
        )
    }
}

struct GlassBackGround: View {

    let width: CGFloat
    let height: CGFloat
    let color: Color

    var body: some View {
        ZStack{
            RadialGradient(colors: [.clear, color],
                           center: .center,
                           startRadius: 1,
                           endRadius: 100)
                .opacity(0.6)
            Rectangle().foregroundColor(color)
        }
        .opacity(0.2)
        .blur(radius: 2)
        .cornerRadius(10)
        .frame(width: width, height: height)
    }
}

struct CheckmarkAnimateView_Previews: PreviewProvider {
    static var previews: some View {
        CheckmarkAnimateView()
    }
}
