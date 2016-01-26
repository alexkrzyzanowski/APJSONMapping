# APObjectMapping

[![Join the chat at https://gitter.im/alexkrzyzanowski/APJSONMapping](https://badges.gitter.im/alexkrzyzanowski/APJSONMapping.svg)](https://gitter.im/alexkrzyzanowski/APJSONMapping?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Build Status](https://travis-ci.org/alexkrzyzanowski/APJSONMapping.svg?branch=master)](https://travis-ci.org/alexkrzyzanowski/APJSONMapping)
[![CocoaPods](https://img.shields.io/cocoapods/v/APJSONMapping.svg)](https://cocoapods.org/pods/APJSONMapping)
[![CocoaPods](https://img.shields.io/cocoapods/metrics/doc-percent/APJSONMapping.svg)](https://cocoapods.org/pods/APJSONMapping)
[![codecov.io](https://codecov.io/github/alexkrzyzanowski/APJSONMapping/coverage.svg?branch=develop)](https://codecov.io/github/alexkrzyzanowski/APJSONMapping?branch=develop)

Objective-C class extension which allows you to easily map your objects to dictionaries and parse your objects from dictionaries.

## Installation

The easiest way to get `APJSONMapping` is to install it via CocoaPods:

```Podfile
target 'MyApp' do
  pod 'APJSONMapping', '~> 1.0'
end
```

When the framework installed, just import it to add appropriate functionality to your existing classes:

```objective-c
@import APJSONMapping;

@interface MyCustomClass : NSObject
// ...
@end
```

## Usage Example

To make your object able to be mapped to (and parsed from) dictionary, you have to describe it's mapping rules:

```objective-c
@import Foundation;
@import APJSONMapping;

//
// Here is interface
@interface MyCustomClass : NSObject

@property (nonatomic, strong) NSNumber *someNumber;
@property (nonatomic, strong) NSString *someString;

+ (Class)someArrayOfRelatingObjectsType;
@end

//
// And here is implementation
@implementation MyCustomClass

+ (NSMutableDictionary *)ap_objectMapping {
  NSMutableDictionary * mapping = [super ap_objectMapping];
  if (mapping) {
    NSDictionary * objectMapping = @{ @"someNumber": @"some_number",
                                      @"someString": @"some_string"};
    [mapping addEntriesFromDictionary:objectMapping];
  }
  return mapping;
}

@end
```

Since you've described the mapping, you can map your object to dictionary:

```objective-c
MyCustomClass * myObj = [[MyCustomClass alloc] init];
myObj.someNumber = @1;
myObj.someString = @"some string";
NSDictionary * myDict = [myObj mapToDictionary];
```

You also can parse your object from dictionaries following the same way:

```objective-c
NSDictionary * myDict = @{ @"some_number": @123,
                           @"some_string": @"some_string" };
MyCustomClass * myObj = [[MyCustomClass alloc] initWithDictionary:myDict];
```

## Code Coverage

![codecov.io](https://codecov.io/github/alexkrzyzanowski/APJSONMapping/branch.svg?branch=develop)
