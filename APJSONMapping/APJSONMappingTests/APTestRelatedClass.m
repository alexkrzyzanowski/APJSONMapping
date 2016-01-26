//
//  APTestRelatedClass.m
//  APObjectMapping
//
//  Created by Alex Krzyżanowski on 22.02.15.
//
//

#import "APTestRelatedClass.h"
#import "NSObject+APJSONMapping.h"


@implementation APTestRelatedClass

+ (NSMutableDictionary *)ap_objectMapping {
  NSMutableDictionary * mapping = [super ap_objectMapping];
  if (mapping) {
    NSDictionary * objectMapping = @{ @"anyValue": @"any_value" };
    [mapping addEntriesFromDictionary:objectMapping];
  }
  return mapping;
}

@end
