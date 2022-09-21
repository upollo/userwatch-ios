# Be sure to run `pod lib lint Userwatch.podspec'

Pod::Spec.new do |s|
  s.name             = 'Userwatch'
  s.version          = '0.2.1'
  s.summary          = 'Userwatch iOS library'
  s.license          = { :type => 'Proprietary', :file => 'LICENSE.md' }
  s.description      = <<-DESC
Turn repeat signups and account sharers into paying customers while keeping bad actors out.
DESC

  s.author           = { 'Userwatch Team' => 'cocoapods@userwat.ch' }
  s.homepage         = 'https://github.com/upollo/userwatch-ios'
  s.source           = { :git => 'https://github.com/upollo/userwatch-ios.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/upolloai'

  s.source_files = 'Userwatch/**/*'

  s.ios.deployment_target = '12.0'
  s.swift_versions = '5.3'

  s.dependency 'SwiftProtobuf', '~> 1.19'
  s.dependency 'UserwatchCore', '0.2.1'
end
