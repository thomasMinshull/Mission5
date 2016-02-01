//
//  User+CoreDataProperties.h
//  
//
//  Created by thomas minshull on 2016-01-29.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *userName;
@property (nullable, nonatomic, retain) NSString *userProfilePickURL;

@end

NS_ASSUME_NONNULL_END
