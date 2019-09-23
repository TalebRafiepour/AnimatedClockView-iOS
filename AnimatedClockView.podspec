Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  
  s.name         = "AnimatedClockView"
  s.version      = "1.0"
  s.summary      = "Simple Clock View For Showing Waiting Of A Process."
  s.description  = "You Can Show Waiting Of A Process With AnimatedClockView(ACV), This Framework Is Very Flexible And Responsivable To Use."
  s.homepage     = "https://github.com/TalebRafiepour/AnimatedClockView-iOS.git"

  s.license      = "MIT"

  s.author             = { "Taleb" => "taleb.r75@gmail.com" }
  # Or just: s.author    = "Taleb"
  # s.authors            = { "Taleb" => "taleb.r75@gmail.com" }
  # s.social_media_url   = "http://twitter.com/Taleb"

  s.platform     = :ios, "12.2"
  s.swift_version = "5" 


  s.source       = { :git => "https://github.com/TalebRafiepour/AnimatedClockView-iOS.git", :tag => "#{s.version}" }
  s.source_files  = "AnimatedClockView", "AnimatedClockView/**/*.swift"

end