

import Foundation

enum SkyBoxType: CaseIterable, Identifiable {
    case beach
    case forest
    case mountains

    var id: SkyBoxType {
        self
    }

    var image: String {
        switch self {
        case .beach:
            "Beach"
        case .forest:
            "Forest"
        case .mountains:
            "Mountains"
        }
    }

    var icon: String {
        switch self {
        case .beach:
            "water.waves"
        case .forest:
            "tree"
        case .mountains:
            "mountain.2"
        }
    }
}

class SkyBoxSettings: ObservableObject {
    @Published var currentSkybox = SkyBoxType.beach.image
}
