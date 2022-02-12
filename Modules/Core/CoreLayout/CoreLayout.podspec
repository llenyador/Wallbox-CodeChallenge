#
# Be sure to run `pod lib lint CoreLayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CoreLayout'
  s.version          = '0.1.0'
  s.summary          = 'A short description of CoreLayout.'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Aitor Salvador' => 'aitorsg93@gmail.com' }
  s.homepage         = 'https://github.com/llenyador/CoreLayout'
  s.source           = { :git => 'https://github.com/llenyador/Books.git', :tag => s.version.to_s }

  s.static_framework = true
  s.requires_arc     = true
  s.ios.deployment_target = '13.0'

  s.source_files = 'CoreLayout/Classes/**/*'

  s.dependency 'SharedUtilities'
  s.dependency 'SwiftMessages', '9.0.5'
  s.dependency 'SnapKit', '5.0.1'
  s.dependency 'NVActivityIndicatorView', '5.1.1'
  s.dependency 'Nuke'
  s.dependency 'GaugeKit'

  s.resource_bundles = {
    'Assets' => ['CoreLayout/Assets/Assets.xcassets']
  }
end
