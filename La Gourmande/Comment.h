//
//  Comment.h
//  La Gourmande
//
//  Created by Lilliana Víquez Murillo on 2/19/14.
//  Copyright (c) 2014 Lilliana Víquez Murillo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Receta, Usuario;

@interface Comment : NSManagedObject

@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) Usuario *usuario;
@property (nonatomic, retain) Receta *receta;

@end
