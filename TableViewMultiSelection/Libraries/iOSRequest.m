#import "iOSRequest.h"
@implementation iOSRequest
+(void)requestPath:(NSString *)path onCompletion:(RequestCompletionHandler)complete
{
    // Send Request
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_8_3) {
        NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithURL:[NSURL URLWithString:path]
                completionHandler:^(NSData *data,
                                    NSURLResponse *response,
                                    NSError *error) {
                    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                    if (complete) complete(result,error);
                    
                }] resume];
    }
    else
    {
        // Background Queue
        NSOperationQueue *backgroundQueue = [[NSOperationQueue alloc] init];
        
        // URL Request
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:path]
                                                      cachePolicy:0
                                                  timeoutInterval:10];
        [NSURLConnection sendAsynchronousRequest:request
                                       queue:backgroundQueue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
                               NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                               if (complete) complete(result,error);
                           }];
    }
}
+(void)search:(NSString *)keyword
 onCompletion:(RequestDictionaryCompletionHandler)complete
{
    NSString *fullPath  = [[NSString stringWithFormat:@"https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=20&q=%@&type=video&key=AIzaSyDQ9JeT1h34lbol60ZKjUM9M-WRU43xYW0",keyword] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [iOSRequest requestPath:fullPath onCompletion:^(NSString *result, NSError *error){
        if (error || [result isEqualToString:@""]) {
            if (complete) complete(nil);
        } else {
            NSData *data = [result dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *dataJson = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            if (complete) complete(dataJson);
        }
    }];
    
}
@end
