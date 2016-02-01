//
//  FaceBookManager.h
//  Mission5
//
//  Created by thomas minshull on 2016-01-25.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FaceBookManager : NSObject
-(void)saveFBUserDetailsToDeviceWithCompletion:(void(^)())completionBlock;
@end
