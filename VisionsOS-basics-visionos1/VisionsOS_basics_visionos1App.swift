import SwiftUI

// window-basics
// @main
// struct VisionsOS_basics_visionos1App: App {
//     var body: some Scene {
//         WindowGroup(id: Constants.startingWindow) {
//             ContentViewWindows()
//         }
//         .defaultSize(width: 600, height: 450)
//
//         WindowGroup(id: Constants.window1) {
//             SampleView(text: "Window 1")
//         }
//
//         WindowGroup(id: Constants.window2) {
//             SampleView(text: "Window 1")
//         }
//     }
// }

// volume-basics
// @main
// struct VisionsOS_basics_visionos1App: App {
//     var body: some Scene {
//         WindowGroup(id: "window") {
//             ContentViewVolumes()
//         }
//
//         WindowGroup(id: "volume") {
//             CosmonautExperience()
//         }
//         .windowStyle(.volumetric)
//     }
// }

// full-space
// @main
// struct VisionsOS_basics_visionos1App: App {
//     // @State var immersionMode: ImmersionStyle = .full
//     @State var immersionMode: ImmersionStyle = .full
//
//     var body: some Scene {
//         // starting-window
//         WindowGroup(id: "starting-window") {
//             ContentViewFullSpace()
//         }
//         .defaultSize(width: 10, height: 10)
//         .windowStyle(.plain)
//
//         // VR
//         ImmersiveSpace(id: "immersive-window") {
//             // VR VIEW
//             ImmersiveView()
//         }
//         .immersionStyle(selection: $immersionMode, in: .full)
//     }
// }

// vr-skyboxes
@main
struct VisionsOS_basics_visionos1App: App {
    @ObservedObject var skyboxSettings = SkyBoxSettings()

    var body: some Scene {
        // vr view
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveVRView()
                .environmentObject(skyboxSettings)
        }
        .immersionStyle(selection: .constant(.full), in: .full)

        // window view
        WindowGroup(id: "SkyBoxControls") {
            SkyBoxesControlsView()
                .environmentObject(skyboxSettings)
        }
        .defaultSize(width: 30, height: 30)
    }
}

