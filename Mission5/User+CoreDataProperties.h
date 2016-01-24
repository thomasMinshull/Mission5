//
//  User+CoreDataProperties.h
//  Mission5
//
//  Created by thomas minshull on 2016-01-24.
//  Copyright © 2016 thomas minshull. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *userName;
@property (nullable, nonatomic, retain) NSString *userProfilePickURL;
@property (nullable, nonatomic, retain) NSString *token;

@end

NS_ASSUME_NONNULL_END
