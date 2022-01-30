
import UIKit

class ViewController: UIViewController {

    
    let side: CGFloat = 40
    var x: CGFloat = 0
    var y: CGFloat = 0
    let startButton  = UIButton()
    let clearButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addStartButton()
        addClearButton()
    }
    
    @objc func onStartButton(sender: UIButton!) {
        createView()
    }
    @objc func clearButtonPressed(sender: UIButton!) {
        view.removeFromSuperview()
    }


        func addStartButton() {
        let size: CGFloat = 50
        startButton.frame = CGRect(x: self.view.frame.size.width / 4 - size / 2,
                                   y: self.view.safeAreaLayoutGuide.layoutFrame.size.height,
                                   width: size,
                                   height: size)
        startButton.backgroundColor = .clear
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(.link, for: .normal)
        startButton.setTitleColor(.lightGray, for: .highlighted)
        startButton.addTarget(self, action: #selector(onStartButton), for: .touchUpInside)
        self.view.addSubview(startButton)
        }
   
    func addClearButton() {
        let size: CGFloat = 50
        clearButton.frame = CGRect(x: self.view.frame.size.width / 4 * 3 - size / 2,
                                   y: self.view.safeAreaLayoutGuide.layoutFrame.size.height,
                                   width: size,
                                   height: size)
        clearButton.backgroundColor = .clear
        clearButton.setTitle("Clear", for: .normal)
        clearButton.setTitleColor(.link, for: .normal)
        clearButton.setTitleColor(.lightGray, for: .highlighted)
        clearButton.addTarget(self, action: #selector(clearButtonPressed), for: .touchUpInside)
        self.view.addSubview(clearButton)
    }
    
    func createView() {
        if canCreateView() {
            addView()
                self.x += self.side
                self.createView()
            } else if self.x + self.side > self.view.frame.size.width {
                self.x = 0
                self.y += self.side
                if canCreateView() {
                    self.createView()
                }
            }
        }
    
    
    func addView() {
        let newView = UIView(frame: CGRect(x:self.x, y:self.y, width: self.side, height: self.side))
        newView.backgroundColor = self.getRandomColour()
        self.view.addSubview(newView)
    }
    
    func canCreateView() -> Bool {
        if self.x + self.side > self.view.frame.size.width {return false}
        if self.y + self.side > self.startButton.frame.origin.y {return false}
        return true
    }
    func getRandomColour() -> UIColor {
        return UIColor(red: CGFloat.random(in: 0...1),
                       green: CGFloat.random(in: 0...1),
                       blue: CGFloat.random(in: 0...1),
                       alpha: 1.0)
    }
    
}


