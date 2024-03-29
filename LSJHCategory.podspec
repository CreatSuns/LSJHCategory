#
# Be sure to run `pod lib lint LSJHCategory.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LSJHCategory'
  s.version          = '0.2.3'
  s.summary          = 'A short description of LSJHCategory.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/CreatSuns/LSJHCategory'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '1228506851@qq.com' => '1228506851@qq.com' }
  s.source           = { :git => 'https://github.com/CreatSuns/LSJHCategory.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'
  s.source_files = 'LSJHCategory/Classes/**/*'
  
  s.resource_bundles = {
      'LSJHCategory' => ['LSJHCategory/Assets/*.xcassets'],
    }

  #  s.public_header_files = 'LLCategory/Classes/LLCategory.h'
  s.frameworks = 'UIKit'
  s.prefix_header_file = 'LSJHCategory/Classes/LLGlobal.pch'

  s.dependency 'Masonry', '1.1.0'
  s.dependency 'SVGKit', '2.1.1'
  s.dependency 'YYImage', '1.0.4'
end
