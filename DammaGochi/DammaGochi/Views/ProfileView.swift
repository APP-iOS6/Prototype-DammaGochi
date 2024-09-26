//
//  MyView.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var petManager: PetManager
    
    var color: Color = Color(uiColor: UIColor(red: 131/255, green: 101/255, blue: 98/255, alpha: 1))
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(petManager.examplePets) { pet in
                    HStack(alignment: .center) {
                        // TODO: 로티에서 이미지 따오기
                        Image(pet.imageStr)
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .padding()
                        
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text(pet.name)
                                    .bold()
                                    .font(.title)
                                
                                Spacer()
                                
                                Text("\(pet.age)살")
                                
                                Text(pet.gender)
                                    .foregroundStyle(pet.gender == "♀" ? .pink : .blue)
                            }
                            
                            Divider()
                                .background(.white)
                            
                            Text(pet.personality)
                                .bold()
                                .font(.title3)
                        }
                        .padding(.top)
                        .padding(.bottom)
                        .padding(.trailing)
                    }
                    .foregroundStyle(.white)
                    .background(pet == petManager.selectedPet ? color.opacity(0.7) : Color(uiColor: .lightGray))
                    .border(pet == petManager.selectedPet ? color : Color(uiColor: .lightGray), width: 5)
                    .clipShape(.rect(cornerRadius: 10))
                    .swipeActions {
                        ShareLink(item: URL(string: pet.imageStr)!) {
                            Image(systemName: "square.and.arrow.up")
                        }
                    }
                    .onTapGesture {
                        petManager.selectedPet = pet
                    }
                }
                .listRowSeparator(.hidden)
            }
            .foregroundStyle(color)
            .listStyle(.plain)
            .navigationTitle("Profile")
        }
    }
}

//#Preview {
//    MyView()
//}
