import SwiftUI

struct HeaderBarView: View {
  @State var title: String
  @State var category: String
  @State var button: String
  
  @Environment(\.dismiss) private var dismiss
  
  var body: some View {
    NavigationStack {
      HStack {
        VStack(alignment: .leading) {
          Text(title)
            .font(.jakartaRegular(size: 42))
          Text(category)
            .font(.jakartaBold(size: 42))
        }
        
        Spacer()
        
        Button(action: {
          if button == "back" {
            dismiss()
          } else {
            print("Открыть меню")
          }
        }) {
          Image(button == "back" ? "iconBack" : "menuBurger")
            .tint(.sDark)
            .padding()
            .frame(width: 70, height: 90)
            .overlay(RoundedRectangle(cornerRadius: 50)
              .stroke(.sSecondary, lineWidth: 4))
        }
      }
      .padding(30)
    }
  }
}

#Preview {
  HeaderBarView(title: "Snacks", category: "Shop", button: "back")
}
