//
//  ContentViewFullSpace.swift
//  VisionsOS-basics-visionos1
//
//  Created by Alin RADU on 10.02.2024.
//

import SwiftUI

struct ContentViewFullSpace: View {
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var closeImmersiveSpace

    @State private var isImmersed = false

    var body: some View {
        Button {
            Task {
                await openImmersiveSpace(id: "immersive-window")
            }

        } label: {
            Image(systemName: "visionpro")
        }
    }
}

#Preview {
    ContentViewFullSpace()
}
