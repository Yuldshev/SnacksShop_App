import SwiftUI

struct CollectionView: View {
  
  //MARK: - Properties
  @State var isActive: Category
  var buttonAction: () -> Void
  
  //MARK: - Body
  var body: some View {
    ScrollView {
      VStack {
        HeaderView(
          title: Text("**\(isActive.rawValue)** Collection"),
          buttonType: .back,
          buttonAction: buttonAction
        )
        
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
          ForEach(productList.filter { isActive == .all || $0.category == isActive }, id: \.id) { item in
            ProductCardView(product: item, isLarge: false)
              .padding(.bottom, 10)
          }
        }
        .padding(20)
      }
    }
  }
}

#Preview {
  CollectionView(isActive: .choco, buttonAction: {})
}
