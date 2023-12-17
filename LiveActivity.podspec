Pod::Spec.new do |s|
  s.name             = 'LiveActivity'
  s.version          = '1.0.1'
  s.summary          = 'iOS LiveActivity Framework.'


  s.description      = <<-DESC
'An iOS framework developed to add Live Activity widget using Cocopods to exisiting Cordova Ionic Apps'
                       DESC

  s.homepage         = 'https://github.com/demonguru18/LiveActivity'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Techhowdy' => 'thetechhowdy@tapmango.com' }
  s.source           = { :git => 'https://github.com/demonguru18/LiveActivity.git', :tag => s.version.to_s }

  s.ios.deployment_target = '16.4'
  s.source_files = 'Source/**/*.swift'
  s.swift_version = '5.0'
  # s.resource_bundles = {
  #   'LiveActivity' => ['LiveActivity/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'SwiftUI', 'WidgetKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
