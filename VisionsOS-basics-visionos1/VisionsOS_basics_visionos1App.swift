import SwiftUI

// window-basics
// @main
// struct VisionsOS_basics_visionos1App: App {
//     var body: some Scene {
//         WindowGroup(id: WindowType.startingWindow.rawValue) {
//             ContentViewWindows()
//         }
//         .defaultSize(width: 600, height: 450)
// 
//         WindowGroup(id: WindowType.firstWindow.rawValue) {
//             SampleView(window: WindowType.firstWindow)
//         }
// 
//         WindowGroup(id: WindowType.secondWindow.rawValue) {
//             SampleView(window: WindowType.secondWindow)
//         }
//     }
// }

// volume-basics
@main
struct VisionsOS_basics_visionos1App: App {
    var body: some Scene {
        WindowGroup(id: "window") {
            ContentViewVolumes()
        }

        WindowGroup(id: "volume") {
            CosmonautExperience()
        }
        .windowStyle(.volumetric)
    }
}

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

// vr-static-skyboxes
// @main
// struct VisionsOS_basics_visionos1App: App {
//     @ObservedObject var skyboxSettings = SkyBoxSettings()
//
//     var body: some Scene {
//         // vr view
//         ImmersiveSpace(id: "ImmersiveSpace") {
//             ImmersiveStaticView()
//                 .environmentObject(skyboxSettings)
//         }
//         .immersionStyle(selection: .constant(.full), in: .full)
//
//         // window view
//         WindowGroup(id: "SkyBoxControls") {
//             SkyBoxesControlsView()
//                 .environmentObject(skyboxSettings)
//         }
//         .defaultSize(width: 30, height: 30)
//     }
// }

// vr-dynamic-skyboxes
// @main
// struct VisionsOS_basics_visionos1App: App {
//     var body: some Scene {
//         // vr view
//         ImmersiveSpace(id: "ImmersiveView") {
//             ImmersiveDynamicView()
//         }
//     }
// }
