import SwiftUI

struct ProductImage: View {
    let productId: String
    
    var body: some View {
        Image(systemName: symbol)
            .resizable()
            .scaledToFit()
            .foregroundColor(color)
    }
    
    var color: Color {
        switch productId {
        case "pro_weekly":
            return .orange
        case "pro_monthly":
            return .blue
        case "pro_yearly":
            return .green
        case "pro_lifetime":
            return .purple
        default:
            return .gray
        }
    }
    
    var symbol: String {
        switch productId {
        case "pro_weekly":
            return "w.circle.fill"
        case "pro_monthly":
            return "m.circle.fill"
        case "pro_yearly":
            return "y.circle.fill"
        case "pro_lifetime":
            return "l.circle.fill"
        default:
            return "questionmark.circle.fill"
        }
    }
}

#Preview {
    VStack {
        ProductImage(productId: "pro_weekly")
            .frame(height: 100)
        ProductImage(productId: "pro_monthly")
            .frame(height: 100)
        ProductImage(productId: "pro_yearly")
            .frame(height: 100)
        ProductImage(productId: "pro_lifetime")
            .frame(height: 100)
        ProductImage(productId: "invalid")
            .frame(height: 100)
    }
}
