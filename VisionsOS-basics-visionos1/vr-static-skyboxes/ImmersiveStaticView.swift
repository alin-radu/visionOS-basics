import RealityKit
import RealityKitContent
import SwiftUI

import SwiftUI

struct ImmersiveStaticView: View {
    @Environment(\.openWindow) var openWindow
    @EnvironmentObject var skyBoxSettings: SkyBoxSettings

    @State private var immersiveSkyBoxImage: String?

    var body: some View {
        RealityView { content in
            // create an entity, skybox
            guard let skyBoxEntity = createSkyBox(with: skyBoxSettings.currentSkybox) else {
                return
            }

            immersiveSkyBoxImage = skyBoxSettings.currentSkybox
            // add entity to the content
            content.add(skyBoxEntity)
        } update: { content in
            if immersiveSkyBoxImage == skyBoxSettings.currentSkybox {
                return
            }

            // update current skybox
            updateSkyBox(with: skyBoxSettings.currentSkybox, content: content)
        }
        .onAppear(perform: {
            // present the skybox control window
            openWindow(id: "SkyBoxControls")
        })
    }

    private func createSkyBox(with skyBoxImage: String) -> Entity? {
        // mesh, a large sphere
        let skyBoxMesh = MeshResource.generateSphere(radius: 1000)

        // material, skybox image
        var skyMaterial = UnlitMaterial()
        guard let skyBoxTexture = try? TextureResource.load(named: skyBoxImage) else { return nil }
        skyMaterial.color = .init(texture: .init(skyBoxTexture))

        // create entity
        let skyBoxEntity = Entity()
        skyBoxEntity.components.set(
            ModelComponent(
                mesh: skyBoxMesh,
                materials: [skyMaterial]
            )
        )
        skyBoxEntity.name = "SkyBox"

        // map image to image of sphere
        skyBoxEntity.scale = .init(x: -1, y: 1, z: 1)

        return skyBoxEntity
    }

    private func updateSkyBox(with newSkyBoxName: String, content: RealityViewContent) {
        // get skybox entity from content
        let skyBoxEntity = content.entities.first { entity in
            entity.name == "SkyBox"
        }

        // update its material with the new texture
        guard let updatedBoxTexture = try? TextureResource.load(named: newSkyBoxName) else { return }

        var updatedSkyBoxMaterial = UnlitMaterial()
        updatedSkyBoxMaterial.color = .init(texture: .init(updatedBoxTexture))

        // set the new components
        skyBoxEntity?.components.set(
            ModelComponent(
                mesh: MeshResource.generateSphere(radius: 1000),
                materials: [updatedSkyBoxMaterial]
            )
        )

        // update its material (to lates skybox)
    }
}

#Preview {
    ImmersiveStaticView()
}
