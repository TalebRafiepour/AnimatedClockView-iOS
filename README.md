# AnimatedClockView-iOS
Simple Clock View For Showing Waiting Of A Process.

<img src="https://github.com/TalebRafiepour/AnimatedClockView-iOS/blob/master/acv-iOS.gif" width="300"> 

## Installation
###  CocoaPods
To integrate AnimatedClockView into your Xcode project using CocoaPods, specify it in your `Podfile`:
```ruby
platform :ios, '9.0'
use_frameworks!

target 'YourProjectName' do
  pod 'AnimatedClockView'
end
```
And then remember to `import AnimatedClockView` module before using it.

###  Manually
You could directly copy and add the folder `AnimatedClockView` which contains 'AnimatedClockView.swift' file to your project.   


## Usage
You could use `AnimatedClockView` like you use `UIView`, create and layout it programmatically, or get everything done with Storyboard and XIB. Additionally, clone this [Demo](https://github.com/TalebRafiepour/AnimatedClockView-iOS) project to find out how easy it is working.
### Programmatically
```swift
    //......
    let animatedClockView = AnimatedClockView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.animatedClockView.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        self.view.addSubview(self.animatedClockView)
        
        self.animatedClockView.animate = true
        self.animatedClockView.clockColor = UIColor.red
        //or if you want to reset clock you can call resetClcok()
        //self.animatedClockView.resetClock()
        
    }
```
