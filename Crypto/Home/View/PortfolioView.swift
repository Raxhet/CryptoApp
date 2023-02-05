//
//  PortfolioView.swift
//  Crypto
//
//  Created by Илья Меркуленко on 05.02.2023.
//

import SwiftUI

struct PortfolioView: View {

    @EnvironmentObject private var vm: HomeViewModel
    @State private var selectedCoin: CoinModel? = nil
    @State private var quantityText = ""
    @State private var showCheckmarkView = false
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        SearchBarView(searchText: $vm.searchText)
                        
                        coinLogoHorizontalList
                        
                        if selectedCoin != nil {
                            portfolioInputSection
                        }
                    }
                }
                .navigationTitle("Edit Portfolio")
                .toolbar (content: {
                    ToolbarItem (placement: .navigationBarLeading, content: {
                        XMarkButton()
                    })
                    
                    ToolbarItem (placement: .navigationBarTrailing, content: {
                      navBarButton
                    })
                })
                .onChange(of: vm.searchText) { newValue in
                    if newValue == "" {
                        removeSelectedCoin()
                    }
                }
            }
            
            if showCheckmarkView {
                CheckmarkAnimateView()
            }
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
            .environmentObject(dev.homeVM)
    }
}

extension PortfolioView {
    private var coinLogoHorizontalList: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHStack(spacing: 10) {
                ForEach(vm.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                selectedCoin = coin
                            }
                        }
                        .overlay (
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(selectedCoin?.id == coin.id ? Color.gray : Color.clear, lineWidth: 2)
                        )
                }
                
            }
            .padding(5)
        })
    }
    
    private var portfolioInputSection: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Current price of \(selectedCoin?.symbol.uppercased() ?? ""):")
                Spacer()
                Text(selectedCoin?.currentPrice.doubleToCurrency() ?? "")
            }
            Divider()
            HStack {
                Text("Amount holding:")
                Spacer()
                TextField("Write a number..", text: $quantityText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            Divider()
            HStack {
                Text("Current value:")
                Spacer()
                Text(getCurrencyValue().doubleToCurrency())
            }
        }
        .animation(.none, value: 0)
        .padding()
        .font(.headline)
    }
    
    private var navBarButton: some View {
        Button {
            saveButton()
        } label: {
            Text("Save")
                .font(.headline)
        }
        .opacity(selectedCoin != nil && selectedCoin?.currentHoldings != Double(quantityText) ? 1.0 : 0.0)
    }
    
    private func saveButton() {
        guard selectedCoin != nil else { return }
        
        withAnimation(.easeIn) {
            showCheckmarkView = true
            removeSelectedCoin()
        }
        
        UIApplication.shared.endEditing()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeOut) {
                showCheckmarkView = false
            }
        }
    }
    
    private func removeSelectedCoin() {
        selectedCoin = nil
        vm.searchText = ""
    }
    
    private func getCurrencyValue() -> Double {
        if let quantity = Double(quantityText) {
            return quantity * (selectedCoin?.currentPrice ?? 0)
        }
        return 0
    }
    
}
