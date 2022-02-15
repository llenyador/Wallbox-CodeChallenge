#
# Be sure to run `pod lib lint EMSDisplay.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EMSDisplay'
  s.version          = '0.1.0'
  s.summary          = 'A short description of EMSDisplay.'

  s.homepage         = 'https://github.com/llenyador/EMSDisplay'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Aitor Salvador' => 'aitorsg93@gmail.com' }
  s.source           = { :git => 'https://github.com/llenyador/EMSDisplay.git', :tag => s.version.to_s }

  s.static_framework = true
  s.requires_arc     = true
  s.ios.deployment_target = '14.0'

  s.source_files = 'EMSDisplay/Classes/**/*'

  s.dependency 'CoreLayout'
  s.dependency 'EMSDomain'

  s.test_spec 'EMSDisplayTests' do |test_spec|
      test_spec.source_files = 'EMSDisplayTests/**/*.{h,m,swift}'
      test_spec.dependency 'SwiftyMocky', '4.1.0'
      test_spec.dependency 'SharedTestingUtilities'
      test_spec.dependency 'CoreLayoutMocks'
      test_spec.dependency 'EMSDomainMocks'
      test_spec.requires_app_host = true
  end

  s.test_spec 'EMSDisplayUITests' do |test_spec|
      test_spec.source_files = 'EMSDisplayUITests/**/*.{h,m,swift}'
      test_spec.dependency 'SharedTestingUtilities'
      test_spec.dependency 'SnapshotTesting'
      test_spec.dependency 'CoreLayoutMocks'
      test_spec.requires_app_host = true
  end
end
