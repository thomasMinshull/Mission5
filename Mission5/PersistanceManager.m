//
//  PersistanceManager.m
//  Mission5
//
//  Created by thomas minshull on 2016-01-25.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import "PersistanceManager.h"
#import "AppDelegate.h"
#import "User+CoreDataProperties.h"
#import <CoreData/CoreData.h> // not sure if I need this
#import "User+CoreDataProperties.h"



@implementation PersistanceManager

-(void)setUserImage:(NSString *)url{
    NSManagedObjectContext *context = [self getContext];
    User *user = [self getUser];
    
    // get user if there isn't a user stored on divice and add to context
    if (user == nil) {
        user = (User *)[NSEntityDescription insertNewObjectForEntityForName:@"User"
                                             inManagedObjectContext:context];
    }
    
    user.userProfilePickURL = url;
    
    //save changes to disk
    [self saveWithContext:context];
    
}

-(NSString *)getUserImageAsString{
    User *user = [self getUser];
    if (user != nil) {
        return user.userProfilePickURL;
    } else {
        return nil;
    }
}

-(void)setUserName:(NSString *)name{
    NSManagedObjectContext *context = [self getContext];
    User *user = [self getUser];
    
    // get user if there isn't a user stored on divice and add to context
    if (user == nil) {
        user = (User *)[NSEntityDescription insertNewObjectForEntityForName:@"User"
                                                     inManagedObjectContext:context];
    }
    
    user.userName = name;
    
    //save changes to disk
    [self saveWithContext:context];
}

-(NSString *)getUserName {
    User *user = [self getUser];
    if (user != nil) {
        return user.userName;
    } else {
        return nil;
    }
}

-(NSManagedObjectContext *)getContext {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *managedObjectContext = appDelegate.managedObjectContext;
    return managedObjectContext;
}

-(User *)getUser {
    NSManagedObjectContext *context = [self getContext];
    NSFetchRequest *fetchUser = [[NSFetchRequest alloc] initWithEntityName:@"User"];
    NSError *requestError= nil;
    NSArray *users = [context executeFetchRequest:fetchUser
                                            error:&requestError];
    if ([users count] > 0 && users[0] != nil) {
        return users[0];
    } else {
        return nil;
    }
}

-(void)saveWithContext:(NSManagedObjectContext *)context {
    NSError *savingError = nil;
    
    if ([context save:&savingError]) {
        NSLog(@"User saved successfully");
    } else {
        NSLog(@"Error while saving user: %@", savingError);
    }
    
}

@end
