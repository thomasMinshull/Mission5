//
//  ViewController.m
//  Mission5
//
//  Created by thomas minshull on 2016-01-16.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import "LogInViewController.h"
#import "User.h"


@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Facebook Login
    self.loginButton = [[FBSDKLoginButton alloc]init];
    self.loginButton.center = self.view.center;
    [self.view addSubview:self.loginButton];
    self.loginButton.readPermissions =
    @[@"public_profile", @"email"];
    

}

- (void)viewDidAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    if ([FBSDKAccessToken currentAccessToken]) {
        [self performSegueWithIdentifier:@"sequeLoginToMain" sender:self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
}

@end
