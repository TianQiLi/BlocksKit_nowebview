Pod::Spec.new do |s|
  s.name                  = 'BlocksKit_nowebview'
  s.version               = '2.2.9'
  s.license               = 'MIT'
  s.summary               = 'The Objective-C block utilities you always wish you had.'
  s.homepage              = 'https://github.com/TianQiLi/BlocksKit_nowebview'
  s.author                = { 'tq' => 'zach@waldowski.me'}
  s.source                = { :git => 'https://github.com/TianQiLi/BlocksKit_nowebview.git', :tag => "#{s.version}" }
  s.requires_arc          = true
  s.ios.deployment_target = '6.0'

  s.public_header_files = 'BlocksKit/*.h','BlocksKit/**/*.h'
  s.source_files = 'BlocksKit/*.{h,m}','BlocksKit/**/*.{h,m}'
  s.frameworks    = "Foundation", "UIKit"
 
end
