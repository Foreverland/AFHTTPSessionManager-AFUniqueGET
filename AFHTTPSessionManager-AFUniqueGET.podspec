Pod::Spec.new do |s|
s.name             = "AFHTTPSessionManager-AFUniqueGET"
s.version          = "0.1"
s.summary          = "Your GET request is in progress, better reuse it than creating a new one, right?"
s.description      = <<-DESC
This category of AFHTTPSessionManager adds the `uniqueGET` method, which is useful if you want to avoid getting multiple times at the same resource if the operation is still in progress.
DESC
s.homepage         = "https://github.com/NSElvis/AFHTTPSessionManager-AFUniqueGET"
s.license          = 'MIT'
s.author           = { "Elvis Nuñez" => "hello@nselvis.com" }
s.source           = { :git => "https://github.com/NSElvis/AFHTTPSessionManager-AFUniqueGET.git", :tag => s.version.to_s }
s.social_media_url = 'https://twitter.com/NSElvis'

s.platform     = :ios, '7.0'
s.requires_arc = true

s.source_files = 'Source/**/*'

s.dependency 'AFNetworking'
end
