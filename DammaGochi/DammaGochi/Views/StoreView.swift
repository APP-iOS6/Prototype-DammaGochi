//
//  StoreView.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: Int
    let imageName: String
    let category: String
}

struct StoreView: View {
    
    let categories = ["전체", "간식", "장난감", "의류", "기타용품"]
    @State private var selected = "전체"
    
    //    let products = Array(repeating: "상품", count: 10)
    let products = [
        Product(name: "1등급 댕댕이 펫밀크", price: 10, imageName: "petMilk", category: "간식"),
        Product(name: "1등급 냥냥이 츄르", price: 10, imageName: "chur", category: "간식"),
        Product(name: "냥냥이 낚시", price: 50, imageName: "catFish", category: "장난감"),
        Product(name: "댕댕이 공놀이", price: 50, imageName: "dogBall", category: "장난감"),
        Product(name: "레드 스트라이프 티셔츠", price: 150, imageName: "red", category: "의류"),
        Product(name: "블루 스트라이프 티셔츠", price: 150, imageName: "blue", category: "의류"),
    ]
    
    @StateObject private var coinManager = CoinManager()
    @State private var showAlert: Bool = false
    @State private var selectedProduct: Product?
    @State private var ownedProducts: [UUID] = []   //구매된 상품 ID로 저장하기 위함
    @State private var addItem: [UUID: Int] = [:]
    
    private var filteredProducts: [Product] {
        if selected == "전체" {
            return products // "전체"가 선택되면 모든 상품을 반환
        } else {
            return products.filter { $0.category == selected } // 선택된 카테고리에 맞는 상품만 반환
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators:  false) {
                    HStack {
                        ForEach(categories, id: \.self) { category in
                            Button(action: {
                                selected = category
                            }) {
                                Text(category)
                                    .padding()
                                    .background(selected == category ? Color.gray : Color(UIColor.systemGray6))
                                    .cornerRadius(20)
                            }
                        }
                    }
                    .padding()
                }
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(filteredProducts, id: \.id) { product in
                            ZStack(alignment: .topTrailing) {
                                VStack {
                                    Image(product.imageName) // 실제 이미지 파일을 사용
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 150)
                                    
                                    Text(product.name)
                                        .padding(.top, 5)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(2)
                                        .frame(height: 50)
                                    
                                    
                                    HStack {
                                        Text("\(product.price) x \(addItem[product.id] ?? 1) = \(product.price * (addItem[product.id] ?? 1))")
                                            .foregroundColor(.black)
                                            .font(.headline)
                                        Image("coin")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                    }
                                    HStack {
                                        Button(action: {
                                            let currentQuantity = addItem[product.id] ?? 1
                                            if currentQuantity > 1 {
                                                addItem[product.id] = currentQuantity - 1
                                            }
                                        }) {
                                            Image(systemName: "minus.circle")
                                                .font(.title)
                                                .foregroundColor(.red)
                                        }
                                        
                                        Text("\(addItem[product.id] ?? 1)")
                                            .padding(.horizontal, 10)
                                        
                                        Button(action: {
                                            let currentQuantity = addItem[product.id] ?? 1
                                            addItem[product.id] = currentQuantity + 1
                                        }) {
                                            Image(systemName: "plus.circle")
                                                .font(.title)
                                                .foregroundColor(.green)
                                        }
                                    }
                                    Button(action: {
                                        selectedProduct = product
                                        showAlert = true
                                    })  {
                                        Text("구매하기")
                                            .font(.caption)
                                            .padding(5)
                                            .background(Color.purple)
                                            .foregroundColor(.white)
                                            .cornerRadius(5)
                                    }
                                    .padding(.top, 5)
                                    //                                    .disabled(ownedProducts.contains(product.id))   //구매완료된 상품은 비활성화
                                }
                                .padding()
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(10)
                                
                                if ownedProducts.contains(product.id) {
                                    Image(systemName: "checkmark.seal.fill")
                                        .foregroundColor(.green)
                                        .padding([.top, .trailing], 8)  // 우측 상단에 배치
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("상점")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Text("\(coinManager.coin)")
                            .font(.headline)
                        Image("coin")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    .padding()
                }
            }
            .alert(isPresented: $showAlert) {
                if let product = selectedProduct {
                                    let quantity = addItem[product.id] ?? 1
                                    let totalPrice = product.price * quantity
                                    if coinManager.coin >= totalPrice {
                                        return Alert(
                                            title: Text("구매 확인"),
                                            message: Text("\(totalPrice) 코인을 사용하여 \(quantity)개를 구매하시겠습니까?"),
                                            primaryButton: .default(Text("확인"), action: {
                                                purchaseProduct(product: product, quantity: quantity)
                                            }),
                                            secondaryButton: .cancel(Text("취소"))
                                        )
                    } else {
                        return Alert(
                            title: Text("코인이 부족합니다"),
                            message: Text("현재 코인으로 이 상품을 구매할 수 없습니다."),
                            dismissButton: .default(Text("확인"))
                        )
                    }
                } else {
                    // selectedProduct가 nil일 때 기본적으로 반환할 Alert
                    return Alert(
                        title: Text("오류"),
                        message: Text("상품이 선택되지 않았습니다."),
                        dismissButton: .default(Text("확인"))
                    )
                }
            }
        }
    }
    private func purchaseProduct(product: Product, quantity: Int) {
            let totalPrice = product.price * quantity // 총 가격 계산
            coinManager.storeCoin(price: totalPrice) // 총 가격만큼 코인 차감
            ownedProducts.append(product.id)
            addItem[product.id] = 1
            print("구매성공! 남은코인: \(coinManager.coin)")
        }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
