//
//  AstrounautExperience.swift
//  VisionsOS-basics-visionos1
//
//  Created by Alin RADU on 10.02.2024.
//

import RealityKit
import SwiftUI

struct CosmonautExperience: View {
    @State private var isDisplayed = false
    @State private var cosmonaut: Entity?

    var body: some View {
        RealityView { content in
            // load the astronaut model (an entity)
            if let cosmonautEntity = try? await Entity(named: "CosmonautSuit") {
                // changing the starting position
                cosmonautEntity.transform.translation = [0, -0.4, 0.3]

                // start animation that is asociated with the entity
                if let animation = cosmonautEntity.availableAnimations.first {
                    cosmonautEntity.playAnimation(animation)
                }

                // add entity to the content RealityView
                content.add(cosmonautEntity)

                cosmonaut = cosmonautEntity
                isDisplayed = true
            }
        }
    }
}

#Preview {
    CosmonautExperience()
}
