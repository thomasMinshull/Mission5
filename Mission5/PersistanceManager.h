//
//  PersistanceManager.h
//  Mission5
//
//  Created by thomas minshull on 2016-01-25.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersistanceManager : NSObject
-(NSString *)getUserImageAsString;
-(void)setUserImage:(NSString *)url;
-(NSString *)getUserName;
-(void)setUserName:(NSString *)name;

@end
