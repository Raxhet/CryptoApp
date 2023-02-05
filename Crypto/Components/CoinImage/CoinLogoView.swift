//
//  CoinLogoView.swift
//  Crypto
//
//  Created by Илья Меркуленко on 05.02.2023.
//

import SwiftUI

struct CoinLogoView: View {
    
    let coin: CoinModel
    
    var body: some View {
        HStack {
            CoinImageView(coin: coin)
                .frame(width: 45, height: 45)
            VStack {
                Text(coin.symbol.uppercased())
                    .font(.headline)
                    .foregroundColor(Color.theme.accent)
                Text(coin.name)
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
        .padding(.all, 7.0)
        
    }
}

struct CoinLogoView_Previews: PreviewProvider {
    static var previews: some View {
        CoinLogoView(coin: dev.coin)
    }
}
