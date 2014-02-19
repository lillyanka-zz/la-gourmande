//
//  Shopping_list.h
//  La Gourmande
//
//  Created by Lilliana Víquez Murillo on 2/19/14.
//  Copyright (c) 2014 Lilliana Víquez Murillo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Ingrediente;

@interface Shopping_list : NSManagedObject

@property (nonatomic, retain) NSArray *ingredientes;
@end

@interface Shopping_list (CoreDataGeneratedAccessors)

- (void)addIngredientesObject:(Ingrediente *)value;
- (void)removeIngredientesObject:(Ingrediente *)value;
- (void)addIngredientes:(NSSet *)values;
- (void)removeIngredientes:(NSSet *)values;

@end
