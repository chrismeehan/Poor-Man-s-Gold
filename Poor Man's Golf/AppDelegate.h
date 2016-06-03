//
//  AppDelegate.h
//  Poor Man's Golf
//
//  Created by Meehan, Christopher on 5/25/16.
//  Copyright © 2016 Meehan, Christopher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property(strong,atomic) NSString* user0Name;
@property(strong,atomic) NSString* user1Name;
@property(strong,atomic) NSString* user2Name;
@property(strong,atomic) NSString* user3Name;
@property(strong,atomic) NSNumber* currentHoleNumber;
@property(strong,atomic) NSNumber* puttingGreenRadius;
@property(strong,atomic) NSNumber* takeItToTheGreenDistance;
@property(strong,atomic) NSNumber* numOfHolesActuallyPlayed;
@property(strong,atomic) NSMutableDictionary* eachUsersDict;
@property(strong,atomic) NSArray* eachHolesDistance;
@property(strong,atomic) NSArray* eachHolesParCount;
@property (strong, nonatomic) UIWindow *window;

-(NSMutableDictionary*)getAUsersDict:(NSString*)name forHole:(int)holeNum;
-(int)getTotalSwingsForUser:(NSString*)name;


@end

