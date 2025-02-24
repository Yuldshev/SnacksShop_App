import SwiftUI

struct DetailsProductView: View {
  
  //MARK: - Properties
  let product: ProductModel
  @State var count: CartItem
  @Environment(\.dismiss) var dismiss
  
  //MARK: - Body
  var body: some View {
    GeometryReader { geometry in
      ScrollView(.vertical, showsIndicators: false) {
        VStack {
          HeaderView(
            title: Text("**\(product.name)**"),
            buttonType: .back,
            buttonAction: { dismiss() }
          )
          .padding(.bottom, 30)
          .padding(.top, 85)
          
          Image(product.image)
            .resizable()
            .scaledToFit()
            .frame(width: 233, height: 274)
          
          descriptionView
        }
        .frame(maxHeight: geometry.size.height)
      }
      .frame(maxHeight: geometry.size.height)
    }
    .toolbar(.hidden, for: .navigationBar)
  }
}


//MARK: - DescriptionView
extension DetailsProductView {
  var descriptionView: some View {
    VStack {
      HStack {
        Text(product.category.rawValue)
          .font(.jakartaRegular(size: 8))
          .foregroundStyle(.sLight)
          .padding()
          .background(.sDark)
          .clipShape(Capsule())
        
        Spacer()
        
        Button(action: {}) {
          Image(systemName: "heart")
            .font(.title2).bold()
        }
      }
      .padding(.bottom, 20)
      
      Text(product.description)
        .font(.jakartaRegular(size: 12))
        .padding(.bottom, 24)
      
      HStack {
        Text("$ \(Int(product.price))")
          .font(.jakartaBold(size: 26))
          
        Spacer()
        
        CustomStepper(count: $count.quantity)
      }
      Spacer()
    }
    .frame(height: 360)
    .frame(maxWidth: .infinity)
    .padding(30)
    .background(.sLight)
    .clipShape(.rect(
      topLeadingRadius: 40,
      bottomLeadingRadius: 0,
      bottomTrailingRadius: 0,
      topTrailingRadius: 40
    ))
  }
}


