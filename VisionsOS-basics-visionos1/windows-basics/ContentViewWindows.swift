import RealityKit
import RealityKitContent
import SwiftUI

struct ContentViewWindows: View {
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "visionpro")
                .font(.system(size: 150))
                .fontWeight(.bold)
                .symbolEffect(.pulse)

            HStack {
                Button("window-1") {
                    // on press
                    openWindow(id: Constants.window1)
                }

                Button("window-2") {
                    // on press
                    openWindow(id: Constants.window2)
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentViewWindows()
}
