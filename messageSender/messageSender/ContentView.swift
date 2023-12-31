import SwiftUI
import MessageUI

struct ContentView: View {
    @State private var isShowingMessage = false
    var body: some View {
        VStack {
            Button(action: {
                let numbers = self.readNumbersFromFile(filename: "numbers") ?? []
                self.sendMessage(recipients: numbers, body: "Hello, this is a test message.")
            }) {
                Text("Send Message")
            }
        }
    }
    
    private func sendMessage(recipients: [String], body: String) {
        let composeVC = MFMessageComposeViewController()
        composeVC.recipients = recipients
        composeVC.body = body
        
        if MFMessageComposeViewController.canSendText() {
            // Get the root view controller
            let viewController = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController
            
            // Present the MFMessageComposeViewController
            viewController?.present(composeVC, animated: true, completion: {})
        }
    }

    
    func readNumbersFromFile(filename: String) -> [String]? {
        if let path = Bundle.main.path(forResource: filename, ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let myStrings = data.components(separatedBy: .newlines)
                return myStrings
            } catch {
                print(error)
                return nil
            }
        }
        return nil
    }
}

#Preview {
    ContentView()
}
