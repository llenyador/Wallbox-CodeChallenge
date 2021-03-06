#
# Be sure to run `pod lib lint CoreLayoutMocks.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CoreLayoutMocks'
  s.version          = '0.1.0'
  s.summary          = 'A short description of CoreLayoutMocks.'
  s.homepage         = 'https://github.com/llenyador/CoreLayoutMocks'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Aitor Salvador' => 'aitorsg93@gmail.com' }
  s.source           = { :git => 'https://github.com/llenyador/CoreLayoutMocks.git', :tag => s.version.to_s }
  
  s.static_framework = true
  s.requires_arc     = true
  s.ios.deployment_target = '14.0'

  s.dependency 'CoreLayout'
  s.dependency 'SharedTestingUtilities'
  s.dependency 'SwiftyMocky', '4.1.0'

  s.source_files = [
    'CoreLayoutTests/**/Mock.generated.swift',
    'CoreLayoutTests/**/Equatables.swift',
    'CoreLayoutTests/**/AnyCreatables.swift',
  ]
end
