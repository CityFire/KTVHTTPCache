//
//  KTVHTTPCacheImp.m
//  KTVHTTPCache
//
//  Created by Single on 2017/8/13.
//  Copyright © 2017年 Single. All rights reserved.
//

#import "KTVHTTPCacheImp.h"
#import "KTVHCHTTPServer.h"
#import "KTVHCDataStorage.h"

@implementation KTVHTTPCache


#pragma mark - HTTP Server

+ (void)proxyStart:(NSError * __autoreleasing *)error
{
    [[KTVHCHTTPServer httpServer] start:error];
}

+ (void)proxyStop
{
    [[KTVHCHTTPServer httpServer] stop];
}

+ (NSString *)proxyURLStringWithOriginalURLString:(NSString *)urlString
{
    return [[KTVHCHTTPServer httpServer] URLStringWithOriginalURLString:urlString];
}


#pragma mark - Data Storage

+ (long long)cacheTotalCacheLength
{
    return [[KTVHCDataStorage manager] totalCacheLength];
}

+ (KTVHCDataReader *)cacheConcurrentReaderWithRequest:(KTVHCDataRequest *)request
{
    return [[KTVHCDataStorage manager] concurrentReaderWithRequest:request];
}

+ (KTVHCDataReader *)cacheSerialReaderWithRequest:(KTVHCDataRequest *)request
{
    return [[KTVHCDataStorage manager] serialReaderWithRequest:request];
}

+ (void)cacheSerialReaderWithRequest:(KTVHCDataRequest *)request
                   completionHandler:(void(^)(KTVHCDataReader *))completionHandler
{
    [[KTVHCDataStorage manager] serialReaderWithRequest:request
                                      completionHandler:completionHandler];
}

+ (NSArray <KTVHCDataCacheItem *> *)cacheFetchAllCacheItem
{
    return [[KTVHCDataStorage manager] fetchAllCacheItem];
}

+ (KTVHCDataCacheItem *)cacheFetchCacheItemWithURLString:(NSString *)URLString
{
    return [[KTVHCDataStorage manager] fetchCacheItemWithURLString:URLString];
}

+ (void)cacheCleanAllCacheItem
{
    [[KTVHCDataStorage manager] cleanAllCacheItem];
}

+ (void)cacheCleanCacheItemWithURLString:(NSString *)URLString
{
    [[KTVHCDataStorage manager] cleanCacheItemWithURLString:URLString];
}


@end