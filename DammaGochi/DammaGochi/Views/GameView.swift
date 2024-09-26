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
    let gameName: [String] = ["산책하기", "원 잘 그리기", "옷 입히기", "친구 만들기", "간식 주기", "공 안떨어뜨리기"]
    @State var gameCompleted: Bool = false
    @State var showCircle: Bool = false
    @State var isGameEnd: Bool = false
    @EnvironmentObject var coinManager: CoinManager
    var body: some View {
        NavigationStack{
            VStack{
                
                ScrollView{
                    LazyVGrid(columns: gridItem) {
                        ForEach(gameImageName.indices, id: \.self) { index in
                            NavigationLink{
                                GamePlayView(gameComplted: $gameCompleted)
                                    .navigationBarBackButtonHidden(true)
                            }label:{
                                gameImageName(gameImageName: gameImageName[index])
                                    .overlay{
                                        VStack{
                                            HStack{
                                                Spacer()
                                                Group{
                                                    HStack{
                                                        Image("coin")
                                                            .resizable()
                                                            .frame(width: 15, height: 15)
                                                        Text("10")
                                                            .foregroundStyle(.black)
                                                            .font(.body)
                                                            .fontWeight(.bold)
                                                    }
                                                    .padding(.horizontal,5)
                                                    .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                                                }
                                            }
                                            .padding(5)
                                            Text(gameName[index])
                                                .fontWeight(.heavy)
                                                .font(.system(size: 25))
                                                .foregroundStyle(.white)
                                                .padding(.horizontal,10)
                                                .background{
                                                    RoundedRectangle(cornerRadius: 8)
                                                        .fill(.brown.opacity(0.5))
                                                }
                                            Spacer()
                                            Text("Start")
                                                .padding(.vertical, 10)
                                                .padding(.horizontal,55)
                                                .foregroundStyle(.white)
                                                .background(.brown.gradient)
                                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                                .padding(.bottom, 10)
                                        }
                                    }
                            }
                        }
                        .overlay{
                            GameCompleteView(showCircle: $gameCompleted)
                        }
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
                                .frame(width: 35, height: 35)
                            Text("\(coinManager.coin)")
                                .font(.title2)
                                .fontWeight(.heavy)
                        }
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
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}


#Preview {
    NavigationStack{
        GameView()
    }
    .environmentObject(CoinManager())
}
