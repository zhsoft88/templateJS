//
//  ZHTHelperExport.swift
//  TestTemplateJS-Swift
//
//  Created by zhsoft88 on 2017/1/14.
//  Copyright © 2017年 zhuatang. All rights reserved.
//

import Foundation
import JavaScriptCore

@objc protocol ZHTHelperExport : JSExport {

  func getTemplateSourceById(_ id: String) -> String
  
}
