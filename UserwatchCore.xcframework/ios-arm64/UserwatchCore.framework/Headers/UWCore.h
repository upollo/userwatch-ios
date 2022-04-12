#ifndef UWCore_h
#define UWCore_h

@interface UWCore : NSObject

- (nullable instancetype)initWithPublicApiKey:(nonnull NSString *)key
                             options:(nullable NSDictionary *)opts
                               error:(NSError *_Nullable *_Nonnull)error;

- (void)identifyForUid:(nullable NSString *)uid
                 email:(nullable NSString *)email
                 phone:(nullable NSString *)phone
              username:(nullable NSString *)username
                   did:(int)eventtype
              callback:(nonnull void (^)(NSData * _Nonnull))callback
               failure:(nonnull void (^)(NSError * _Nonnull))failure;

- (void)validateForUid:(nullable NSString *)uid
                 email:(nullable NSString *)email
                 phone:(nullable NSString *)phone
              username:(nullable NSString *)username
                   did:(int)eventtype
              callback:(nonnull void (^)(NSData * _Nonnull))callback
               failure:(nonnull void (^)(NSError * _Nonnull))failure;

@end

#endif /* UWCore_h */
