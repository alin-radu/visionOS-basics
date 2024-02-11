import AVFoundation
import RealityKit
import SwiftUI

struct ImmersiveDynamicView: View {
    var body: some View {
        RealityView { content in
            // create a dynamic skybox
            guard let dynamicSkyBox = createDynamicSkybox() else {
                print("Error creating the dynamic skybox")
                return
            }

            // add the skybox to the content
            content.add(dynamicSkyBox)
        }
    }

    private func createDynamicSkybox() -> Entity? {
        // create a mesh
        let skyBoxMesh = MeshResource.generateSphere(radius: 1000)

        // create the material that supports animated textures
        guard let videoMaterial = createVideoMaterial() else {
            print("Error creating video material")
            return nil
        }

        // create the entity
        let skyBoxEntity = ModelEntity(mesh: skyBoxMesh, materials: [videoMaterial])

        // map the video to the inner surface of the globe
        skyBoxEntity.scale = .init(x: -1, y: 1, z: 1)

        return skyBoxEntity
    }

    private func createVideoMaterial() -> VideoMaterial? {
        // access a video via url
        guard let url = Bundle.main.url(forResource: "beach-video", withExtension: "mp4") else {
            print("Error loading video")
            return nil
        }

        // create an AVPlayer
        let avPlayer = AVPlayer(url: url)

        // create the video material with the AVPLayer
        let videoMaterial = VideoMaterial(avPlayer: avPlayer)

        // play the video by default
        avPlayer.play()

        return videoMaterial
    }
}

#Preview {
    ImmersiveDynamicView()
}
