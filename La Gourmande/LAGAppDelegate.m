//
//  LAGAppDelegate.m
//  La Gourmande
//
//  Created by Lilliana Víquez Murillo on 2/19/14.
//  Copyright (c) 2014 Lilliana Víquez Murillo. All rights reserved.
//

#import <Parse/Parse.h>

#import "LAGAppDelegate.h"
#import "Usuario.h"
#import "Receta.h"
#import "Ingrediente.h"
#import "Shopping_list.h"
#import "Comment.h"


@implementation LAGAppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    *scaffoldViewController = [[SDScaffoldIndexViewController alloc]
//                               initWithEntityName:@"User" sortBy:@"lastname" context:[self managedObjectContext] andStyle:UITableViewStyleGrouped];
//    [self create];
//    [self read];
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    // Override point for customization after application launch.
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
    
    [Parse setApplicationId:@"Sr1WWuYU3FPbxzkdeObhFvYtqnjnNzBYx49tKKFz"
                  clientKey:@"WOXd99VdBF79ozjU5TXRUQUQHbIZB3CKdFuSw5a5"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
//    if (_managedObjectModel != nil) {
//        return _managedObjectModel;
//    }
//    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"La_Gourmande" withExtension:@"momd"];
//    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"gourmande.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


#pragma mark - Private methods

//- (void) create {
//    // Grab the context
//    NSManagedObjectContext *context = [self managedObjectContext];
//    
////    // Grab the Usuario entity
////    Usuario *user = [NSEntityDescription insertNewObjectForEntityForName:@"Usuario" inManagedObjectContext:context];
////    
////    // Set user name
////    user.nombre = @"Lillyanka";
////    
////    // Set email
////    user.email = @"sittingducks@gmail.com";
////    
////    // Set password. Need to find a way to encrypt
////    user.password = @"password";
//    
////    // Insert the Ingrediente entity
////    Ingrediente *ing = [NSEntityDescription insertNewObjectForEntityForName:@"Ingrediente" inManagedObjectContext:context];
////    
////    ing.nombre = @"1 paquete de gnocchi Divella de 500g";
////    
////    
////    // Insert the Receta entity
////    Receta *receta = [NSEntityDescription insertNewObjectForEntityForName:@"Receta" inManagedObjectContext:context];
////    
////    // Set the receta attributes
////    receta.titulo = @"Cacerola de Gnocchi y  queso";
////    receta.ingredientes = @[ing];
////    receta.link = @"http://diariodeunagourmande.com/cacerola-de-gnocchi-y-queso/";
////    receta.tiempo = @"90 min";
////    receta.dificultad = @"Simple";
////    receta.tags = @[@"pasta", @"italiana", @"comfort food", @"queso"];
////    receta.rating = @5;
////    receta.instrucciones = @"Para empezar, ponemos a calentar las 2 cucharadas de aceite de oliva a fuego medio-alto, y cuando esté listo ponemos las cebollas a cocinar por unos 3 a 5 minutos, hasta que estén transparentes. Cuando eso suceda, agregamos el jamón y el tomillo y cocinamos por otros 3 a 5 minutos.\n Cuando el jamón está cocinado, agregamos el caldo y el agua (yo los pongo en la misma taza medidora, el total de líquido es 1 1/4 de taza) y lo dejamos tranquilito hasta que esté a punto de hervir, o sea, hasta que esté haciendo burbujas pequeñas. Cuando el caldo se ve como la foto de arriba, agregamos los gnocchi.\n Les damos una movidita para que todos se bañen en el caldo, tapamos la sartén y los dejamos por aproximadamente unos 5 minutines. Mientras los gnocchi se cocinan, se pone a calentar el horno en “broil” o “dorar”.\n Cuando están listos, se quitan del fuego y (si el sartén no se puede meter al horno) se pasan a un pyrex o cacerola. Se agregan la crema dulce, las petit-pois y los quesos, y se lleva la cacerola al horno, por unos 5 minutos, o hasta que el queso de encima se vea doradito. Luego se deja descansar unos 10 minutos para que el queso se seque un poquito y quede más cremoso. O, si uno es un desesperado como yo, se sirve una taza inmediatamente. No queda tan cremoso, pero les prometo que igual será delicioso. Nada más cuidado de no quemarse!";
////    
////    [ing addRecetaObject:receta];
//    
//    // Save everything
//    NSError *error = nil;
//    if ([context save:&error]) {
//        NSLog(@"The save was successful!");
//    } else {
//        NSLog(@"The save wasn't successful: %@", [error userInfo]);
//    }
//}
//
//- (void) read {
//    NSManagedObjectContext *context = [self managedObjectContext];
//    
//    // Construct a fetch request
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Usuario"
//                                              inManagedObjectContext:context];
//    
//    [fetchRequest setEntity:entity];
//    NSError *error = nil;
//    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
//    
//    for (Usuario *user in fetchedObjects) {
//        // Log the user details
//        
//        NSLog(@"%@, email: %@, password: %@", user.nombre, user.email, user.password);
//    }
//}
//
//- (void) update {
//    // Grab the context
//    NSManagedObjectContext *context = [self managedObjectContext];
//    
//    // Perform fetch request
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Usuario"
//                                              inManagedObjectContext:context];
//    [fetchRequest setEntity:entity];
//    NSError *error = nil;
//    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
//    
//    // Date formatter comes in handy
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"YYYY"];
//    
//    // Grab the label
//    Usuario *lilly = [fetchedObjects objectAtIndex:0];
//    
//    // Juelz Santana
//    Usuario *lillyanka = [NSEntityDescription insertNewObjectForEntityForName:@"Usuario" inManagedObjectContext:context];
//    lillyanka.nombre = @"Lilliana Víquez";
//    lillyanka.email = @"lilly@twelveohsixcreative.com";
//    lillyanka.password = @"test";
////
////    // Juelz Santana albums
////    Album *juelzAlbum = [NSEntityDescription insertNewObjectForEntityForName:@"Album" inManagedObjectContext:context];
////    juelzAlbum.title = @"From Me to U";
////    juelzAlbum.released = [dateFormatter dateFromString:@"2003"];
////    [juelzAlbum setArtist:juelz];
////    
////    Album *juelzAlbum2 = [NSEntityDescription insertNewObjectForEntityForName:@"Album" inManagedObjectContext:context];
////    juelzAlbum2.title = @"What The Game's Been Missing!";
////    juelzAlbum2.released = [dateFormatter dateFromString:@"2005"];
////    [juelzAlbum2 setArtist:juelz];
////    
////    // Set relationships
////    [juelz addAlbums:[NSSet setWithObjects:juelzAlbum, juelzAlbum2, nil]];
////    
////    
////    // Jim Jones
////    Artist *jimmy = [NSEntityDescription insertNewObjectForEntityForName:@"Artist" inManagedObjectContext:context];
////    jimmy.name = @"Jim Jones";
////    jimmy.hometown = @"Harlem, NY";
////    
////    // Jim Jones albums
////    Album *jimmyAlbum = [NSEntityDescription insertNewObjectForEntityForName:@"Album" inManagedObjectContext:context];
////    jimmyAlbum.title = @"On My Way to Church";
////    jimmyAlbum.released = [dateFormatter dateFromString:@"2004"];
////    [jimmyAlbum setArtist:jimmy];
////    
////    Album *jimmyAlbum2 = [NSEntityDescription insertNewObjectForEntityForName:@"Album" inManagedObjectContext:context];
////    jimmyAlbum2.title = @"Harlem: Diary of a Summer";
////    jimmyAlbum2.released = [dateFormatter dateFromString:@"2005"];
////    [jimmyAlbum2 setArtist:jimmy];
////    
////    Album *jimmyAlbum3 = [NSEntityDescription insertNewObjectForEntityForName:@"Album" inManagedObjectContext:context];
////    jimmyAlbum3.title = @"Hustler's P.O.M.E. (Product of My Environment)";
////    jimmyAlbum3.released = [dateFormatter dateFromString:@"2006"];
////    [jimmyAlbum3 setArtist:jimmy];
////    
////    // Set relationships
////    [jimmy addAlbums:[NSSet setWithObjects:jimmyAlbum, jimmyAlbum2, jimmyAlbum3, nil]];
////    
////    
////    // Freekey Zekey
////    Artist *freekey = [NSEntityDescription insertNewObjectForEntityForName:@"Artist" inManagedObjectContext:context];
////    freekey.name = @"Freekey Zekey";
////    freekey.hometown = @"Harlem, NY";
////    
////    Album *freekeyAlbum = [NSEntityDescription insertNewObjectForEntityForName:@"Album" inManagedObjectContext:context];
////    freekeyAlbum.title = @"Book of Ezekiel";
////    freekeyAlbum.released = [dateFormatter dateFromString:@"2007"];
////    [freekeyAlbum setArtist:freekey];
////    [freekey addAlbumsObject:freekeyAlbum];
////    
////    // Set relationships
////        [lillyanka addFavoritos:[NSSet setWithObjects:receta, nil]];
////
//        // Save everything
//        if ([context save:&error]) {
//            NSLog(@"The save was successful!");
//        } else {
//            NSLog(@"The save wasn't successful: %@", [error localizedDescription]);
//        }
//    }
//
//- (void) delete {
//    // Grab the context
//    NSManagedObjectContext *context = [self managedObjectContext];
//    
//    //  We're looking to grab an artist
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User"
//                                              inManagedObjectContext:context];
//    
//    [fetchRequest setEntity:entity];
//    
//    // We specify that we only want Freekey Zekey
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == %@", @"Lilliana Víquez"];
//    [fetchRequest setPredicate:predicate];
//    
//    NSError *error = nil;
//    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
//    
//    // Grab the artist and delete
//    Usuario *lillyanka = [fetchedObjects objectAtIndex:0];
//    [lillyanka removeCommentsObject:lillyanka];
//    
//    // Save everything
//    if ([context save:&error]) {
//        NSLog(@"The save was successful!");
//    } else {
//        NSLog(@"The save wasn't successful: %@", [error localizedDescription]);
//    }
//}
//
@end
