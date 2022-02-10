#
# Be sure to run `pod lib lint EMSDomain.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EMSDomain'
  s.version          = '0.1.0'
  s.summary          = 'A short description of EMSDomain.'
  s.homepage         = 'https://github.com/llenyador/CodeChallenge'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Aitor Salvador' => 'aitorsg93@gmail.com' }
  s.source           = { :git => 'https://github.com/llenyador/CodeChallenge.git', :tag => s.version.to_s }

  s.static_framework = true
  s.requires_arc     = true
  s.ios.deployment_target = '14.0'

  s.source_files = 'EMSDomain/Classes/**/*.{h,m,swift}'

  s.dependency 'SharedUtilities'

  s.resource_bundles = {
    'MockedData' => ['EMSDomain/MockedData/**/*.json']
  }

  s.test_spec 'EMSDomainTests' do |test_spec|
      test_spec.source_files = 'EMSDomainTests/**/*.{h,m,swift}'
      test_spec.resource = 'EMSDomainTests/**/*.{json}'
      test_spec.dependency 'SharedTestingUtilities'
      test_spec.dependency 'SharedUtilitiesMocks'
      test_spec.requires_app_host = true
  end

end
