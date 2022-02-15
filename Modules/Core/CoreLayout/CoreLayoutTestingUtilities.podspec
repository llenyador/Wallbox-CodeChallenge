Pod::Spec.new do |s|
  s.name             = "CoreLayoutTestingUtilities"
  s.module_name      = 'CoreLayoutTestingUtilities'
  s.version          = "0.1.0"
  s.summary          = "Shared testing utilities"
  s.homepage         = ""
  s.author           = { 'Aitor Salvador' => 'aitorsg93@gmail.com' }
  s.homepage         = 'https://github.com/llenyador/Wallbox-CodeChallenge'
  s.source           = { :git => 'https://github.com/llenyador/Wallbox-CodeChallenge.git', :tag => s.version.to_s }
  s.static_framework = true

  s.platform     = :ios, '13.0'
  s.requires_arc = true
  
  s.pod_target_xcconfig = {
      'ENABLE_TESTING_SEARCH_PATHS' => 'YES',
      'OTHER_LDFLAGS' => '$(inherited) -weak-lXCTestSwiftSupport -Xlinker -no_application_extension',
      'OTHER_SWIFT_FLAGS' => '$(inherited) -suppress-warnings',
    }

  s.source_files = [
    'CoreLayoutTestingUtilities/**/*.{h,m,swift}'
  ]

  s.dependency 'SharedTestingUtilities'
  s.dependency 'SnapshotTesting', '1.9.0'
end
