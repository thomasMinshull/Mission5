//
//  MainViewController.m
//  Mission5
//
//  Created by thomas minshull on 2016-01-24.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import "MainViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "PersistanceManager.h"

@interface MainViewController (){
    PersistanceManager *persistanceManager;
    
}
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UIImageView *profilePic;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.logoutButton addTarget:self action:@selector(LogoutButtonTouched) forControlEvents:UIControlEventTouchUpInside];
    persistanceManager = [[PersistanceManager alloc]init];
    
}

-(void)viewDidAppear:(BOOL)animated {
    NSLog(@"viewDidAppear for Main View ");
    if (![FBSDKAccessToken currentAccessToken])  {
        NSLog(@"Not Logged in");
        [self performSegueWithIdentifier:@"segueMainToLogin" sender:self];
    } else {
        NSString *userName = [persistanceManager getUserName];
        if (userName != nil) {
            [self.label setText:userName];
        } else {
            NSLog(@"userName == nil");
        }
        
        NSString *userImageUrl = [persistanceManager getUserImageAsString];
        if (userImageUrl != nil) {
            [self.profilePic sd_setImageWithURL:[NSURL URLWithString: userImageUrl]];
        } else {
            NSLog(@"userImageURL == nil");
        }
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)LogoutButtonTouched {
    [[FBSDKLoginManager new] logOut];
    [self performSegueWithIdentifier:@"segueMainToLogin" sender:self];
}

-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
}

@end
