import Foundation

enum WindowType: String, Identifiable {
    case startingWindow
    case firstWindow
    case secondWindow

    var id: Self { self }

    var name: String {
        switch self {
        case .startingWindow:
            "Starting Window"
        case .firstWindow:
            "First Widow"
        case .secondWindow:
            "Second Window"
        }
    }
}
