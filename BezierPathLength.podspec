Pod::Spec.new do |s|
  s.name = 'BezierPathLength'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'A simple API to get the length of either a CGPath, UIBezierPath or NSBezierPath, written in Swift.'
  s.homepage = 'https://github.com/LouisDhauwe/BezierPath-Length'
  s.social_media_url = 'http://twitter.com/LouisDhauwe'
  s.authors = { 'Louis D\'hauwe' => 'louisdhauwe@silverfox.be' }
  s.source = { :git => 'https://github.com/LouisDhauwe/BezierPath-Length.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  
  s.source_files = 'Source/*.swift'
end
