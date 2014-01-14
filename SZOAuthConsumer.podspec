Pod::Spec.new do |s|
  s.name         = "SZOAuthConsumer"
  s.version      = "0.0.1"
  s.summary      = "A short description of SZOAuthConsumer."
  s.description  = "A short description of SZOAuthConsumer."
  s.homepage     = "http://EXAMPLE/SZOAuthConsumer"

  s.license      = 'MIT'
  # s.license    = { :type => 'MIT', :file => 'FILE_LICENSE' }

  s.author       = { "Sergey Popenko" => "SergeyPopenko@gmail.com" }
  s.source       = { :path => '' }

  s.source_files  = '**/*.{h,m,c}'
  s.exclude_files = 'test', 'OAToken_KeychainExtensions.{h,m}'

  s.header_dir   =  'OAuthConsumer'

  # s.public_header_files = 'Classes/**/*.h'

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

  # s.framework  = 'SomeFramework'
  s.frameworks = 'Security'

  # s.library   = 'iconv'
  # s.libraries = 'iconv', 'xml2'

  s.requires_arc = false

  s.prefix_header_file = 'OAuthConsumer iOS/OAuthConsumer iOS-Prefix.pch'

  # s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }
  # s.dependency 'JSONKit', '~> 1.4'

end
