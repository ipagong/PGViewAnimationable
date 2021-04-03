#
# Be sure to run `pod lib lint PGViewAnimationable.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PGViewAnimationable'
  s.version          = '0.4.0'
  s.summary          = 'View Animation Protocol.'
  s.description      = 'You can make easier Custom Animation View with ViewAnimationable Protocol'
  s.homepage         = 'https://github.com/ipagong/PGViewAnimationable'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ipagong' => 'ipagong.dev@gmail.com' }
  s.source           = { :git => 'https://github.com/ipagong/PGViewAnimationable.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'PGViewAnimationable/Classes/**/*'

end
