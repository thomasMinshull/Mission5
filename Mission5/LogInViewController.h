//
//  ViewController.h
//  Mission5
//
//  Created by thomas minshull on 2016-01-16.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface LogInViewController : UIViewController
@property (strong, nonatomic) IBOutlet FBSDKLoginButton *loginButton;

@end

