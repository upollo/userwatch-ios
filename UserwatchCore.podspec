# Be sure to run `pod lib lint UserwatchCore.podspec'

Pod::Spec.new do |s|
  s.name             = 'UserwatchCore'
  s.version          = '0.0.1'
  s.summary          = 'Userwatch iOS core internals. Use the Userwatch pod instead.'
  s.license          = { :type => 'Proprietary', :file => 'LICENSE.md' }

  s.author           = { 'Userwatch' => 'cocoapods@userwat.ch' }
  s.homepage         = 'https://userwat.ch'
  s.social_media_url = 'https://twitter.com/WeAreUserwatch'

  s.source           = { :git => 'https://github.com/Userwatch/userwatch-ios.git', :tag => s.version.to_s }
  s.vendored_frameworks = "UserwatchCore.xcframework"

  s.ios.deployment_target = '12.0'
end
