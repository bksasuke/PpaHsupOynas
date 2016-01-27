
#import <Foundation/Foundation.h>
typedef void(^RequestCompletionHandler)(NSString*,NSError*);
typedef void(^RequestDictionaryCompletionHandler)(NSDictionary*);

@interface iOSRequest : NSObject

+(void)requestPath:(NSString *)path
      onCompletion:(RequestCompletionHandler)complete;
+(void)search:(NSString *)keyword
            onCompletion:(RequestDictionaryCompletionHandler)complete;
@end
