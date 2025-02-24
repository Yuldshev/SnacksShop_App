import SwiftUI

struct CustomStepper: View {
  
  //MARK: - Properties
  @Binding var count: Int
  
  //MARK: - Body
  var body: some View {
    HStack {
      Button {
        if count > 0 { count -= 1}
      } label: {
        Image(systemName: "minus")
          .font(.subheadline)
          .padding()
          .foregroundStyle(.sLight)
          .frame(width: 30, height: 30)
          .background(count > 0 ? .sDark : .sDark.opacity(0.4))
          .clipShape(Circle())
      }
      Spacer()
      
      Text("\(count)")
        .font(.jakartaRegular(size: 18))
      
      Spacer()
      
      Button(action: { count += 1 }) {
        Image(systemName: "plus")
          .font(.subheadline)
          .padding()
          .foregroundStyle(.sLight)
          .frame(width: 30, height: 30)
          .background(.sDark)
          .clipShape(Circle())
      }
    }
    .frame(width: 110, height: 30)
  }
}

