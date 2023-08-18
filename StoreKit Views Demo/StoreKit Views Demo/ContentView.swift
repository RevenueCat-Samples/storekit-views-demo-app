import SwiftUI

struct ContentView: View {
    var hasPro: Bool
    var purchasedProducts: Set<String>
    
    @State var showManualPaywall = false
    @State var showStoreViewDemo = false
    @State var showProductViewDemo = false
    @State var showSubscriptionStoreViewDemo = false
    
    var purchasedString: String {
        purchasedProducts.isEmpty ? "none" : purchasedProducts.joined(separator: "\n")
    }

    var body: some View {
        NavigationView(content: {
            List {
                Section {
                    Button("Manual Paywall") { showManualPaywall = true }
                    Button("StoreView") { showStoreViewDemo = true }
                    Button("ProductView") { showProductViewDemo = true }
                    Button("SubscriptionStoreView") { showSubscriptionStoreViewDemo = true }
                }
                Section {
                    LabeledContent("Has Pro", value: hasPro ? "true" : "false")
                    LabeledContent("Purchased Products", value: purchasedString)
                }
                
                Section {
                    Text("To reset your purchases, delete the app from your simulator and rerun the app from Xcode.")
                }
            }
            .navigationTitle("StoreKit Views Demo")
        })
        .sheet(isPresented: $showManualPaywall) { ManualPaywallView() }
        .sheet(isPresented: $showStoreViewDemo) { StoreViewDemoView() }
        .sheet(isPresented: $showProductViewDemo) { ProductViewDemo() }
        .sheet(isPresented: $showSubscriptionStoreViewDemo) { SubscriptionStoreViewDemo() }
    }
}

#Preview {
    ContentView(hasPro: false, purchasedProducts: [])
}
