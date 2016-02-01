//
//  ViewController.m
//  Mission5
//
//  Created by thomas minshull on 2016-01-16.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import "LogInViewController.h"
#import "MainViewController.h"
#import "FaceBookManager.h"


@interface LogInViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *smartAssImageView;
@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Facebook Login
    [self.loginButton addTarget:self action:@selector(LoginButtonClicked) forControlEvents:UIControlEventTouchUpInside];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    if ([FBSDKAccessToken currentAccessToken]) {
        NSLog(@"logged in ");
        [self unwind];
    } else {
        NSLog(@"Not Logged in");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)LoginButtonClicked {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions:@[@"public_profile"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            NSLog(@"Login Error: %@", error);
        } else if (result.isCancelled) {
            NSLog(@"Login Cancelled");
        } else {
            NSLog(@"Login successful");
            FaceBookManager *fbManager = [[FaceBookManager alloc]init];
            [fbManager saveFBUserDetailsToDeviceWithCompletion:^{
            }];
        }
    }];
}

 #pragma mark - Navigation

-(void)unwind{
    [self performSegueWithIdentifier:@"unwindLoginToMain" sender:self];
}

@end
