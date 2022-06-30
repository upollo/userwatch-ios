# Be sure to run `pod lib lint UserwatchCore.podspec'

Pod::Spec.new do |s|
  s.name             = 'UserwatchCore'
  s.version          = '0.1.0'
  s.summary          = 'Userwatch iOS core internals. Use the Userwatch pod instead.'
  s.license          = { :type => 'Proprietary', :file => 'LICENSE.md' }

  s.author           = { 'Userwatch Team' => 'cocoapods@userwat.ch' }
  s.homepage         = 'https://github.com/Userwatch/userwatch-ios'
  s.social_media_url = 'https://twitter.com/WeAreUserwatch'

  s.source           = { :git => 'https://github.com/Userwatch/userwatch-ios.git', :tag => s.version.to_s }


  s.ios.deployment_target = '12.0'


  s.vendored_frameworks = 'UserwatchCore.xcframework'
end
