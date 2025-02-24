import SwiftUI

@main
struct SnacksShop_App: App {
    var body: some Scene {
        WindowGroup {
          HeaderView(title: Text("**Snack** shop"), buttonType: .back, buttonAction: {})
        }
    }
}
