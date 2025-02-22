import Foundation

struct Order: Identifiable {
  let id = UUID()
  let items: [CartItem]
  let total: Double
  let date: Date
}
