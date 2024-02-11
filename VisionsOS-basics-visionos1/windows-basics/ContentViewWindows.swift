// https://www.youtube.com/watch?v=b_V19d_sdOw&t=315s

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
                Button(WindowType.firstWindow.name) {
                    // on press
                    openWindow(id: WindowType.firstWindow.rawValue)
                }

                Button(WindowType.secondWindow.name) {
                    // on press
                    openWindow(id: WindowType.secondWindow.rawValue)
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentViewWindows()
}
