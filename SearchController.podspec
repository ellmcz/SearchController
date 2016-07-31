Pod::Spec.new do |s|
  s.name         = "SearchController"
  s.version      = "1.0.0"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.summary      = "中文搜索框架"
  s.homepage     = "https://github.com/ellmcz/SearchController"
  s.authors      = { "ellmcz" => "wqbs007@163.com" }
  s.source       = { :git => "https://github.com/ellmcz/SearchController.git", :tag => "1.0.0" }
  s.platform     = :ios,'8.0'
  s.requires_arc = true
  s.source_files = 'SearchController.h'
  s.framework="UIKit"
end