#ifndef UWCore_h
#define UWCore_h

@interface UWCore : NSObject

- (nullable instancetype)initWithPublicApiKey:(nonnull NSString *)key
                             options:(nullable NSDictionary *)opts
                               error:(NSError *_Nullable *_Nonnull)error;

- (void)assessUser:(NSData * _Nonnull)userinfo
               did:(int)eventtype
          callback:(nonnull void (^)(NSData * _Nonnull))callback
           failure:(nonnull void (^)(NSError * _Nonnull))failure;

- (void)trackUser:(NSData * _Nonnull)userinfo
              did:(int)eventtype
         callback:(nonnull void (^)(NSData * _Nonnull))callback
          failure:(nonnull void (^)(NSError * _Nonnull))failure;

@end

#endif /* UWCore_h */
