# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def rxSwift
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
end

def uiKitLib
    pod 'UIKitLib'
end

target 'Navigation' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Navigation
  rxSwift
end

target 'FlowComponents' do
   use_frameworks!
   rxSwift
   uiKitLib
end
