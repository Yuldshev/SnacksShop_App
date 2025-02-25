import Foundation

struct OrderModel: Identifiable {
  let id = UUID()
  let items: [CartItemModel]
  let total: Double
  let date: Date
}
