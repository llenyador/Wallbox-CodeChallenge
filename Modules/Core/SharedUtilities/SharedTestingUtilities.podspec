Pod::Spec.new do |s|
  s.name             = "SharedTestingUtilities"
  s.module_name      = 'SharedTestingUtilities'
  s.version          = "0.1.0"
  s.summary          = "Shared testing utilities"
  s.homepage         = ""
  s.license          = 'Code is MIT'
  s.author           = { 'Aitor Salvador' => 'aitorsg93@gmail.com' }
  s.homepage         = 'https://github.com/llenyador/Books'
  s.source           = { :git => 'https://github.com/llenyador/Books.git', :tag => s.version.to_s }
  s.static_framework = true

  s.platform     = :ios, '13.0'
  s.requires_arc = true
  
  s.pod_target_xcconfig = {
      'ENABLE_TESTING_SEARCH_PATHS' => 'YES',
      'OTHER_LDFLAGS' => '$(inherited) -weak-lXCTestSwiftSupport -Xlinker -no_application_extension',
      'OTHER_SWIFT_FLAGS' => '$(inherited) -suppress-warnings',
    }

  s.source_files = [
    'SharedTestingUtilities/**/*.{h,m,swift}'
  ]

  s.dependency 'SharedUtilities'
  s.dependency 'SnapshotTesting', '1.9.0'
  s.dependency 'SwiftyMocky', '4.1.0'
  
end
