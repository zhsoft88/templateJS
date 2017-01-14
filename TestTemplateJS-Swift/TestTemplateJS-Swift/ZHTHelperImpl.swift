//
//  ZHTHelperImpl.swift
//  TestTemplateJS-Swift
//
//  Created by zhsoft88 on 2017/1/14.
//  Copyright © 2017年 zhuatang. All rights reserved.
//

import Foundation

class ZHTHelperImpl : NSObject, ZHTHelperExport {
  
  func getTemplateSourceById(_ id: String) -> String {
    if let path = Bundle.main.path(forResource: id, ofType: "tmpl"),
      let contents = try? String(contentsOfFile: path) {
      return contents
    }
    
    return ""
  }
  
}
