//
//  ViewController.swift
//  TestTemplateJS-Swift
//
//  Created by zhsoft88 on 2017/1/9.
//  Copyright © 2017年 zhuatang. All rights reserved.
//

import UIKit
import JavaScriptCore

class ViewController: UIViewController {

  @IBOutlet weak var resultTextView: UITextView!
  
  var templateJS : String {
    if let path = Bundle.main.path(forResource: "template-1.0.min", ofType: "js"),
      let contents = try? String(contentsOfFile: path) {
      return contents
    }
    
    return ""
  }
  
  var dataJSON : String {
    if let path = Bundle.main.path(forResource: "test-template-modal", ofType: "json"),
      let contents = try? String(contentsOfFile: path),
      let data = contents.data(using: String.Encoding.utf8),
      let obj = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()),
      // transform from human readable json
      let output = try? JSONSerialization.data(withJSONObject: obj, options: JSONSerialization.WritingOptions()),
      let result = String(data: output, encoding: String.Encoding.utf8) {
      return result
    }
    
    return ""
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    if let context = JSContext() {
      context.evaluateScript(templateJS)
      context.setObject(ZHTHelperImpl(), forKeyedSubscript: "helper" as (NSCopying & NSObjectProtocol)!)
      let script = String(format: "var source = helper.getTemplateSourceById('test-template'); var tmpl = new Template(source); var data = %@; tmpl.render(data)", dataJSON)
      let result = context.evaluateScript(script).toString()
      resultTextView.text = result
    }
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

