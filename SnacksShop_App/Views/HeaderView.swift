import SwiftUI

struct HeaderView: View {
  
  // MARK: - Properties
  let title: Text
  let buttonType: ButtonType
  let buttonAction: () -> Void
  
  // MARK: - Body
  var body: some View {
    HStack {
      // Header Title
      title
        .font(.jakartaRegular(size: 42))
        .frame(width: 216, height: 200, alignment: .leading)
      
      Spacer()
      
      // Button
      switch buttonType {
        case .menu:
          CustomButton(content: AnyView(Image("iconMenu")), action: buttonAction)
        case .back:
          CustomButton(content: AnyView(Image("iconBack")), action: buttonAction)
        case .number(let number):
          CustomButton(
            content: AnyView(
              Text("\(number)")
                .font(.jakartaRegular(size: 36))
                .clipShape(Capsule())
            ),
            action: buttonAction
          )
      }
    }
    .padding(.horizontal, 30)
    .frame(maxWidth: .infinity)
    .frame(height: 106)
  }
}

// MARK: - CustomButton
struct CustomButton: View {
  let content: AnyView
  let action: () -> Void
  
  var body: some View {
    Button(action: action) {
      content
        .frame(width: 69, height: 95)
        .overlay {
          Capsule().stroke(.sLight, lineWidth: 4)
        }
    }
  }
}

// MARK: - ButtonType
enum ButtonType {
  case menu, back, number(Int)
}

// MARK: - Preview
#Preview {
  HeaderView(title: Text("**Snack** Shop"), buttonType: .number(3), buttonAction: {})
}
