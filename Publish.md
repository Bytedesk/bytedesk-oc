# 发布流程

- 注册：arch -x86_64 pod trunk register 270580156@qq.com jackning
- 查看个人信息：pod trunk me
- 创建pod初始化文件：pod spec create bytedesk-oc

- 替换更新文件
- 提交GitHub
- 打标签，并提交
- arch -x86_64 pod spec lint bytedesk-core.podspec --verbose
- arch -x86_64 pod trunk push bytedesk-core.podspec --verbose

## 发布到 Cocoapod 流程

## 支持 Carthage 流程

## 支持 Swift Package Manager (SPM) 流程
