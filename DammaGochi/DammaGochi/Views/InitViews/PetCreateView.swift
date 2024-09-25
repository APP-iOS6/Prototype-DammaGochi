//
//  PetCreateView.swift
//  DammaGochi
//
//  Created by 최승호 on 9/24/24.
//

import SwiftUI
import SwiftData

struct PetCreateView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var pets: [Pet]
    
    @State var showTabView: Bool = false
    @State private var selectedAnimalType: String = ""  // 어떤 동물인지
    @State private var selectedBreed: String = ""       // 입력한 동물의 종
    @State private var selectedColor: String = ""       // 입력한 펫의 색
    @State private var selectedGender: String = "Male"  // 선택된 펫의 성별
    
    // --- 각 요소별로 fade in 애니메이션을 위한 show 변수 ---
    @State private var showTitle: Bool = false
    @State private var showAnimalTypeQuestion: Bool = false
    @State private var showBreedQuestion: Bool = false
    @State private var showColorQuestion = false
    @State private var showGenderPicker = false
    @State private var showCreateButton = false
    // -----------------------------------------------
    
    var body: some View {
        VStack(alignment: .leading) {            
            // 첫 번째 텍스트: "당신만의 펫을 만들어보세요."
            Text("당신만의 펫을 만들어보세요.")
                .font(.title)
                .opacity(showTitle ? 1 : 0) // 처음에는 숨기고, 애니메이션으로 나타남
                .animation(.easeIn(duration: 1), value: showTitle) // 애니메이션 적용
            
            Spacer()
            
            // 두 번째 텍스트: "어떤 펫을 만들고 싶으신가요?"
            AnimalTypeQuestionView(showAnimalTypeQuestion: $showAnimalTypeQuestion, selectedAnimalType: $selectedAnimalType, checkAllFields: checkAllFields)
            
            Spacer()
            
            // 세 번째 텍스트: "이 펫의 종은 무엇인가요?"
            AnimalBreedQuestionView(showBreedQuestion: $showBreedQuestion, selectedBreed: $selectedBreed, checkAllFields: checkAllFields)
            Spacer()
            
            // 네 번째 텍스트: "이 펫의 털은 무슨 색인가요?"
            AnimalColorQuestionView(showColorQuestion: $showColorQuestion, selectedColor: $selectedColor, checkAllFields: checkAllFields)
            Spacer()
            
            // 다섯 번째: 성별 선택
            animalGenderQuestionView(showGenderPicker: $showGenderPicker, selectedGender: $selectedGender, checkAllFields: checkAllFields)
            
            Spacer()
            
            HStack {
                Spacer()
                Button(action: {
                    showTabView = true
                    let newPet = Pet(name: "고양", age: 2, gender: "♂", personality: "고양이인척 하는 토끼입니다...!", imageStr: "https://emojigraph.org/media/apple/rabbit-face_1f430.png")
                    modelContext.insert(newPet)
                }) {
                    Text("생성하기")
                }
                .opacity(showCreateButton ? 1 : 0)
                .animation(.easeIn(duration: 1), value: showCreateButton)
                .fullScreenCover(isPresented: $showTabView) {
                    CustomTabView()
                }
                Spacer()
            }
            Spacer()
            Group{
                Text("프로토타입앱으로 실제 선택한 펫이 생성되진 않습니다.")
                Text("모든 정보를 입력해야 다음 버튼이 나타납니다.")
            }
            .font(.caption)
            .foregroundStyle(.secondary)
            
        }
        .padding()
        .onAppear {
            withAnimation(.easeIn(duration: 1)) {
                showTitle = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.easeIn(duration: 1)) {
                    showAnimalTypeQuestion = true
                    showBreedQuestion = true
                    showColorQuestion = true
                    showGenderPicker = true
                }
            }
        }
    }
    // 모든 필드가 채워졌는지 확인하는 함수
    func checkAllFields() {
        if !selectedAnimalType.isEmpty && !selectedBreed.isEmpty && !selectedColor.isEmpty {
            withAnimation {
                showCreateButton = true
            }
        } else {
            showCreateButton = false
        }
    }
}

// MARK: - 동물 선택 질문 뷰
struct AnimalTypeQuestionView: View {
    @Binding var showAnimalTypeQuestion: Bool
    @Binding var selectedAnimalType: String
    var checkAllFields: () -> Void
    
    var body: some View {
        Text("어떤 펫을 만들고 싶으신가요?")
            .font(.title3)
            .opacity(showAnimalTypeQuestion ? 1 : 0)
            .animation(.easeIn(duration: 0.5), value: showAnimalTypeQuestion) // 애니메이션 적용
        TextField("예) 강아지, 고양이", text: $selectedAnimalType)
            .opacity(showAnimalTypeQuestion ? 1 : 0)
            .animation(.easeIn(duration: 0.5), value: showAnimalTypeQuestion)
            .onChange(of: selectedAnimalType) { _ in
                checkAllFields()
            }
    }
}

// MARK: - 종 선택 질문 뷰
struct AnimalBreedQuestionView: View {
    @Binding var showBreedQuestion: Bool
    @Binding var selectedBreed: String
    var checkAllFields: () -> Void
    
    var body: some View {
        Text("이 펫의 종은 무엇인가요?")
            .font(.title3)
            .opacity(showBreedQuestion ? 1 : 0)
            .animation(.easeIn(duration: 0.5), value: showBreedQuestion)
        TextField("예) 푸들, 시츄, 먼치킨, 뱅갈", text: $selectedBreed)
            .opacity(showBreedQuestion ? 1 : 0)
            .animation(.easeIn(duration: 0.5), value: showBreedQuestion)
            .onChange(of: selectedBreed) { _ in
                checkAllFields()
            }
    }
}

// MARK: - 색 선택 질문 뷰
struct AnimalColorQuestionView: View {
    @Binding var showColorQuestion: Bool
    @Binding var selectedColor: String
    var checkAllFields: () -> Void
    
    var body: some View {
        Text("이 펫의 털은 무슨 색인가요?")
            .font(.title3)
            .opacity(showColorQuestion ? 1 : 0)
            .animation(.easeIn(duration: 0.5), value: showColorQuestion)
        TextField("예) 검정색, 흰색, 회색", text: $selectedColor)
            .opacity(showColorQuestion ? 1 : 0)
            .animation(.easeIn(duration: 0.5), value: showColorQuestion)
            .onChange(of: selectedColor) { _ in
                checkAllFields()
            }
    }
}

// MARK: - 성별 선택 피커 뷰
struct animalGenderQuestionView: View {
    @Binding var showGenderPicker: Bool
    @Binding var selectedGender: String
    // 성별 목록
    let genders = ["Male", "Female"]
    var checkAllFields: () -> Void
    
    var body: some View {
        Text("마지막으로 펫의 성별을 골라주세요.")
            .font(.title3)
            .opacity(showGenderPicker ? 1 : 0)
            .animation(.easeIn(duration: 0.5), value: showGenderPicker)
        Picker("Select Gender", selection: $selectedGender) {
            ForEach(genders, id: \.self) { gender in
                Text(gender)
            }
        }
        .pickerStyle(.segmented)
        .opacity(showGenderPicker ? 1 : 0)
        .animation(.easeIn(duration: 0.5), value: showGenderPicker)
        .onChange(of: selectedGender) { _ in
            checkAllFields()
        }
    }
}

#Preview {
    PetCreateView()
}
