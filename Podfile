# Uncomment this line to define a global platform for your project

platform :ios, '9.0'

use_frameworks!
inhibit_all_warnings!

target 'InstaSwipe' do

pod 'InstagramKit', '~> 3.0'
pod 'Koloda', '~> 2.0.3'
pod 'NVActivityIndicatorView'

post_install do |installer|
	`find Pods -regex 'Pods/pop.*\\.h' -print0 | xargs -0 sed -i '' 's/\\(<\\)pop\\/\\(.*\\)\\(>\\)/\\"\\2\\"/'`
end

end

