#
# Be sure to run `pod lib lint SharedUtilities.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SharedUtilities'
  s.version          = '0.1.0'
  s.summary          = 'A short description of SharedUtilities.'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Aitor Salvador' => 'aitorsg93@gmail.com' }
  s.homepage         = 'https://github.com/llenyador/SharedUtilities'
  s.source           = { :git => 'https://github.com/llenyador/Books.git', :tag => s.version.to_s }

  s.static_framework = true
  s.requires_arc     = true
  s.ios.deployment_target = '13.0'
  s.swift_versions = ['5']

  s.source_files = 'SharedUtilities/Classes/**/*.{swift}'

  s.dependency 'ReachabilitySwift', '5.0.0'

  s.test_spec 'SharedUtilitiesTests' do |test_spec|
      test_spec.source_files = 'SharedUtilitiesTests/**/*.{h,m,swift}'
      test_spec.resource = 'SharedUtilitiesTests/**/*.{swift}'
      test_spec.dependency 'SwiftyMocky', '4.1.0'
      test_spec.requires_app_host = true
  end
end
