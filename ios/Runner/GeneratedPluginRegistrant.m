//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<flutter_dynamic_icon/FLTDynamicIconPlugin.h>)
#import <flutter_dynamic_icon/FLTDynamicIconPlugin.h>
#else
@import flutter_dynamic_icon;
#endif

#if __has_include(<flutter_image_compress_common/ImageCompressPlugin.h>)
#import <flutter_image_compress_common/ImageCompressPlugin.h>
#else
@import flutter_image_compress_common;
#endif

#if __has_include(<path_provider_foundation/PathProviderPlugin.h>)
#import <path_provider_foundation/PathProviderPlugin.h>
#else
@import path_provider_foundation;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTDynamicIconPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTDynamicIconPlugin"]];
  [ImageCompressPlugin registerWithRegistrar:[registry registrarForPlugin:@"ImageCompressPlugin"]];
  [PathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"PathProviderPlugin"]];
}

@end
