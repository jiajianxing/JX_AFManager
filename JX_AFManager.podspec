#
# Be sure to run `pod lib lint JX_AFManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JX_AFManager'
  s.version          = '0.1'
  s.summary          = 'AFNetWorking的进一步封装'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
 对AFNetWorking的进一步封装,宏定义快速解析请求数据
                       DESC

  s.homepage         = 'https://github.com/jiajianxing/JX_AFManager'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jiajianxing' => 'jiajianxinghh@163.com' }
  s.source           = { :git => 'https://github.com/jiajianxing/JX_AFManager.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'JX_AFManager/**'
  
  # s.resource_bundles = {
  #   'JX_AFManager' => ['JX_AFManager/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
    s.dependency 'AFNetworking'

end
