//
//  ViewController.m
//  TestTemplateJS-Objc
//
//  Created by zhsoft88 on 2017/1/9.
//  Copyright © 2017年 zhuatang. All rights reserved.
//

#import "ViewController.h"
#import "ZHTHelperImpl.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *resultTextView;

@property (nonatomic) NSString* templateJS;
@property (nonatomic) NSString* dataJSON;

@end

@implementation ViewController

- (NSString *)templateJS {
  if (_templateJS == nil) {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"template-1.0.min" ofType:@"js"];
    _templateJS = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
  }
  
  return _templateJS;
}

- (NSString *)dataJSON {
  if (_dataJSON == nil) {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"test-template-modal" ofType:@"json"];
    NSData* data = [NSData dataWithContentsOfFile:path];
    id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    // transform from human readable json
    NSData* output = [NSJSONSerialization dataWithJSONObject:object options:0 error:nil];
    _dataJSON = [[NSString alloc] initWithData:output encoding:NSUTF8StringEncoding];
  }
  
  return _dataJSON;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  JSContext* context = [JSContext new];
  [context evaluateScript:self.templateJS];
  context[@"helper"] = [ZHTHelperImpl new];
  NSString* script = [NSString stringWithFormat:@"var source = helper.getTemplateSourceById('test-template'); var tmpl = new Template(source); var data = %@; tmpl.render(data)", self.dataJSON];
  NSString* result = [[context evaluateScript:script] toString];
  self.resultTextView.text = result;
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
