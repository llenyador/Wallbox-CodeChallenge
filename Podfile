# Uncomment the next line to define a global platform for your project

platform :ios, '14.0'

use_frameworks!

# MARK: - Definitions
def app_pods
end

def test_pods
  pod 'SwiftyMocky'
  pod 'SharedTestingUtilities', :path => 'Modules/Core/SharedUtilities'
  pod 'SharedUtilitiesMocks', :path => 'Modules/Core/SharedUtilities'
end

def feature_pods
end

def domain_pods
end

def core_pods
   pod 'CoreLayout', :path => 'Modules/Core/CoreLayout'
   pod 'SharedUtilities', :path => 'Modules/Core/SharedUtilities'
end

workspace 'CodeChallenge'

target 'App' do

  project 'App/App.project'

  core_pods
  domain_pods
  feature_pods
  app_pods

  target 'AppTests' do
    inherit! :search_paths
    test_pods
  end
  
end
