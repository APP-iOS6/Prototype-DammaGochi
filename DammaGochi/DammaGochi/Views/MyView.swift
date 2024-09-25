//
//  MyView.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI

struct MyView: View {
    var examplePets: [Pet] = [Pet(name: "Kitty", age: 5, gender: "♀", personality: "매우 귀엽게 생긴 외모에 그렇지 못한 성격입니다...!", imageStr: "https://emojigraph.org/media/apple/dog-face_1f436.png"), Pet(name: "Yaong", age: 2, gender: "♂", personality: "고양이인척 하는 토끼입니다...!", imageStr: "https://emojigraph.org/media/apple/rabbit-face_1f430.png")]
    
    var exampleLabContents: [LabContent] = [LabContent(title: "반려동물 커뮤니티", imageStr: "https://images.mypetlife.co.kr/content/icons/bemypet-logo.png", address: "https://mypetlife.co.kr/"), LabContent(title: "앱 굿즈 샵", imageStr: "https://img.bemypet.kr/content/2023/12/13150538/bemypet-friends-981x1024.png", address: "https://www.idus.com/v2/product/08c7aec9-c3ef-452f-bc15-98a0dbf81d38?search_word=%EB%B0%98%EB%A0%A4%EB%8F%99%EB%AC%BC%EA%B5%BF%EC%A6%88&keyword_channel="), LabContent(title: "연동 앱", imageStr: "https://webimage.10x10.co.kr/image/basic600/387/B003875310.jpg", address: "https://apps.apple.com/kr/app/%ED%8E%AB%ED%94%BC-%ED%8F%AC%EC%9D%B8%ED%8A%B8-%EC%A0%81%EB%A6%BD%ED%98%95-%EA%B0%95%EC%95%84%EC%A7%80-%EC%82%B0%EC%B1%85%EC%95%B1/id1487605660"), LabContent(title: "펫 다이어리", imageStr: "https://thumbnail.10x10.co.kr/webimage/image/basic600/387/B003875308.jpg?cmd=thumb&w=400&h=400&fit=true&ws=false", address: "https://petcarediary.org/?page=login")]
    
    var color: Color = Color(uiColor: UIColor(red: 131/255, green: 101/255, blue: 98/255, alpha: 1))
    
    var body: some View {
        NavigationStack {
            List {
                ProfileCardView(pets: examplePets, color: color)
                    .listRowSeparator(.hidden)
            }
            .foregroundStyle(color)
            .listStyle(.plain)
            .navigationTitle("Profile")
        }
    }
}

struct LabView: View {
    var contents: [LabContent]
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State var title = ""
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(contents) { content in
                    Link(destination: URL(string: content.address)!) {
                        AsyncImage(url: URL(string: content.imageStr)) { image in
                            image
                                .resizable()
                                .frame(width: 100, height: 100)
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.white)
                                .clipShape(.rect(cornerRadius: 10))
                            
                            Text(content.title)
                            
                            Spacer()
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
            }
        }
    }
}

struct ProfileCardView: View {
    var pets: [Pet]
    var color: Color
    
    var body: some View {
        ForEach(pets) { pet in
            HStack(alignment: .center) {
                // TODO: 로티에서 이미지 따오기
                Image("cat")
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
                        
                        ShareLink(item: URL(string: pet.imageStr)!) {
                            Image(systemName: "square.and.arrow.up")
                        }
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
            .background(color.opacity(0.7))
            .border(color, width: 5)
            .clipShape(.rect(cornerRadius: 10))
        }
    }
}

struct LabContent: Identifiable {
    var id: UUID = UUID()
    var title: String
    var imageStr: String
    var address: String
}

#Preview {
    MyView()
}
