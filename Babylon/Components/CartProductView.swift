//
//  CartProductView.swift
//  Babylon
//
//  Created by user278698 on 11/11/25.
//

import SwiftUI

struct CartProductView: View {
    @EnvironmentObject var cartManger: CartManager
    var product: Product
    var body: some View {
        HStack(spacing: 20){
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:70)
                .cornerRadius(9)
            VStack(alignment:.leading, spacing: 5){
                Text(product.name)
                    .bold()
                
                Text("$ \(product.price)")
                    .bold()
            }
            .padding()
            
            Spacer()
            
            Image(systemName: "trash")
                .foregroundColor(.red)
                .onTapGesture {
                    cartManger.removeFromCart(product: product)
                }
        }
        .padding(.horizontal)
        .background(Color("kSecondary"))
        .cornerRadius(12)
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding()
    }
}

#Preview {
    CartProductView(product: productList[2])
        .environmentObject(CartManager())
}
