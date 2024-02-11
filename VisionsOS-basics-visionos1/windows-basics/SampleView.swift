import SwiftUI

struct SampleView: View {
    @Environment(\.dismissWindow) private var dismissWindow
    var window: WindowType

    var body: some View {
        VStack {
            Text("\(window.name)")

            Button {
                dismissWindow(id: window.rawValue)
            } label: {
                Text("Close window")
            }
        }
    }
}

#Preview {
    SampleView(window: WindowType.firstWindow)
}
