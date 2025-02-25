//
//  QuestionElement.swift
//  GetReadyForInterview
//
//  Created by Руслан on 20.02.2025.
//

import SwiftUI

struct QuestionElement: View {
    @State var question: QuestionModel
    @State var isExpanded: Bool = false
    @State var height: Double = 200.0
    var body: some View {
        VStack (spacing: 0){
            ZStack {
                RoundedRectangle(cornerRadius: 35)
                    .foregroundStyle(!isExpanded ? .lightGrayApp : .black)
//                    .shadow(color: .black.opacity(0.3), radius: 7)
                if isExpanded {
                    ScrollView (showsIndicators: false)
                    {
                        Text(question.answer)
                            .font(.system(size: 20))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 30)
                            .padding(10)
                    }
                } else {
                    Text(question.question)
                        .font(.system(size: 20))
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.center)
//                        .lineLimit(0)
                }
            }
            .frame(height: isExpanded ? 400 : 100)
            Button {
                withAnimation(.easeInOut) {
                    isExpanded.toggle()
                    
                }
                
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .frame(width: 200, height: 40)
                        .foregroundStyle(!isExpanded ? .black : .clear)
                    HStack {
                        Text(!isExpanded ? "Ответ" : "Свернуть")
                            .foregroundStyle(!isExpanded ? .white : .redApp)
                        if isExpanded {
                            Image(systemName: "chevron.compact.up")
                                .foregroundStyle(.redApp)
                        }
                    }
                }
            }
            .buttonStyle(.plain)
            .offset(y: !isExpanded ? -20 : -5)
            
                
        }
                
    }
            
}
struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

#Preview {
    QuestionElement(question: QuestionModel(question: " Деинициализатор (деструктор) - специальный метод, который автоматически вызывается во время уничтожения экземпляра класса",
                                            answer:  """
                                         Деинициализатор (деструктор) - специальный метод, который автоматически вызывается во время уничтожения экземпляра класса. Это освобождает место в памяти, занимаемое программой.
                                         
                                         Каждый класс в Swift может иметь только один метод деинициализации, который называется `deinit`. Этот метод автоматически вызывается системой, когда объект освобождается, и его можно использовать для выполнения работы по очистке, такой как освобождение ресурсов, закрытие файлов или отмена регистрации уведомлений.
                                         
                                         # **Когда вызывается `deinit`**
                                         
                                         Метод deinit вызывается автоматически системой в тот момент, когда объект больше не нужен и его память освобождается. На практике это происходит, когда все сильные ссылки на объект освобождены.
                                         
                                         # **Замечания**
                                         
                                         1. **Поддерживается только в классах**: 
                                         Деинициализация работает только для классов, поскольку структуры и перечисления являются типами значений и управляются по-другому.
                                         2. **Automatic Reference Counting (ARC)**: 
                                         Swift использует ARC для управления памятью объектов, и метод deinit вызывается тогда, когда счетчик ссылок объекта становится равным нулю.
                                         3. **Неявный вызов**: 
                                         Метод deinit не вызывается напрямую. Он будет вызван автоматически системой, когда объект больше не нужен.
                                         """,
                                            type: [QuestionsTypes.Swift]) )
}

