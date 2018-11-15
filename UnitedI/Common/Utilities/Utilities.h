//
//  Utils.h
//  Korte
//
//  Created by Peace on 9/21/18.
//  Copyright © 2018 Peace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utiliti2es.h"
#import "PDKeychainBindings.h"
@interface Utilities : NSObject{
    int indexImage;    
}
@property(assign, nonatomic) int indexImage;

//@property(assign, nonatomic) NSString *profilePath;
+ (id)sharedUtilities;
-(void) setIndexImageOfCell:(int)index;
-(NSDictionary *)apiService:(NSDictionary *)parameters requestMethod:(requestMethodDefinition) method url:(NSString *)url;
//-(void) setProfilePath:(NSString *) path;
@end
