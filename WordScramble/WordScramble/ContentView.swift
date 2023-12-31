
import SwiftUI

struct ContentView: View {
    @State private var wordList = [String]()
    @State private var originalWord = ""
    @State private var insertedWord = ""
    
    @State private var errorAlert = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var score = 0
    
    var body: some View {
        NavigationView{
            List{
                TextField("Enter your word", text: $insertedWord)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                Section(){
                    ForEach(wordList , id: \.self){word in
                        HStack{
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .toolbar{
                Text("Score: \(score)")
                Button("Reset"){
                    resetGame()
                    
                }
            }
            .navigationTitle(originalWord)
            .onSubmit(addInList)
            .onAppear(perform: startGame)
            .alert(errorAlert , isPresented: $showingError){
                Button("Ok" , role: .cancel ){}
            } message: {
                Text(errorMessage)
            }
           
        
        }
    }
    
    func addInList(){
        let answer = insertedWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else {return}
        
        guard isOriginal(word: answer) else{
            showError(alert: "Wrong", message: "Duplicates are not allowed!")
            score -= 1
            return
        }
        
        guard isPossible(word: answer) else{
            showError(alert: "Wrong", message: "Maybe you misspeled the word")
            score -= 1
            return
        }
        
        guard isReal(word: answer) else{
            showError(alert: "Wrong", message: "Do not make up words")
            score -= 1
            return
        }
        
        guard isNormalLength(word: answer) else{
            showError(alert: "Wrong", message: "The word mus be bigger then 3 letters and smaller than the original word")
            score -= 1
            return
        }
        withAnimation{
            wordList.insert(answer, at: 0)
        }
        modifyScore(word: answer)
        insertedWord = ""
        
    }
    
    func startGame(){
        if let UrlFileAccess = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let fileContent = try? String(contentsOf: UrlFileAccess){
                let wordArray = fileContent.components(separatedBy: "\n")
                originalWord = wordArray.randomElement() ?? "silkworm"
                return
            }
            fatalError("error")
        }
        fatalError("There is a problem loading start.txt file!")
    }
    func resetGame(){
        startGame()
        wordList.removeAll()
        showError(alert: "Score", message: "Your score is: \(score)")
        score = 0
    }
    
    func isOriginal(word: String) -> Bool{
        !wordList.contains(word)
    }
    
    func isPossible(word: String) -> Bool{
        var copy = originalWord
        for letter in word{
            if let foundLetter = copy.firstIndex(of: letter){
                copy.remove(at: foundLetter)
            }else{
                return false
            }
            
        }
        return true
    }
    
    func isReal(word: String) -> Bool{
        let textChecker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspeledRange = textChecker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspeledRange.location == NSNotFound
    }
    
    func isNormalLength(word: String) -> Bool{
        if word.count < 4 || word.count == originalWord.count{
            return false
        }
        return true
    }
    
    func modifyScore(word: String){
        score += 1
        if word.count > originalWord.count / 2{
            score += 1
        }
    
    }
    
    func showError(alert: String , message: String){
        errorAlert = alert
        errorMessage = message
        showingError = true
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
