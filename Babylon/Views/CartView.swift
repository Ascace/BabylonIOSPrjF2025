//
//  CartView.swift
//  Babylon
//
//  Created by user278698 on 11/11/25.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ScrollView{
            if cartManager.products.count > 0
            {
                ForEach(cartManager.products, id: \.id){product in
                        CartProductView(product: product )}
                
                
                HStack {
                    Text("Your total is ")
                    
                    Spacer()
                    
                    Text("$\(cartManager.total).00")
                        .bold()
                    
                    
                }
                .padding()
                
                PaymentButton(action: {})
                    .padding()
            }else {
                Text("Your cart is Empty")
            }
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}
