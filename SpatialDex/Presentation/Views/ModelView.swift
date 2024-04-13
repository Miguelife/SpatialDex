//
//  ModelView.swift
//  SpatialDex
//
//  Created by Miguel Ángel Soto González on 8/4/24.
//

import SwiftUI
import _RealityKit_SwiftUI

struct ModelView: View {
    let pokemon: Pokemon
    
    @State var angle: Angle = .degrees(0)
    @State var startAngle: Angle?
    @State var axis: (CGFloat, CGFloat, CGFloat) = (.zero, .zero, .zero)
    @State var startAxis: (CGFloat, CGFloat, CGFloat)?
    
    // ScaleEffect
    @State var scale: Double = 300
    @State var startScale: Double?
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Model3D(named: pokemon.name) { model in
                model
                    .resizable()
                    .rotation3DEffect(angle, axis: axis)
                    .simultaneousGesture(DragGesture().onChanged({ value in
                        if let startAngle, let startAxis {
                            let _angle = sqrt(pow(value.translation.width, 2) + pow(value.translation.height, 2)) + startAngle.degrees
                            let axisX = ((-value.translation.height + startAxis.0) / CGFloat(_angle))
                            let axisY = ((value.translation.width + startAxis.1) / CGFloat(_angle))
                            angle = Angle(degrees: Double(_angle))
                            axis = (axisX, axisY, 0)
                        } else {
                            startAngle = angle
                            startAxis = axis
                        }
                    }))
                    .simultaneousGesture(MagnifyGesture()
                        .onChanged { value in
                            if let startScale {
                                scale = max(1, min(500, value.magnification * startScale))
                            } else {
                                startScale = scale
                            }
                        }
                        .onEnded { _ in
                            startScale = scale
                        }
                      )
                    .padding3D(.back, 50)
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }.frame(width: scale, height: scale)
        }
        
    }
}

