//
//  EnterNamesVC.m
//  Poor Man's Golf
//
//  Created by Meehan, Christopher on 5/25/16.
//  Copyright © 2016 Meehan, Christopher. All rights reserved.
//

#import "EnterNamesVC.h"
#import "AppDelegate.h"

@implementation EnterNamesVC

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    app.user0Name = self.name0Label.text;
    app.user1Name = self.name1Label.text;
    app.user2Name = self.name2Label.text;
    app.user3Name = self.name3Label.text;
    app.currentHoleNumber = [NSNumber numberWithInt:1];
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterRoundCeiling;
    NSNumber *myNumber1 = [f numberFromString:self.takeItToTheGreenDistanceTextView.text];
    app.takeItToTheGreenDistance = [NSNumber numberWithInt:[myNumber1 floatValue]/3];

    NSNumberFormatter *f2 = [[NSNumberFormatter alloc] init];
    f2.numberStyle = NSNumberFormatterRoundCeiling;
    NSNumber *myNumber2 = [f2 numberFromString:self.puttingGreenRadiusTextView.text];
    app.puttingGreenRadius = [NSNumber numberWithInt:[myNumber2 floatValue]/3];
    
    
    NSMutableDictionary* userDict0 = [[NSMutableDictionary alloc]init];
    [app.eachUsersDict setValue:userDict0 forKey:app.user0Name];
    
    NSMutableDictionary* userDict1 = [[NSMutableDictionary alloc]init];
    [app.eachUsersDict setValue:userDict1 forKey:app.user1Name];
    
    NSMutableDictionary* userDict2 = [[NSMutableDictionary alloc]init];
    [app.eachUsersDict setValue:userDict2 forKey:app.user2Name];
    
    NSMutableDictionary* userDict3 = [[NSMutableDictionary alloc]init];
    [app.eachUsersDict setValue:userDict3 forKey:app.user3Name];
    
    NSMutableDictionary* user0ThisHole = [[NSMutableDictionary alloc]init];
    [user0ThisHole setValue:[NSNumber numberWithInt:0] forKey:@"SwingsThisHole"];
    [user0ThisHole setValue:[NSNumber numberWithInt:0] forKey:@"YardsSwungThisHole"];
    [[[app eachUsersDict] objectForKey:app.user0Name] setValue:user0ThisHole forKey:[NSString stringWithFormat:@"%d",[app.currentHoleNumber intValue]]];
    
    NSMutableDictionary* user1ThisHole = [[NSMutableDictionary alloc]init];
    [user1ThisHole setValue:[NSNumber numberWithInt:0] forKey:@"SwingsThisHole"];
    [user1ThisHole setValue:[NSNumber numberWithInt:0] forKey:@"YardsSwungThisHole"];
    [[[app eachUsersDict] objectForKey:app.user1Name] setValue:user1ThisHole forKey:[NSString stringWithFormat:@"%d",[app.currentHoleNumber intValue]]];
    
    NSMutableDictionary* user2ThisHole = [[NSMutableDictionary alloc]init];
    [user2ThisHole setValue:[NSNumber numberWithInt:0] forKey:@"SwingsThisHole"];
    [user2ThisHole setValue:[NSNumber numberWithInt:0] forKey:@"YardsSwungThisHole"];
    [[[app eachUsersDict] objectForKey:app.user2Name] setValue:user2ThisHole forKey:[NSString stringWithFormat:@"%d",[app.currentHoleNumber intValue]]];
    
    NSMutableDictionary* user3ThisHole = [[NSMutableDictionary alloc]init];
    [user3ThisHole setValue:[NSNumber numberWithInt:0] forKey:@"SwingsThisHole"];
    [user3ThisHole setValue:[NSNumber numberWithInt:0] forKey:@"YardsSwungThisHole"];
    [[[app eachUsersDict] objectForKey:app.user3Name] setValue:user3ThisHole forKey:[NSString stringWithFormat:@"%d",[app.currentHoleNumber intValue]]];

}

@end
