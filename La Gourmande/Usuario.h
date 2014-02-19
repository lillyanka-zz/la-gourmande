//
//  Usuario.h
//  La Gourmande
//
//  Created by Lilliana Víquez Murillo on 2/19/14.
//  Copyright (c) 2014 Lilliana Víquez Murillo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Receta;
@class Comment;
@class Shopping_list;

@interface Usuario : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *password;
@property (nonatomic, retain) NSMutableArray *favoritos;
@property (nonatomic, retain) NSMutableArray *comments;
@end

@interface Usuario (CoreDataGeneratedAccessors)

- (void)addFavoritosObject:(NSManagedObject *)value;
- (void)removeFavoritosObject:(NSManagedObject *)value;
- (void)addFavoritos:(NSSet *)values;
- (void)removeFavoritos:(NSSet *)values;

- (void)addCommentsObject:(NSManagedObject *)value;
- (void)removeCommentsObject:(NSManagedObject *)value;
- (void)addComments:(NSSet *)values;
- (void)removeComments:(NSSet *)values;

@end
