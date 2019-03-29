Pod::Spec.new do |s|
  s.name = "ReusableExtension"
  s.version = "1.0.0"
  s.summary = "Third-party module with Reusable."

  s.homepage = "https://github.com/nuomi1/ReusableExtension"
  s.license = {:type => "MIT", :file => "LICENSE"}
  s.author = {"nuomi1" => "nuomi1@qq.com"}
  s.source = {:git => "https://github.com/nuomi1/ReusableExtension.git", :tag => s.version}

  s.ios.deployment_target = "8.0"

  s.swift_version = "4.2"

  source_files_prefix = "ReusableExtension/Classes/"
  source_file_utils = source_files_prefix + "Utils.swift"

  s.dependency "Reusable"

  s.source_files = [
    source_file_utils,
  ]

  s.subspec "FDTemplateLayoutCell" do |ss|
    ss.dependency "UITableView+FDTemplateLayoutCell"
    ss.source_files = [
      source_file_utils,
      source_files_prefix + "FDTemplateLayoutCell+Reusable.swift",
    ]
  end

  s.subspec "FSPagerView" do |ss|
    ss.dependency "FSPagerView"
    ss.source_files = [
      source_file_utils,
      source_files_prefix + "FSPagerView+Reusable.swift",
    ]
  end

  s.subspec "HJDanmaku" do |ss|
    ss.dependency "HJDanmaku"
    ss.source_files = [
      source_file_utils,
      source_files_prefix + "HJDanmaku+Reusable.swift",
    ]
  end

  s.subspec "RxCocoa" do |ss|
    ss.dependency "RxCocoa"
    ss.source_files = [
      source_files_prefix + "RxCocoa+Reusable.swift",
    ]
  end

  s.subspec "SpreadsheetView" do |ss|
    ss.dependency "SpreadsheetView"
    ss.source_files = [
      source_file_utils,
      source_files_prefix + "SpreadsheetView+Reusable.swift",
    ]
  end
end
