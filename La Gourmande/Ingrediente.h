//
//  Ingrediente.h
//  La Gourmande
//
//  Created by Lilliana Víquez Murillo on 2/19/14.
//  Copyright (c) 2014 Lilliana Víquez Murillo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Receta;

@interface Ingrediente : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSString *receta;
@property (nonatomic, retain) NSString *shopping_list;
@end

@interface Ingrediente (CoreDataGeneratedAccessors)

- (void)addRecetaObject:(Receta *)value;
- (void)removeRecetaObject:(Receta *)value;
- (void)addReceta:(NSSet *)values;
- (void)removeReceta:(NSSet *)values;

- (void)addShopping_listObject:(NSManagedObject *)value;
- (void)removeShopping_listObject:(NSManagedObject *)value;
- (void)addShopping_list:(NSSet *)values;
- (void)removeShopping_list:(NSSet *)values;

@end
