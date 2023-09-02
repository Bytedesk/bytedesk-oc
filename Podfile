# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'
workspace 'bytedesk-oc'
#use_frameworks!

target 'bytedesk-oc' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  project 'bytedesk-oc.xcodeproj'
  # Pods for bytedesk-oc
  pod 'AFNetworking', '~> 4.0.1'
  pod 'Protobuf', '~> 3.21.11'

  target 'bytedesk-ocTests' do
    # Pods for testing
  end

end

target 'example' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  project 'example/example.xcodeproj'

  # Pods for example
  pod 'AFNetworking', '~> 4.0.1'
  pod 'Protobuf', '~> 3.21.11'

  target 'exampleTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'exampleUITests' do
    # Pods for testing
  end

end

#仅支持ios13以上
post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
        end
    end
end
