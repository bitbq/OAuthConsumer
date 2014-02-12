Pod::Spec.new do |s|
  s.name               = "OAuthConsumer"
  s.version            = "0.0.2"
  s.summary            = "OAuthConsumer."
  s.description        = "OAuthConsumer with changes for socialize-sdk-ios."
  s.homepage           = "https://github.com/socialize/OAuthConsumer"
  s.license            = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "David Jedeikin" => "djedeikin@sharethis.com" }
  s.source             = { :git => "https://github.com/socialize/OAuthConsumer.git", :tag => "0.0.2" }
  s.source_files       = '**/*.{h,m,c}'
  s.exclude_files      = 'test', 'OAToken_KeychainExtensions.{h,m}'
  s.header_dir         = 'OAuthConsumer'
  s.frameworks         = 'Security'
  s.requires_arc       = false
  s.prefix_header_file = 'OAuthConsumer iOS/OAuthConsumer iOS-Prefix.pch'

end
