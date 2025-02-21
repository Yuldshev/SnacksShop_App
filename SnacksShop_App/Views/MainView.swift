import SwiftUI

struct MainView: View {
  
  //MARK: - Properties
  @State var cardManager = CardManager()
  
  //MARK: - Body
  var body: some View {
    HomeView()
  }
}

#Preview {
  MainView()
}
