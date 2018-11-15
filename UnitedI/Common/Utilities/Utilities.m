//
//  Utils.m
//  Korte
//
//  Created by Peace on 9/21/18.
//  Copyright © 2018 Peace. All rights reserved.
//
#import "Utilities.h"

static Utilities *sharedMyManager = nil;

@implementation Utilities
@synthesize indexImage;
//@synthesize profilePath;
#pragma mark Singleton Methods
+ (id)sharedUtilities {
    static Utilities *sharedUtilities = nil;
    @synchronized(self) {
        if (sharedUtilities == nil)
            sharedUtilities = [[self alloc] init];
            
    }
    return sharedUtilities;
}
- (id)init {
    if (self = [super init]) {
        indexImage = 0;   
//        profilePath = [[PDKeychainBindings sharedKeychainBindings] objectForKey:@"images"]?[jsonParse([[PDKeychainBindings sharedKeychainBindings] objectForKey:@"images"]) mutableCopy][0]:[[NSBundle mainBundle] pathForResource:@"imagePlace" ofType:@"png" inDirectory:@"data"];
    }
    return self;
}
-(void) setIndexImageOfCell:(int)index{
    indexImage = index;
}
//-(void) setProfilePath:(NSString *) path{
//    profilePath = path;
//}
- (void)dealloc {
    // Should never be called, but just here for clarity really.
}
-(NSDictionary *)apiService:(NSDictionary *)parameters requestMethod:(requestMethodDefinition) method url:(NSString *)url{

    NSDictionary *headers = @{@"accept": @"application/json"};
    UNIHTTPJsonResponse *response;
    switch (method) {
        case Get:{
             response = [[UNIRest get:^(UNISimpleRequest *request) {
                [request setUrl:[BaseURI stringByAppendingString:url]];
                [request setHeaders:headers];
                [request setParameters:parameters];
            }] asJson];
            break;
        }
        case Post:{
            response = [[UNIRest post:^(UNISimpleRequest *request) {
                [request setUrl:[BaseURI stringByAppendingString:url]];
                [request setHeaders:headers];
                [request setParameters:parameters];
            }] asJson];
            break;
        }
        case Put:{
            response = [[UNIRest put:^(UNISimpleRequest *request) {
                [request setUrl:[BaseURI stringByAppendingString:url]];
                [request setHeaders:headers];
                [request setParameters:parameters];
            }] asJson];
            break;
        }
        case Delete:{
            response = [[UNIRest delete:^(UNISimpleRequest *request) {
                [request setUrl:[BaseURI stringByAppendingString:@"users"]];
                [request setHeaders:headers];
                [request setParameters:parameters];
            }] asJson];
            break;
        }
    }
    
    if(response){
        // This is the asyncronous callback block
        NSInteger code = response.code;
        if(code!=200) {
            NSLog(@"server error");
            alertCustom(SCLAlertViewStyleError, @"Server error");
            return nil;
        }
        
       UNIJsonNode *body = response.body;
       if(![body.object objectForKey:@"err"]){
            return body.object;
        } else {
            NSLog(@"error  %@", [body.object objectForKey:@"err"]);
            alertCustom(SCLAlertViewStyleError,[body.object objectForKey:@"err"]);
            return nil;
        }
    }
    return nil;    
}
@end
