Pod::Spec.new do |s|
s.name             = "AFHTTPSessionManager-AFUniqueGET"
s.version          = "0.5.1"
s.summary          = "Your GET request is in progress, better reuse it than create a new one, right?"
s.description      = <<-DESC
This category of AFHTTPSessionManager adds the `uniqueGET` method, which is useful if you want to avoid making multiple calls at the same resource if the operation is still in progress.

We achieve this by checking on-going operations before creating new ones.
DESC
s.homepage         = "https://github.com/3lvis/AFHTTPSessionManager-AFUniqueGET"
s.license          = 'MIT'
s.author           = { "Elvis Nuñez" => "elvisnunez@me.com" }
s.source           = { :git => "https://github.com/3lvis/AFHTTPSessionManager-AFUniqueGET.git", :tag => s.version.to_s }
s.social_media_url = 'https://twitter.com/3lvis'
s.platform     = :ios, '7.0'
s.requires_arc = true
s.source_files = 'Source/**/*'
s.dependency 'AFNetworking/NSURLSession'
end
