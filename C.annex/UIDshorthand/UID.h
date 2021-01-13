//
//  UID.h
//  httpdicom
//
//  Created by jacquesfauquex on 20180412.
//  Copyright © 2018 opendicom.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UID : NSObject

+(NSData*)latin1squeezeofuids:(NSArray*)uidstrings;
+(NSString*)stringsqueezeofuids:(NSArray*)uidstrings;

+(NSArray*)uidsexpandedfromlatin1:(NSData*)latin1; //used with latin1 db query responses
+(NSArray*)uidsexpandedfromstring:(NSString*)string;//used with utf-8 json containers
@end
