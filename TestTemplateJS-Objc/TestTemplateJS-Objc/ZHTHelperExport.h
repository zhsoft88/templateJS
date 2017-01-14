//
//  ZHTHelperExport.h
//  TestTemplateJS-Objc
//
//  Created by zhsoft88 on 2017/1/14.
//  Copyright © 2017年 zhuatang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol ZHTHelperExport <JSExport>

- (NSString*)getTemplateSourceById:(NSString*)id;

@end
