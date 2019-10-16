Pod::Spec.new do |spec|
  spec.name         = "BuglyHotfixDynamic"
  spec.version      = "0.0.2"
  spec.summary      = "BuglyHotfixDynamic for components"
  spec.description  = <<-DESC
                      BuglyHotfixDynamic for components
                      DESC
  spec.homepage     = "https://github.com/bbrichard/BuglyHotfixDynamic"
  spec.license      = "MIT. Copyright (c) 2019年 BB. All rights reserved."
  spec.author       = { "Richard" => "Richard@seektopser.com" }
  spec.platform     = :ios, "9.0"
  spec.ios.deployment_target = "9.0"

  spec.source = { :http  => 'https://raw.githubusercontent.com/bbrichard/BuglyHotfixDynamic/master/Products/BuglyHotfixDynamic.framework001.zip' }
  spec.frameworks = 'SystemConfiguration', 'Security'''
  
  spec.default_subspec = 'zip'
  spec.subspec 'zip' do |zip|
      puts '-------------------------------------------------------------------'
      puts 'Notice: BuglyHotfixDynamic is zip now'
      puts '-------------------------------------------------------------------'
      zip.ios.vendored_frameworks = '*.framework'
  end
  
  spec.prepare_command     = <<-EOF
  touch  BuglyHotfixDynamic.framework/Modules/module.modulemap
  cat <<-EOF > BuglyHotfixDynamic.framework/Modules/module.modulemap
  framework module BuglyHotfixDynamic {
      header "Bugly.h"
      header "BuglyConfig.h"
      header "BuglyLog.h"
      header "BuglyMender.h"
  }
  \EOF
  EOF
end
