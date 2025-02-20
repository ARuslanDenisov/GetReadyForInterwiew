//
//  QuestionService.swift
//  GetReadyForInterview
//
//  Created by Руслан on 06.02.2025.
//

import Foundation


class QuestionService {
    static let shared = QuestionService() ; private init() {}
    var swiftQuestions: [QuestionModel] = [
        QuestionModel(question: "Уровни доступа",
                      answer: """
                    1. **open** - есть доступ за пределами модуля, можно наследовать и переопределять классы и методы за пределами модуля
                    2. **public** - есть доступ за пределами модуля, нельзя наследовать и переопределять классы и методы за пределами модуля 
                    3. **internal** - доступ по умолчанию
                    4. **fileprivate** - доступ в пределах файла
                    5. **private** - доступ только в своем объекте
                    6. **Private(Set)** - можно читать, но нельзя писать
                    """,
                      type: [QuestionsTypes.Swift]),
        QuestionModel(question: "Any / AnyObject / any / some",
                      answer: """
                    **Any** - представляет собой протокол, который описывает значение любого типа.
                    **any** - это ключевое слово, используемое для объявления переменных, которые могут хранить значения любого типа.
                    **some** - это аналог **any**, но используется в контексте возвращаемых типов и параметров функций, чтобы указать, что тип должен быть конкретным и необходимо вывести его автоматически.
                    **AnyObject** - представляет собой протокол, который описывает значение класса (классовый тип).
                    """,
                      type:  [QuestionsTypes.Swift]),
        QuestionModel(question: "Что такое ArraySlices?",
                      answer:  """
                    Срез указывает на массив. Нет смысла создавать еще один массив, если массив уже существует и срез может просто описать нужную его часть.

                    ```swift
                    var list = ["hello", "world"]
                    var slice: Array<String> = Array(list[0..<list.count])

                    ```

                    Не выполняя никакого копирования или дополнительного выделения памяти для элементов коллекции, срез можно создать за постоянное (O(1)) время.
                    """,
                      type: [QuestionsTypes.Swift]),
        QuestionModel(question: "Как массив работает под капотом?",
                      answer:  """
                    Это дженерик который передает значения.
                    За счет чего обращение к значениям массива быстрое 0(1)? Потому что это последовательность в памяти и у нас есть указатель на начало массива и мы знаем смещение и обращаемся так к элементу массива. Мы знаем смещение, т.к. это дженерик и мы знаем сколько он занимает памяти и на сколько надо сместиться.
                    """,
                      type: [QuestionsTypes.Swift]),
        QuestionModel(question: "В чем отличие count от capacity в Array?",
                      answer:  """
                    Изначально мы не задаем количество элементов у массива и как он занимает память. И вот как раз capacity показывает какая часть зарезервирована. И ты туда складываешь элементы и в какой то момент может так оказаться что выделенной изначально памяти недостаточно. Выделяется новый кусок, туда переносится старое значение и остается какая то пустая часть. Так вот capacity это память которая выделена под массив сейчас, а count сколько элементов там лежит.
                    В свифте, если ты заранее знаешь сколько элементов у тебя будет, есть метод reserveCapacity который позволяет зарезервировать память сколько нужно, чтобы после очередного добавления не попасть на тайминг когда будет аллоцироваться новая память и переноситься старый массив туда.
                    Емкость массива — в частности, его `reserveCapacity`метод — позволяет заранее выделить пространство в массиве.
                    Если вы добавляете элементы в массив и превышаете его емкость, массив должен увеличить свою емкость. Поскольку массив Swift хранит свои элементы в памяти последовательно, он должен перераспределить свою внутреннюю память и (обычно) скопировать все свои элементы из старого хранилища в новое. 
                    Если вы **заранее** знаете , сколько элементов вы собираетесь добавить в массив, вы можете использовать этот `reserveCapacity`метод для предварительной настройки емкости массива, чтобы не нужно было выполнять какие-либо перераспределения (и связанное с ними копирование).
                    """,
                      type: [QuestionsTypes.Swift]),
        QuestionModel(question: "Как положить в массив Weak объекты?",
                      answer:  """
                    Есть два решения этой проблемы:
                    Создать обертку

                    ```swift
                    class Weak<T: AnyObject> {
                      weak var value : T?
                      init (value: T) {
                        self.value = value
                      }
                    }
                    ```
                    Использовать NSPointerArray
                    """,
                      type: [QuestionsTypes.Swift]),
        QuestionModel(question: "Class vs. Struct",
                      answer:  """
                    # **Структура (Struct)**
                    1. Сохранять примитивные типы данных
                    2. Struct - value types (тип значение)
                    3. Значения копируются, а не передаются по ссылке.
                    4. Нет наследование
                    5. Нет подсчета ссылок
                    6. Нет деинициализатора
                    7. Статическая диспетчеризация
                    8. Структуры хранятся в стеке
                    9. Есть встроенный инициализатор
                    10. Константа для значения (let num = 5)
                    11. Объеĸты уничтожаются сразу после того ĸаĸ они уходят из зоны видимости

                    **Cтруктура хранится (создается) в куче если:**
                    1. Структура реализует протокол
                    2. Структура имеет дженерики
                    3. Структура находится в классе
                    4. Структура держит в себе reference types
                    5. Структура захватывается escaping closures

                    # **Класс (Class)**

                    1. Нет автоматического инициализатора
                    2. При копировании, копируется ссылка
                    3. Константа для ссылки, а не для значения
                    4. Есть наследование
                    5. Класс, ĸлоужер, фунĸции - reference types (ссылочный тип)
                    6. Приведение типов — позволяет проверять и интерпретировать ĸлассы во время выполнения.
                    7. Классы хранятся в куче (heap)
                    8. Деинициализаторы — позволяют каждому экземпляру класса освобождать все назначенные ему ресурсы.
                    9. Сравнивать экземпляры по ссылке ===
                    10. Подсчет ссылок ARC
                    11. Наша ответственность за тем чтобы ссылки удалялись
                    """,
                      type: [QuestionsTypes.Swift]),
        QuestionModel(question: "Когда стоит использовать Классы, а когда Структуры",
                      answer:  """
                    Рекомендуется использовать класс, если вам нужны его характерные особенности. У классов есть несколько дополнительных характеристик, которых нет у структур:
                    - Классы могут наследоваться друг от друга.
                    - Классы могут быть деинициализированы.
                    - Классы поставляются со встроенным понятием идентичности , потому что они являются ссылочными типами. С помощью оператора идентичности === вы можете проверить, ссылаются ли два экземпляра класса на один и тот же объект.

                    Рядом со ссылочным типом значений наследование является наиболее важным различием между классом и структурой. С помощью классов вы можете четко определить родительско-дочернюю связь между подклассом и суперклассом.

                    По умолчанию рекомендуется использовать структуры. Структуры также полезны в следующих сценариях:
                    - Используйте структуры для простых типов данных. Воспринимайте их как простые базы данных, которые вы можете использовать в своем коде, например NewsItem, Task или User. Поскольку они четко определены и часто не нуждаются в сложных отношениях между объектами.
                    - В многопоточной среде, например, с подключением к базе данных в другом потоке, структуры более безопасны. И могут быть безопасно скопированы из одного потока в другой. Классы не имеют присущей им безопасности, если только они не намеренно сделаны поточно-ориентированными.
                    - Когда свойства структуры в основном являются значимыми типами, например String, имеет смысл обернуть их в структуру вместо класса.

                    Использование структур имеет дополнительное преимущество: вам проще анализировать изменения данных в вашем коде. Когда тип является структурой, вы можете быть уверены, что никакая другая часть вашего кода не сможет удерживать ссылку на объект. То есть структура не может быть изменена какой-либо другой частью вашего кода.
                    """,
                      type: [QuestionsTypes.Swift]),
        QuestionModel(question: "Различие между структурой и классом в Swift",
                      answer:  """
                    Структуры и классы — это конструкции позволяющие инкапсулировать в себе как переменные так и методы, выполняющие действия над ними.
                    Структуры и классы очень схожи по синтаксису и возможностям.
                    **Уникальные возможности классов:**
                    — наследование
                    — приведение типов (type casting)
                    — деинициализатор
                    — классы — ссылочного типа (reference type), a структуры — значимого типа (value type)

                    У структур есть возможность создавать экземпляр указывая значение для всех свойств.
                    Как было указано выше, структуры — значимого типа, следовательно если присвоить в другую переменную экземпляр структуры — он будет скопирован, и его значения можно будет менять независимо
                    B случае же структуры а не класса, если обе переменные будут ссылаться на один и тот же объект, и изменить внутренние состояние одной из них — y второй оно так же будет изменено на новое.
                    Таким образом структуры следует использовать для хранения небольшого числа простых типов данных (Int, Float, String, etc). Так что вариантами могут быть структуры для хранения координат точки, вектора и прочего.
                    При передаче в качестве параметра структура копируется, что может вызвать провалы в производительности и повышенный расход памяти.
                    С другой стороны String, Array, Dictionary — это все структуры, и если бы они всегда копировались при передачи в качестве параметров — swift был бы крайне медленным. Но разработчики уверяют, что копия делается только в случае необходимости (если их значение внутри функции меняется, полагаю). Я проверял отладчиком — действительно пока изменений в переданной строке нет — внутренний указатель внутри функции для строки тот же что и был до вызова функции, но как только мы меняем значение строки — происходит копирование строки в другой участок памяти
                    """,
                      type: [QuestionsTypes.Swift]),
        QuestionModel(question: "Closure (замыкания)",
                      answer:  """
                    Это блоки кода, которые могут быть многократно использованы, автономные блоки функциональности, которые можно передавать и использовать в вашем коде или блок кода, который вы можете присвоить переменной. Затем вы можете передать его в своем коде, например, в другую функцию.
                    """,
                      type: [QuestionsTypes.Swift]),
        QuestionModel(question: "Замыкания и захват значений",
                      answer:  """
                    В Swift замыкания захватывают переменные и константы из окружающей их области видимости.
                    Каждая переменная, функция и замыкание имеет свою область видимости. Область видимости определяет, где вы можете получить доступ к определенной переменной, функции или замыканию. Если переменная, функция или замыкание не находятся в области видимости, вы не можете получить к ним доступ.
                    Любой код имеет глобальные и локальные области видимости.
                    Замыкания могут захватывать и хранить ссылки на любые константы и переменные из контекста, в котором они объявлены. Эта процедура известна как заключение этих констант и переменных, отсюда и название "замыкание". Swift выполняет всю работу с управлением памятью при захвате за вас.
                    Внутри closure захваченные значения помечаем ключевым словом self.
                    """,
                      type: [QuestionsTypes.Swift]),
        QuestionModel(question: "Escaping Closures",
                      answer:  """
                    Сбегающее замыкание @escaping — это ключевой термин, используемый для обозначения жизненного цикла замыкания, который передается в качестве аргумента функции. Добавляя к любому аргументу замыкания префикс @escaping, вы передаете сообщение вызывающему функцию, что это замыкание может «избежать» область вызова функции. Без префикса @escaping замыкание по умолчанию не является сбегающим, и его жизненный цикл заканчивается вместе с областью действия функции.
                    """,
                      type: [QuestionsTypes.Swift]),
        QuestionModel(question: "В чем разница для компилятора в escaping closure и non-escaping?",
                      answer:  """
                    **`@nonescaping` (стандартные) замыкания:**
                    - Когда замыкание передается в аргументах функции и и**спользуется до того, как выполнится тело функции и управление вернется обратно.**
                    - Когда **функция завершается**, переданное замыкание выходит из области видимости и **больше не существует в памяти.**

                    **`@escaping` (убегающие) замыкания:**
                    - Когда замыкание передается в аргументах функции и **используется после того, как выполнится тело функции и управление вернется обратно.**
                    - Когда **функция завершается**, переданное **замыкание продолжает существовать в области видимости и находится в памяти, пока замыкание не будет выполнено.**
                    """,
                      type: [QuestionsTypes.Swift]),
        QuestionModel(question: "АВТОЗАМЫКАНИЯ",
                      answer:  """
                    - это замыкания, которые создаются автоматически для заключения выражения, которое было передано в качестве аргумента функции.
                    Такие замыкания не принимают на вход никакие аргументы при вызове и возвращают значение выражения, которое заключено внутри автозамыкания.
                    Автозамыкание позволяет отложить выполнение действия до тех пор, пока вы сами его не вызовете. Обозначается ключевым словом **`@autoclosure`**
                    """,
                      type: [QuestionsTypes.Swift]),
        QuestionModel(question: "Comparable",
                      answer:  """
                    Comparable - это протокол, который позволяет сравнивать объекты по их значению. Если класс имплементирует этот протокол, то он может быть сравнен с другими объектами этого класса.
                    """,
                      type: [QuestionsTypes.Swift]),
        QuestionModel(question: "Deinit",
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
                      type: [QuestionsTypes.Swift]),
        QuestionModel(question: "Defer",
                      answer:  """
                    Ключевое слово defer пишется с телом и выполняется либо при завершении области видимости (если находится внутри блока if к примеру) либо в после завершения выполнения кода тела функции, а именно после return.
                    Работает по принципу LIFO (Last input first output), что означает если есть два defer в строке 20 и в строке 30, то они будут выполняться в обратном порядке - сначала defer из строки 30, затем defer из строки 20.
                    Зачем нужен defer?
                    - **`defer`** используется для отложенного выполнения кода до момента завершения текущего блока, независимо от того, как он завершается (нормально или с ошибкой). Это полезно, например, для управления ресурсами или выполнения действий, которые должны произойти независимо от того, как завершается блок кода.
                    """,
                      type: [QuestionsTypes.Swift]),
        QuestionModel(question: "Перечисления (Enum)",
                      answer:  """
                    Enum в Swift — это мощная конструкция, которая позволяет работать с группой связанных значений в безопасной и удобной форме.
                    1. Не могут содержать хранимые поля (только static)
                    2. Case всегда уникальные
                    3. Enum - это структура
                    4. Можно сравнивать оператором ==
                    5. Если есть ассоциированные значения, то надо подписаться на Equatable чтобы сравнивать
                    
                    Использование switch с enum:
                    Конструкция switch идеально подходит для работы с перечислениями, позволяя работать с каждым случаем. Swift требует, чтобы конструкция switch исчерпывающе обрабатывала все случаи перечисления, что обеспечивает безопасность
                    Связанные значения:
                    Перечисления в Swift могут иметь ассоциированные значения, что позволяет хранить дополнительные данные для каждого случая
                    Значения по умолчанию (Raw Values):
                    Можно назначить значения по умолчанию (типы String, Character, Int или Float) для каждого случаям
                    Методы и вычисляемые свойства:
                    Enums могут содержать методы и вычисляемые свойства, что расширяет их функциональность
                    Итерация:
                    Если перечисление выполняет протокол CaseIterable, то можно получить массив всех его случаев
                    """,
                      type: [QuestionsTypes.Swift]),
        
        
    ]
    
    func getValue(_ type: QuestionsTypes) -> Int {
        return 10
    }
    func getProgress (theme: QuestionsTypes) -> Double {
        let allQuestions = getQuestions(theme: theme)
        let doneQuestions = allQuestions.filter { $0.isChecked }.count
        
        return (Double(allQuestions.count) / 100.0) * Double(doneQuestions).rounded()
    }
    // CRUD operation
    func getQuestions(theme: QuestionsTypes) -> [QuestionModel] {
        swiftQuestions.filter({ $0.type.contains(theme) })
    }
    func updateQuestion(_ question: QuestionModel) -> Bool {
            let index = swiftQuestions.firstIndex { questionIn in
                questionIn.id == question.id}
            guard let index else {
                return false
            }
            swiftQuestions[index] = question
            return true
    }
}


extension QuestionService {
//    swiftQuestions = [
//        QuestionModel(question: <#T##String#>, answer: <#T##String?#>, type: <#T##[QuestionsTypes]#>),
//    ]
}
