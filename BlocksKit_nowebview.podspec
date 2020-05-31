Pod::Spec.new do |s|
  s.name                  = 'BlocksKit_nowebview'
  s.version               = '2.2.5'
  s.license               = 'MIT'
  s.summary               = 'The Objective-C block utilities you always wish you had.'
  s.homepage              = 'https://github.com/TianQiLi/BlocksKit_nowebview'
  s.author                = { 'tq' => 'zach@waldowski.me'}
  s.source                = { :git => 'https://github.com/TianQiLi/BlocksKit_nowebview.git', :tag => "#{s.version}" }
  s.requires_arc          = true
  s.osx.deployment_target = '10.8'
  s.ios.deployment_target = '6.0'

  s.default_subspec = 'All'
  s.subspec 'All' do |ss|
    ss.dependency 'BlocksKit/Core'
    ss.dependency 'BlocksKit/DynamicDelegate'
    ss.ios.dependency 'BlocksKit/MessageUI'
    ss.ios.dependency 'BlocksKit/UIKit'
  end

  s.subspec 'Core' do |ss|
    ss.source_files = 'BlocksKit/BlocksKit.h', 'BlocksKit/Core/*.{h,m}'
  end

  s.subspec 'DynamicDelegate' do |ss|
    ss.source_files = 'BlocksKit/DynamicDelegate/*.{h,m}', 'BlocksKit/DynamicDelegate/Foundation/*.{h,m}'
  end

  s.subspec 'MessageUI' do |ss|
    ss.dependency 'BlocksKit/Core'
    ss.dependency 'BlocksKit/DynamicDelegate'
    ss.platform = :ios
    ss.source_files = 'BlocksKit/BlocksKit+MessageUI.h', 'BlocksKit/MessageUI/*.{h,m}'
    ss.ios.frameworks = 'MessageUI'
  end

  s.subspec 'UIKit' do |ss|
    ss.dependency 'BlocksKit/Core'
    ss.dependency 'BlocksKit/DynamicDelegate'
    ss.platform = :ios
    ss.source_files = 'BlocksKit/BlocksKit+UIKit.h', 'BlocksKit/UIKit/*.{h,m}'
  end
end
