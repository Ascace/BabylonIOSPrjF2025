//
//  HomePageView.swift
//  Babylon
//
//  Created by user278698 on 11/11/25.
//

import SwiftUI

struct HomePageView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    
                    AppBar ()
                    
                    SwearchView()
                    
                    ImageSliderView()
                    
                    HStack {
                        Text("New Rivals")
                            .font(.title2)
                            .fontWeight(.medium)
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            ProductsView()
                        }, label: {
                            Image(systemName: "circle.grid.2x2.fill")
                                .foregroundStyle(Color("kPrimary"))
                        })
                    }.padding()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10){
                            ForEach(productList, id: \.id){product in NavigationLink{
                                ProductDetailsView(product: product)
                            } label: {
                                ProductCardView(product: product)
                                    .environmentObject(cartManager)
                            }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                }
            }
        }
       
    }
}
    
struct HomePageView_Previews: PreviewProvider{
    static var previews: some View {
        HomePageView()
            .environmentObject(CartManager())
    }
}
    
    struct AppBar: View {
        @EnvironmentObject var cartManager: CartManager
        var body: some View {
            NavigationStack {
                VStack(alignment: .leading) {
                    HStack{
                        Image(systemName: "location.north.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.trailing)
                        
                        Text("Shanghai, china")
                            .font(.title2)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        NavigationLink(destination: CartView()
                            .environmentObject(cartManager)
                        ){
                            CartButton(numberOfProducts: cartManager.products.count)
                        }
                        
                    }
                    Text("Find the most luxurious")
                        .font(.largeTitle.bold())
                    
                    + Text("Furniture")
                        .font(.largeTitle.bold())
                        .foregroundColor(Color("kPrimary"))
                    
                }
            }
            .padding()
          
        }
    }


