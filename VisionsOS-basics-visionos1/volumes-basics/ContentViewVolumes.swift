import SwiftUI

struct ContentViewVolumes: View {
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        ZStack {
            // astronaut image
            Image(.cosmonaut)
                .resizable()
                .scaledToFill()

            // button
            Button("Explore More") {
                // do something
                openWindow(id: "volume")
            }
            .controlSize(.extraLarge)

            // 3D model
            // Model3D(named: "CosmonautSuit") { model in
            //     model
            // } placeholder: {
            //     ProgressView()
            // }
        }
    }
}

#Preview {
    ContentViewVolumes()
}
