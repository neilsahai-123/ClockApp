//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    var clockLabel : UILabel = {
        let clockLabel = UILabel(frame: CGRect(x: 50, y: 300, width: 300, height: 60))
        clockLabel.text = "00 : 00 : 00"
        clockLabel.textColor = .blue
        clockLabel.textAlignment = .center
        clockLabel.font = .boldSystemFont(ofSize: 20)
        return clockLabel
    }()
    
    var timeFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss a"
        return formatter
    }
   
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 200, width: 300, height: 80)
        label.text = "Hello World!  \nWelcome to Clock App"
        label.textColor = .black
        label.numberOfLines = 2
        label.textAlignment = .center
        
        view.addSubview(label)
        view.addSubview(clockLabel)
        runTimer()
        self.view = view
    }
  
    func runTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            let date = Date()
            let currentTime = self.timeFormat.string(from: date)
            DispatchQueue.main.async {
                self.clockLabel.text = "\(currentTime)"
            }
        }
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
