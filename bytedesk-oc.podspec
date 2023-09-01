
Pod::Spec.new do |s|

  s.name         = "bytedesk-oc"
  s.version      = "3.0.0"
  s.summary      = "bytedesk.com kefu lib."

  s.description  = <<-DESC
                    Online chat Lib for ios, Helpdesk system
                   DESC

  s.homepage     = "https://www.bytedesk.com"
  s.license      = "MIT"
  s.authors      = { "jackning" => "270580156@qq.com" }
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/Bytedesk/bytedesk-oc.git", :tag => "#{s.version}" }
  s.requires_arc = true

  s.dependency "AFNetworking"
  s.swift_version = "5.0"

end
