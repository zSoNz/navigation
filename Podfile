# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def rxSwift
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
end

target 'Navigation' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Navigation
  rxSwift
end

target 'NavigationTests' do
  use_frameworks!

  pod 'Quick', '~> 2.1.0'
  pod 'Nimble', '~> 8.0.1'
  pod 'RxNimble', '~> 4.6.0', subspecs: ['RxBlocking', 'RxTest']
end

target 'FlowComponents' do
   use_frameworks!
   rxSwift
   pod 'Sourcery'
end

target 'Resources' do
  use_frameworks!

  pod 'SwiftGen'
end
