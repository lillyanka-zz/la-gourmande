//
//  Receta.h
//  La Gourmande
//
//  Created by Lilliana Víquez Murillo on 2/19/14.
//  Copyright (c) 2014 Lilliana Víquez Murillo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Receta : NSManagedObject

@property (nonatomic, retain) NSString * titulo;
@property (nonatomic, retain) NSString * instrucciones;
@property (nonatomic, retain) NSString * link;
@property (nonatomic, retain) NSString * tiempo;
@property (nonatomic, retain) NSString * dificultad;
@property (nonatomic, retain) NSArray * tags;
@property (nonatomic, retain) NSNumber * rating;
@property (nonatomic, retain) NSArray *ingredientes;
@property (nonatomic, retain) NSMutableArray *comments;
@end

@interface Receta (CoreDataGeneratedAccessors)

- (void)addIngredientesObject:(NSManagedObject *)value;
- (void)removeIngredientesObject:(NSManagedObject *)value;
- (void)addIngredientes:(NSSet *)values;
- (void)removeIngredientes:(NSSet *)values;

- (void)addCommentsObject:(NSManagedObject *)value;
- (void)removeCommentsObject:(NSManagedObject *)value;
- (void)addComments:(NSSet *)values;
- (void)removeComments:(NSSet *)values;

@end
