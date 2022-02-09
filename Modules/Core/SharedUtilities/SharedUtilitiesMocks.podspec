#
# Be sure to run `pod lib lint SharedUtilities.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SharedUtilitiesMocks'
  s.version          = '0.1.0'
  s.summary          = 'A short description of SharedUtilities.'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Aitor Salvador' => 'aitorsg93@gmail.com' }
  s.homepage         = 'https://github.com/llenyador/SharedUtilities'
  s.source           = { :git => 'https://github.com/llenyador/Books.git', :tag => s.version.to_s }

  s.static_framework = true
  s.requires_arc     = true
  s.platform         = :ios, '13.0'

  s.source_files     = [
    'SharedUtilitiesTests/**/*Mock.swift',
    'SharedUtilitiesTests/**/Mock.generated.swift'
  ]
  s.dependency 'SharedUtilities'
  s.dependency 'SwiftyMocky', '4.1.0'
end
