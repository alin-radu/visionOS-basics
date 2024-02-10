import SwiftUI

struct SampleView: View {
    var text: String

    var body: some View {
        Text("\(text)")
    }
}

#Preview {
    SampleView(text: "Window TEST")
}
