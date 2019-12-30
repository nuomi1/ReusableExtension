Pod::Spec.new do |s|
  s.name = "ReusableExtension"
  s.version = "1.4.0"
  s.summary = "Third-party module with Reusable."

  s.homepage = "https://github.com/nuomi1/ReusableExtension"
  s.license = {:type => "MIT", :file => "LICENSE"}
  s.author = {"nuomi1" => "nuomi1@qq.com"}
  s.source = {:git => "https://github.com/nuomi1/ReusableExtension.git", :tag => s.version}

  s.ios.deployment_target = "9.0"

  s.swift_version = "5.0"

  s.dependency "Reusable"

  s.subspec "FDTemplateLayoutCell" do |ss|
    ss.dependency "UITableView+FDTemplateLayoutCell"
    ss.source_files = "ReusableExtension/Classes/FDTemplateLayoutCell+Reusable.swift"
  end

  s.subspec "FSCalendar" do |ss|
    ss.dependency "FSCalendar"
    ss.source_files = "ReusableExtension/Classes/FSCalendar+Reusable.swift"
  end

  s.subspec "FSPagerView" do |ss|
    ss.dependency "FSPagerView"
    ss.source_files = "ReusableExtension/Classes/FSPagerView+Reusable.swift"
  end

  s.subspec "G3GridView" do |ss|
    ss.dependency "G3GridView"
    ss.source_files = "ReusableExtension/Classes/G3GridView+Reusable.swift"
  end

  s.subspec "HJDanmaku" do |ss|
    ss.dependency "HJDanmaku"
    ss.source_files = "ReusableExtension/Classes/HJDanmaku+Reusable.swift"
  end

  s.subspec "RxCocoa" do |ss|
    ss.dependency "RxCocoa"
    ss.source_files = "ReusableExtension/Classes/RxCocoa+Reusable.swift"
  end

  s.subspec "SpreadsheetView" do |ss|
    ss.dependency "SpreadsheetView"
    ss.source_files = "ReusableExtension/Classes/SpreadsheetView+Reusable.swift"
  end

  s.subspec "VerticalCardSwiper" do |ss|
    ss.dependency "VerticalCardSwiper"
    ss.source_files = "ReusableExtension/Classes/VerticalCardSwiper+Reusable.swift"
  end
end
