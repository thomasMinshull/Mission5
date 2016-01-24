//
//  MainViewController.m
//  Mission5
//
//  Created by thomas minshull on 2016-01-24.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController (){
    FBSDKLoginButton *logoutButton;
}
@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    logoutButton = [[FBSDKLoginButton alloc]init];
    logoutButton.center = self.view.center;
    [self.view addSubview:logoutButton];
    
    
    //getFacebook info
    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
         if (!error) {
             NSLog(@"fetched user:%@", result);
             if (result != nil) {
//                 if ([result isKindOfClass:[NSDictionary class]]) {
//                     NSLog(@"result is a dictionary!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//                 } else {
//                     NSLog(@"result is NOT a dictionary!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//                 }
//                 NSLog(@"result[id]: %@", [result objectForKey:@"id"]);
//                 if ([[result objectForKey:@"id"] isKindOfClass:[NSString class]]) {
//                     NSLog(@"Dictionary returns a string");
//                 }
                 NSString *graphPath;
                 graphPath = [@"/" stringByAppendingString:[result objectForKey:@"id"]];
                 graphPath = [graphPath stringByAppendingString: @"/picture"];
                 
                 NSDictionary *params = @{
                                          @"height" : [NSNumber numberWithInt:1000],
                                          @"width" : [NSNumber numberWithInt:1000],
                                          @"type"  : @"large",
                                          @"redirect" : @"false"
                                          };
                 
                 FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                               initWithGraphPath:graphPath
                                               parameters:params
                                               HTTPMethod:@"GET"];
                 [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                                       id result,
                                                       NSError *error) {
                     if (!error) {
                         NSLog(@"Result Containing URL: %@",result );
                         
                         
                     }
                 }];

                 
             }
         }
     }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (![FBSDKAccessToken currentAccessToken]) {
        [self performSegueWithIdentifier:@"unwindMainToLogin" sender:self];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
