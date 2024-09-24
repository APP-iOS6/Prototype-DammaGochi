//
//  MyView.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI
import SwiftSoup

struct MyView: View {
    var examplePets: [PetExam] = [PetExam(name: "댕", age: 5, gender: "♀", personality: "매우 귀엽게 생긴 외모에 그렇지 못한 성격입니다...!", imageStr: "https://emojigraph.org/media/apple/dog-face_1f436.png"), PetExam(name: "고양", age: 2, gender: "♂", personality: "고양이인척 하는 토끼입니다...!", imageStr: "https://emojigraph.org/media/apple/rabbit-face_1f430.png")]
    
    var exampleSites: Dictionary = ["https://images.mypetlife.co.kr/content/icons/bemypet-logo.png" : "https://mypetlife.co.kr/", "https://images.mypetlife.co.kr/content/uploads/2022/09/16111809/%EC%95%A0%ED%94%84%ED%84%B08%EA%B0%9C-%EB%A8%B9%EC%97%88%EC%9D%84%EB%95%8C-edited-390x220.png" : "https://mypetlife.co.kr/134768/", "https://images.mypetlife.co.kr/content/uploads/2024/03/11191702/AdobeStock_233935535-390x220.jpeg" : "https://mypetlife.co.kr/151174/#google_vignette", "https://images.mypetlife.co.kr/content/uploads/2022/05/24142922/2103080693_4bbde53c24_c-390x220.jpg" : "https://mypetlife.co.kr/117887/"]
    
    var body: some View {
        NavigationStack {
            List {
                Section("Profiles") {
                    ProfileCardView(pets: examplePets)
                        .listRowSeparator(.hidden)
                }
                
                Section("Lab") {
                    LabView(sites: exampleSites)
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .toolbar {
                Button {
                    // TODO: 설정화면
                } label: {
                    Image(systemName: "gearshape.fill")
                }
                .tint(.gray)
            }
            .navigationTitle("My")
        }
    }
}

struct LabView: View {
    var sites: Dictionary<String, String>
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State var title = ""
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(sites.sorted(by: >), id: \.key) {
                    imageLink, webLink in
                    Link(destination: URL(string: webLink)!) {
                        AsyncImage(url: URL(string: imageLink)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.white)
                                .clipShape(.rect(cornerRadius: 10))
                            
                            // 콘텐츠가 없어서 반려동물 플랫폼 사이트 찾아서 따왔습니다
                            // HTML에서 타이틀 가져오는 방식 (SwiftSoup 라이브러리 사용)
                            let url = URL(string: webLink)!
                            let html = try? String(contentsOf: url, encoding: .utf8)
                            let doc = try? SwiftSoup.parse(html!)
                            let title = try? doc?.select("title")
                            let str = try? title?.text()
                            
                            Text(str ?? "")
                            
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
    var pets: [PetExam]
    var color: Color = Color(uiColor: .systemGray6)
    
    var body: some View {
        ForEach(pets) { pet in
            HStack(alignment: .center) {
                // 프로필 Image 부분
                // 일단은 어싱크 이미지로 주소 넣어놨습니다
                // TODO: 로티에서 이미지 따오기
                AsyncImage(url: URL(string: pet.imageStr)) { image in
                    image
                        .resizable()
                        .frame(width: 80, height: 80)
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.white)
                } placeholder: {
                    ProgressView()
                }
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
                                .foregroundStyle(.gray)
                        }
                    }
                    
                    Divider()
                    
                    Text(pet.personality)
                        .bold()
                        .font(.title3)
                }
                .padding(.top)
                .padding(.bottom)
                .padding(.trailing)
            }
            .background(color)
            .border(color, width: 5)
            .clipShape(.rect(cornerRadius: 10))
        }
    }
}

struct PetExam: Identifiable {
    var id: UUID = UUID()
    var name: String
    var age: Int
    var gender: String
    var personality: String
    // 프로필 Image 부분
    // 일단은 어싱크 이미지로 주소 넣어놨습니다
    // TODO: 로티에서 이미지 따오기
    var imageStr: String
}

#Preview {
    MyView()
}
