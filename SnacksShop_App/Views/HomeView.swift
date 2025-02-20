import SwiftUI

struct HomeView: View {
  
  //MARK: - Properties
  @State private var selectedCategory: ProductCategory = .choco
  
  //MARK: - Body
  var body: some View {
    ScrollView {
      VStack {
        headerBarView
        categoryListView
        detailCategoryListView
        productListView
      }
    }
  }
}

//MARK: - Extension View
extension HomeView {
  var headerBarView: some View {
    HStack {
      Text("Order From The Best Of **Snacks**")
        .font(.jakartaRegular(size: 30))
        .padding(.trailing)
      
      Spacer()
      
      Image("menuBurger")
        .padding()
        .frame(width: 70, height: 90)
        .overlay(RoundedRectangle(cornerRadius: 50)
          .stroke(.sSecondary, lineWidth: 4))
    }
    .padding(30)
  }
  
  var categoryListView: some View {
    HStack {
      ScrollView(.horizontal, showsIndicators: false) {
        LazyHStack {
          CategoryListView(selectedCategory: $selectedCategory)
        }
      }
    }
    .padding(.leading, 30)
  }
  
  var detailCategoryListView: some View {
    HStack {
      Text("\(selectedCategory.rawValue) **Collections**")
        .font(.jakartaRegular(size: 25))
      Spacer()
      Image("iconMiniBack")
      
    }
    .padding(30)
  }
  
  var productListView: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      LazyHStack {
        ProductCard(selectedCategory: $selectedCategory)
      }
    }
  }
}

//MARK: - Preview
#Preview {
  HomeView()
}
