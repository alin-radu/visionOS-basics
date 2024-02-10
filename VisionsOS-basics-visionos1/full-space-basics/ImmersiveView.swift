
import RealityKit
import RealityKitContent
import SwiftUI

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            // create skybox entity
            guard let skyBoxEntity = createSkyBox() else {
                print("Error loading skybox entity")
                return
            }

            // create earth entity
            guard let earthEntity = await createEarthModel() else {
                print("Error loading earth entity")
                return
            }

            // add entities to realitityView
            content.add(skyBoxEntity)
            content.add(earthEntity)
        }
    }

    private func createSkyBox() -> Entity? {
        // mesh
        let largeSphere = MeshResource.generateSphere(radius: 500)

        // material
        var skyBoxMaterial = UnlitMaterial()

        do {
            // create a texture
            let texture = try TextureResource.load(named: "sky")

            // apply texture to material
            skyBoxMaterial.color = .init(texture: .init(texture))
        } catch {
            print("Error loading texture: \(error)")
        }

        // skyBox entity
        let skyBoxEntity = Entity()
        skyBoxEntity.components.set(
            ModelComponent(
                mesh: largeSphere,
                materials: [skyBoxMaterial])
        )

        // map texture to inner surface
        skyBoxEntity.scale *= .init(x: -1, y: 1, z: 1)

        return skyBoxEntity
    }

    private func createEarthModel() async -> Entity? {
        guard let entity = try? await Entity(named: "Scene", in: realityKitContentBundle) else {
            fatalError("Cannot load the Earth model")
        }

        return entity
    }
}

#Preview {
    ImmersiveView()
}
