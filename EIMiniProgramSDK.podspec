#
# Be sure to run `pod lib lint EIMiniProgramSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EIMiniProgramSDK'
  s.version          = '1.0.0'
  s.summary          = '基于UniApp的小程序SDK实现快速集成方式'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  官网集成方式过于复杂，目前通过Pod方式集成简单方便
                       DESC

  s.homepage         = 'https://github.com/xiayy0328/EIMiniProgramSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'oauth2' => 'xyy_ios@163.com' }
  s.source           = { :git => 'https://github.com/xiayy0328/EIMiniProgramSDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'
  # pods工程配置项
  s.pod_target_xcconfig = {
     'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
  }
  # 主工程配置项
  s.user_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
  }

  s.default_subspec = 'Core'
  s.swift_versions = '5.0'
  
  s.subspec 'Core' do |core|
    core.libraries =  ['c++', 'iconv']
    core.source_files = 'EIMiniProgramSDK/Core/**/*.h'
    core.vendored_libraries =  "EIMiniProgramSDK/Core/**/*.a"
    core.vendored_frameworks = "EIMiniProgramSDK/Core/**/*.framework"
    core.resources = ['EIMiniProgramSDK/Core/Resources/PandoraApi.bundle', 'EIMiniProgramSDK/Core/Resources/*.js', 'EIMiniProgramSDK/Core/Resources/*.ttf']
    core.frameworks = "JavaScriptCore", "CoreMedia", "MediaPlayer", "AVFoundation", "AVKit", "GLKit", "OpenGLES", "CoreText", "QuartzCore", "CoreGraphics", "QuickLook", "CoreTelephony", "AssetsLibrary", "CoreLocation", "AddressBook"
  end
  
end
