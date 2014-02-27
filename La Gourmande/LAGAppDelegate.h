//
//  LAGAppDelegate.h
//  La Gourmande
//
//  Created by Lilliana Víquez Murillo on 2/19/14.
//  Copyright (c) 2014 Lilliana Víquez Murillo. All rights reserved.
//

#import <Parse/Parse.h>
#import <UIKit/UIKit.h>

@interface LAGAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
