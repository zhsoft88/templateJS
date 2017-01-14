//
//  ZHTHelperImpl.m
//  TestTemplateJS-Objc
//
//  Created by zhsoft88 on 2017/1/14.
//  Copyright © 2017年 zhuatang. All rights reserved.
//

#import "ZHTHelperImpl.h"

@implementation ZHTHelperImpl

- (NSString*)getTemplateSourceById:(NSString*)id {
  NSString* path = [[NSBundle mainBundle] pathForResource:id ofType:@"tmpl"];
  NSString* source = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
  return source;
}

@end
