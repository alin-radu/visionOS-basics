import RealityKit
import RealityKitContent
import SwiftUI

struct SkyBoxesControlsView: View {
    @EnvironmentObject var skyBoxSettings: SkyBoxSettings

    var body: some View {
        HStack {
            ForEach(SkyBoxType.allCases) { item in
                SkyBoxButton(iconName: item.icon, onClick: {
                    // do something
                    skyBoxSettings.currentSkybox = item.image
                })
                .disabled(skyBoxSettings.currentSkybox == item.image)
            }
        }
    }
}

#Preview {
    SkyBoxesControlsView()
}

struct SkyBoxButton: View {
    var iconName: String
    var onClick: () -> Void

    var body: some View {
        Button {
            // change skybox
            onClick()
        } label: {
            Image(systemName: iconName)
        }
    }
}
