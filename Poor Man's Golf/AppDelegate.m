//
//  AppDelegate.m
//  Poor Man's Golf
//
//  Created by Meehan, Christopher on 5/25/16.
//  Copyright © 2016 Meehan, Christopher. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.eachUsersDict = [[NSMutableDictionary alloc]init];
    self.eachHolesDistance = @[[NSNumber numberWithInt:332],
                               [NSNumber numberWithInt:428],
                               [NSNumber numberWithInt:334],
                               [NSNumber numberWithInt:295],
                               [NSNumber numberWithInt:130],
                               [NSNumber numberWithInt:467],
                               [NSNumber numberWithInt:94],
                               [NSNumber numberWithInt:373],
                               [NSNumber numberWithInt:435],
                               [NSNumber numberWithInt:409],
                               [NSNumber numberWithInt:340],
                               [NSNumber numberWithInt:179],
                               [NSNumber numberWithInt:372],
                               [NSNumber numberWithInt:548],
                               [NSNumber numberWithInt:340],
                               [NSNumber numberWithInt:368],
                               [NSNumber numberWithInt:163],
                               [NSNumber numberWithInt:509],
                               ];
    self.eachHolesParCount = @[[NSNumber numberWithInt:4],
                               [NSNumber numberWithInt:5],
                               [NSNumber numberWithInt:4],
                               [NSNumber numberWithInt:4],
                               [NSNumber numberWithInt:3],
                               [NSNumber numberWithInt:5],
                               [NSNumber numberWithInt:3],
                               [NSNumber numberWithInt:4],
                               [NSNumber numberWithInt:4],
                               [NSNumber numberWithInt:4],
                               [NSNumber numberWithInt:4],
                               [NSNumber numberWithInt:3],
                               [NSNumber numberWithInt:4],
                               [NSNumber numberWithInt:5],
                               [NSNumber numberWithInt:4],
                               [NSNumber numberWithInt:4],
                               [NSNumber numberWithInt:3],
                               [NSNumber numberWithInt:5],
                               ];
    
    return YES;
}

-(NSMutableDictionary*)getAUsersDict:(NSString*)name forHole:(int)holeNum{
    NSMutableDictionary* aUsersDict = [self.eachUsersDict objectForKey:name];
    return [aUsersDict objectForKey:[NSString stringWithFormat:@"%d",holeNum]];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(int)getTotalSwingsForUser:(NSString*)name {
    NSDictionary* aUsersData = [self.eachUsersDict objectForKey:name];
    int swingCounter = 0;
    for (int holeCounter = 1; holeCounter <= aUsersData.count; holeCounter++) {
        NSDictionary *thisHoleForThisUser = [aUsersData objectForKey:[NSString stringWithFormat:@"%d",holeCounter]];
        NSNumber* swingsThisHole = [thisHoleForThisUser objectForKey:@"SwingsThisHole"];
        swingCounter += [swingsThisHole intValue];
    }
    return swingCounter;
}


@end
