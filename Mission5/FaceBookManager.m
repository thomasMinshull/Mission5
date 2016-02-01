//
//  FaceBookManager.m
//  Mission5
//
//  Created by thomas minshull on 2016-01-25.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import "FaceBookManager.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "PersistanceManager.h"

@interface FaceBookManager () {
    FBSDKGraphRequest *graphRequest;
    PersistanceManager *persistanceManager;
}

@end

@implementation FaceBookManager

-(void)saveFBUserDetailsToDeviceWithCompletion:(void(^)())completionBlock {
    if (persistanceManager == nil) {
        persistanceManager = [[PersistanceManager alloc]init];
    }
    
    NSDictionary *parameters = @{@"fields": @"id, name, picture"};
    
    FBSDKGraphRequest *firstRequest = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me"
                                                                        parameters:parameters];
     [firstRequest startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
         if (!error) {
             NSLog(@"fetched results:%@", result);
             if (result != nil) {
                 
                 NSLog(@"results[name] = %@", [result objectForKey:@"name"]);
                 //save userName to device
                 [persistanceManager setUserName:[result objectForKey:@"name"]];

                 NSString *picturePath = [[[result objectForKey:@"picture"] objectForKey:@"data"] objectForKey: @"url"];
                 
                 NSLog(@"results picturePath = %@", picturePath);
                [persistanceManager setUserImage: picturePath];
             } else {
                 NSLog(@"results = nil");
             }
         }
     }];

    
}

@end
