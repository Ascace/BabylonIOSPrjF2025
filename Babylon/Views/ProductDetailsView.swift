//
//  ProductDetailsView.swift
//  Babylon
//
//  Created by user278698 on 11/11/25.
//

import SwiftUI

struct ProductDetailsView: View {
    var product: Product
    var body: some View {
        ScrollView{
            ZStack(){
                Color.white
                VStack(alignment: .leading) {
                    ZStack(alignment: .topTrailing ){
                        Image(product.image)
                            .resizable()
                            .ignoresSafeArea(edges: .top)
                            .frame(height:300)
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width:25,height:25)
                            .padding(.top, 65)
                            .padding(.trailing,20)
                    }
                    
                    VStack(alignment:.leading){
                        HStack{
                            Text(product.name)
                                .font(.title2.bold())
                            Spacer()
                            
                            Text("$\(product.price)")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.horizontal)
                                .background(Color("kSecondary"))
                                .cornerRadius(12)
                            
                        }
                        .padding(.vertical)
                        HStack{
                            HStack(spacing: 10){
                                ForEach(0..<5){index in
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 20 , height: 20)
                                        .foregroundStyle(.yellow)
                                    
                                }
                                Text("(4.5)")
                                    .foregroundStyle(.gray)
                            }
                            .padding(.vertical)
                            Spacer()
                            HStack {
                                Button(action: {}, label: {
                                    Image(systemName: "minus.square")
                                })
                                Text("1")
                                Button(action: {}, label: {
                                    Image(systemName: "plus.square.fill")
                                        .foregroundStyle(Color("kPrimary"))
                                })
                            }
                        }
                        Text("Description")
                            .font(.title3)
                    
                        Text(product.description)
                        Spacer()
                        HStack(alignment: .top){
                            VStack(alignment: .leading){
                                Text("Size")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                
                                
                               
                            }
                            .frame(maxWidth: .infinity,alignment: .leading)
                            
                            Spacer()
                            VStack(alignment: .trailing) {
                                Text("Colors")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                HStack{
                                    ColorDotView(color: Color.blue)
                                    ColorDotView(color: Color.black)
                                    ColorDotView(color:Color.green)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        .padding(.vertical)
                        
                        PaymentButton(action: {})
                            .frame(width: .infinity, height: 35)
                        
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(20)
                    .offset(y: -30)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
            
    }
}

#Preview {
    ProductDetailsView(product: productList[4])
}

struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 25, height: 25)
            .clipShape(Circle())
    }
}
