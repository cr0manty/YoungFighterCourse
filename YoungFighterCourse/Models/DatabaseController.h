//
//  DatabaseController.h
//  test
//
//  Created by Max on 31.10.16.
//  Copyright © 2016 Max. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

typedef void (^DatabasePurgeCompletionBlock)();

@interface DatabaseController : NSObject

@property (strong, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) NSManagedObjectContext *asyncContext;

+ (DatabaseController *)sharedInstance;
+ (NSString *)documentsPath;

+ (void)purgeDatabase;
+ (void)purgeDatabaseAsync:(bool)async withCompletionBlock:(DatabasePurgeCompletionBlock)completion;

+ (void)saveContext;
+ (void)saveAsyncContext;
+ (void)saveContext:(NSManagedObjectContext *)context;

+ (NSArray *)requestResultsForPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors entity:(NSString *)entity;
+ (NSArray *)requestResultsForPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors entity:(NSString *)entity fromContext:(NSManagedObjectContext *)context;

+ (void)removeAllObjectsOfEntity:(NSString *)entity;
+ (void)removeAllObjectsOfEntity:(NSString *)entity fromContext:(NSManagedObjectContext *)context;

@end
