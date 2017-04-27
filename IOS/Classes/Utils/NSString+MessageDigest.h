//
//  NSString+MessageDigest.h
//  flipclass
//
//  Created by aaron on 15/8/3.
//  Copyright (c) 2015年 whaty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MessageDigest)
- (NSString *)md2;

- (NSString *)md4;

- (NSString *)md5;

- (NSString *)sha1;

- (NSString *)sha224;

- (NSString *)sha256;

- (NSString *)sha384;

- (NSString *)sha512;
@end
