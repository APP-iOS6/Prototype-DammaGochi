//
//  File.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI


struct GameView: View {
    let gridItem = Array(repeating: GridItem(.flexible()), count: 2)
    let gameImageName: [String] = ["game1", "game2", "game3", "game4","game5","game6"]
    @State var gameCompleted: Bool = false
    @State var showCircle: Bool = false
    @State var isGameEnd: Bool = false
    @EnvironmentObject var coinManager: CoinManager
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView{
                    LazyVGrid(columns: gridItem) {
                        ForEach(gameImageName, id: \.self) { gameImageString in
                            NavigationLink{
                                GamePlayView(gameComplted: $gameCompleted)
                            }label:{
                                gameImageName(gameImageName: gameImageString)
                                    .overlay{
                                        VStack{
                                            Spacer()
                                            Text("Start")
                                                .padding(.vertical, 10)
                                                .padding(.horizontal,55)
                                                .foregroundStyle(.white)
                                                .background(.green.gradient)
                                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                                .padding(.bottom, 10)
                                        }
                                    }
                            }
                        }
                    }
                    .overlay{
                        GameCompleteView(showCircle: $gameCompleted)
                    }
                }
                .onAppear{
                    gameCompleted = true
                }
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Game")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal,10)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    HStack{
                        Image("coin")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Text("\(coinManager.coin)")
                    }
                }
            }
        }
    }
    @ViewBuilder
    func gameImageName(gameImageName: String) -> some View {
        Image(gameImageName)
            .resizable()
            .frame(height: 300)
            .aspectRatio(contentMode: .fit)
    }
}


#Preview {
    NavigationStack{
        GameView()
    }
    .environmentObject(CoinManager())
}
