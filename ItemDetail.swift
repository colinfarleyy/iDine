//
//  ItemDetail.swift
//  iDine
//
//  Created by Student on 9/2/21.
//

import SwiftUI


struct ItemDetail: View {
    @EnvironmentObject var order : Order
    let item : MenuItem
    var body: some View {
        VStack {
        ZStack (alignment: .bottomTrailing) {
            Image(item.mainImage)
                .resizable()
                .scaledToFit()
            Text("Photo: \(item.photoCredit)")
                .background(Color.black)
                .padding(4)
                .font(.caption)
                .foregroundColor(.white)
                .offset(x: -5, y: -5)
        }
            Text(item.description)
                .padding()
            Button("Order This") {
                order.add(item: item)
            }
            .font(.headline)
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(Order())
        }
    }
}
