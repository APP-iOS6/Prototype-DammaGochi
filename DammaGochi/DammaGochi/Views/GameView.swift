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
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: gridItem) {
                    ForEach(gameImageName, id: \.self) { gameImageName in
                        Image(gameImageName)
                            .resizable()
                            .frame(height: 300)
                            .aspectRatio(contentMode: .fit)
                            .overlay {
                                VStack{
                                    Spacer()
                                    gameStartButton()
                                }
                            }
                    }
                }
            }
            .overlay{
                GameCompleteView(showCircle: $gameCompleted)
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
                    Text("500")
                }
            }
        }
    }
    @ViewBuilder
    func gameStartButton() -> some View {
        VStack{
            Button{
                gameCompleted.toggle()
            }label: {
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


#Preview {
    NavigationStack{
        GameView()
    }
}
