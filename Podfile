# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end

target 'Food Delivery' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  pod "Firebase/Auth"
  pod "Firebase/Firestore"
  pod "Firebase/Database"
  pod "FirebaseFirestoreSwift"

  pod "JGProgressHUD"

  target 'Food DeliveryTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'Food DeliveryUITests' do
    # Pods for testing
  end

end
