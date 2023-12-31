import SwiftUI
import UIKit
import MessageUI

struct ContentView: View {
    @State private var result: Result<MFMessageComposeResult, Error>? = nil
    var body: some View {
        Button("Send Message") {
            self.sendMessage()
        }
    }

    func sendMessage() {
        let messageVC = MFMessageComposeViewController()
        messageVC.body = "Hello, World!"
        messageVC.recipients = ["1234567890"]
        messageVC.messageComposeDelegate = self
        UIApplication.shared.windows.first?.rootViewController?.present(messageVC, animated: true, completion: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.result = Result(result, nil)
        controller.dismiss(animated: true, completion: nil)
    }
}


#Preview {
    ViewController()
}
