//
//  PuttingVC.m
//  Poor Man's Golf
//
//  Created by Meehan, Christopher on 5/25/16.
//  Copyright © 2016 Meehan, Christopher. All rights reserved.
//

#import "PuttingVC.h"

@implementation PuttingVC
- (IBAction)doneWasSelected:(id)sender {
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    // increase this hole's total swings by numOfPutts.
    NSMutableDictionary* user0DictForThisHole = [app getAUsersDict:app.user0Name forHole:[app.currentHoleNumber intValue]];
    NSMutableDictionary* user1DictForThisHole = [app getAUsersDict:app.user1Name forHole:[app.currentHoleNumber intValue]];
    NSMutableDictionary* user2DictForThisHole = [app getAUsersDict:app.user2Name forHole:[app.currentHoleNumber intValue]];
    NSMutableDictionary* user3DictForThisHole = [app getAUsersDict:app.user3Name forHole:[app.currentHoleNumber intValue]];
    
    NSNumber* swingsThisHole0 = [user0DictForThisHole objectForKey:@"SwingsThisHole"];
    int totalSwingsThisHole0 = [swingsThisHole0 intValue] + [self.user0CurrentTotalPutts intValue];
    [user0DictForThisHole setValue:[NSNumber numberWithInt:totalSwingsThisHole0] forKey:@"SwingsThisHole"];

    NSNumber* swingsThisHole1 = [user1DictForThisHole objectForKey:@"SwingsThisHole"];
    int totalSwingsThisHole1 = [swingsThisHole1 intValue] + [self.user1CurrentTotalPutts intValue];
    [user1DictForThisHole setValue:[NSNumber numberWithInt:totalSwingsThisHole1] forKey:@"SwingsThisHole"];

    NSNumber* swingsThisHole2 = [user2DictForThisHole objectForKey:@"SwingsThisHole"];
    int totalSwingsThisHole2 = [swingsThisHole2 intValue] + [self.user2CurrentTotalPutts intValue];
    [user2DictForThisHole setValue:[NSNumber numberWithInt:totalSwingsThisHole2] forKey:@"SwingsThisHole"];

    NSNumber* swingsThisHole3 = [user3DictForThisHole objectForKey:@"SwingsThisHole"];
    int totalSwingsThisHole3 = [swingsThisHole3 intValue] + [self.user3CurrentTotalPutts intValue];
    [user3DictForThisHole setValue:[NSNumber numberWithInt:totalSwingsThisHole3] forKey:@"SwingsThisHole"];

    app.currentHoleNumber = [NSNumber numberWithInt:[app.currentHoleNumber intValue] + 1];
    
    UIStoryboard *sb = self.storyboard;
    PuttingVC * mainVC = [sb instantiateViewControllerWithIdentifier:@"PuttingVCID"];
    [self presentViewController:mainVC animated:YES completion:nil];
}

- (IBAction)subtractPuttWasSelected:(id)sender {
    if ([sender tag] == 0) {
        if ([self.user0CurrentTotalPutts intValue] > 0) {
            self.user0CurrentTotalPutts = [NSNumber numberWithInt:[self.user0CurrentTotalPutts intValue] - 1];
            self.user0CurrentTotalPuttsLabel.text = [NSString stringWithFormat:@"%d putts",[self.user0CurrentTotalPutts intValue]];
        }
    }
    else if ([sender tag] == 1) {
        if ([self.user1CurrentTotalPutts intValue] > 0) {
            self.user1CurrentTotalPutts = [NSNumber numberWithInt:[self.user1CurrentTotalPutts intValue] - 1];
            self.user1CurrentTotalPuttsLabel.text = [NSString stringWithFormat:@"%d putts",[self.user1CurrentTotalPutts intValue]];
        }
    }
    else if ([sender tag] == 2) {
        if ([self.user2CurrentTotalPutts intValue] > 0) {
            self.user2CurrentTotalPutts = [NSNumber numberWithInt:[self.user2CurrentTotalPutts intValue] - 1];
            self.user2CurrentTotalPuttsLabel.text = [NSString stringWithFormat:@"%d putts",[self.user2CurrentTotalPutts intValue]];
        }
    }
    else{
        if ([self.user3CurrentTotalPutts intValue] > 0) {
            self.user3CurrentTotalPutts = [NSNumber numberWithInt:[self.user3CurrentTotalPutts intValue] - 1];
            self.user3CurrentTotalPuttsLabel.text = [NSString stringWithFormat:@"%d putts",[self.user3CurrentTotalPutts intValue]];
        }
    }
}

- (IBAction)addPuttWasSelected:(id)sender {
    if ([sender tag] == 0) {
        self.user0CurrentTotalPutts = [NSNumber numberWithInt:[self.user0CurrentTotalPutts intValue] + 1];
        self.user0CurrentTotalPuttsLabel.text = [NSString stringWithFormat:@"%d putts",[self.user0CurrentTotalPutts intValue]];
    }
    else if ([sender tag] == 1) {
        self.user1CurrentTotalPutts = [NSNumber numberWithInt:[self.user1CurrentTotalPutts intValue] + 1];
        self.user1CurrentTotalPuttsLabel.text = [NSString stringWithFormat:@"%d putts",[self.user1CurrentTotalPutts intValue]];
    }
    else if ([sender tag] == 2) {
        self.user2CurrentTotalPutts = [NSNumber numberWithInt:[self.user2CurrentTotalPutts intValue] + 1];
        self.user2CurrentTotalPuttsLabel.text = [NSString stringWithFormat:@"%d putts",[self.user2CurrentTotalPutts intValue]];
    }
    else{
        self.user3CurrentTotalPutts = [NSNumber numberWithInt:[self.user3CurrentTotalPutts intValue] + 1];
        self.user3CurrentTotalPuttsLabel.text = [NSString stringWithFormat:@"%d putts",[self.user3CurrentTotalPutts intValue]];
    }
}

- (void)viewDidLoad{
    [super viewDidLoad];
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSMutableDictionary* user0DictForThisHole = [app getAUsersDict:app.user0Name forHole:[app.currentHoleNumber intValue]];
    NSMutableDictionary* user1DictForThisHole = [app getAUsersDict:app.user1Name forHole:[app.currentHoleNumber intValue]];
    NSMutableDictionary* user2DictForThisHole = [app getAUsersDict:app.user2Name forHole:[app.currentHoleNumber intValue]];
    NSMutableDictionary* user3DictForThisHole = [app getAUsersDict:app.user3Name forHole:[app.currentHoleNumber intValue]];
    
    self.user0Name.text = app.user0Name;
    self.user1Name.text = app.user1Name;
    self.user2Name.text = app.user2Name;
    self.user3Name.text = app.user3Name;
    
    self.user0CurrentTotalPutts = 0;
    self.user1CurrentTotalPutts = 0;
    self.user2CurrentTotalPutts = 0;
    self.user3CurrentTotalPutts = 0;
    
    self.user0CurrentTotalPuttsLabel.text = [NSString stringWithFormat:@"%d putts",[self.user0CurrentTotalPutts intValue]];
    self.user1CurrentTotalPuttsLabel.text = [NSString stringWithFormat:@"%d putts",[self.user1CurrentTotalPutts intValue]];
    self.user2CurrentTotalPuttsLabel.text = [NSString stringWithFormat:@"%d putts",[self.user2CurrentTotalPutts intValue]];
    self.user3CurrentTotalPuttsLabel.text = [NSString stringWithFormat:@"%d putts",[self.user3CurrentTotalPutts intValue]];
    
    self.user0TotalSwingsLabel.text = [NSString stringWithFormat:@"Total Swings: %d",[app getTotalSwingsForUser:app.user0Name] ];
    self.user1TotalSwingsLabel.text = [NSString stringWithFormat:@"Total Swings: %d",[app getTotalSwingsForUser:app.user1Name] ];
    self.user2TotalSwingsLabel.text = [NSString stringWithFormat:@"Total Swings: %d",[app getTotalSwingsForUser:app.user2Name] ];
    self.user3TotalSwingsLabel.text = [NSString stringWithFormat:@"Total Swings: %d",[app getTotalSwingsForUser:app.user3Name] ];
    
    if ([app.currentHoleNumber intValue] == [app.numOfHolesActuallyPlayed intValue] +1 ) {
        self.holeNumLabel.text = @"ALL DONE";
        self.doneButton.hidden = YES;
        
        // State what they would have been had they played the full par 72
        int whatIsTotalParUpToLastHolePlayed = 0;
        for (int holeNum = 1 ; holeNum <= [app.numOfHolesActuallyPlayed intValue] ; holeNum++){
            whatIsTotalParUpToLastHolePlayed += [app.eachHolesParCount[holeNum-1] intValue];
        }
        
        float ratioOfYourSwingsVsWhatTheCourseExpectsOuttaYa0 = [app getTotalSwingsForUser:app.user0Name] / (float)whatIsTotalParUpToLastHolePlayed;
        self.user0ExpectedPuttLabel.text = [NSString stringWithFormat:@"Par 72 you would be %f",72*ratioOfYourSwingsVsWhatTheCourseExpectsOuttaYa0-72];
        
        float ratioOfYourSwingsVsWhatTheCourseExpectsOuttaYa1 = [app getTotalSwingsForUser:app.user1Name] / (float)whatIsTotalParUpToLastHolePlayed;
        self.user1ExpectedPuttLabel.text = [NSString stringWithFormat:@"Par 72 you would be %f",72*ratioOfYourSwingsVsWhatTheCourseExpectsOuttaYa1-72];
        
        float ratioOfYourSwingsVsWhatTheCourseExpectsOuttaYa2 = [app getTotalSwingsForUser:app.user2Name] / (float)whatIsTotalParUpToLastHolePlayed;
        self.user2ExpectedPuttLabel.text = [NSString stringWithFormat:@"Par 72 you would be %f",72*ratioOfYourSwingsVsWhatTheCourseExpectsOuttaYa2-72];
        
        float ratioOfYourSwingsVsWhatTheCourseExpectsOuttaYa3 = [app getTotalSwingsForUser:app.user3Name] / (float)whatIsTotalParUpToLastHolePlayed;
        self.user3ExpectedPuttLabel.text = [NSString stringWithFormat:@"Par 72 you would be %f",72*ratioOfYourSwingsVsWhatTheCourseExpectsOuttaYa3-72];

    }
    else {
        self.holeNumLabel.text = [NSString stringWithFormat:@"Hole # %f",[app.currentHoleNumber floatValue]];
        
        float totalYardsNum = [app.eachHolesDistance[[app.currentHoleNumber intValue]-1] floatValue];
        
        float yardsTraveledThisHole0 = [[user0DictForThisHole valueForKey:@"YardsSwungThisHole"] floatValue];
        float yardsToHole0 = totalYardsNum - yardsTraveledThisHole0;
        if (yardsToHole0 <= [app.puttingGreenRadius floatValue]) {
            self.user0ExpectedPuttLabel.text = [NSString stringWithFormat:@"%f ft putt",yardsToHole0*3.0];
        }
        else {
            self.user0ExpectedPuttLabel.text = [NSString stringWithFormat:@"%f ft chip",yardsToHole0*3.0];
        }
        
        float yardsTraveledThisHole1 = [[user1DictForThisHole valueForKey:@"YardsSwungThisHole"] floatValue];
        float yardsToHole1 = totalYardsNum - yardsTraveledThisHole1;
        if (yardsToHole1 <= [app.puttingGreenRadius floatValue]) {
            self.user1ExpectedPuttLabel.text = [NSString stringWithFormat:@"%f ft putt",yardsToHole1*3.0];
        }
        else {
            self.user1ExpectedPuttLabel.text = [NSString stringWithFormat:@"%f ft chip",yardsToHole1*3.0];
        }
        
        float yardsTraveledThisHole2 = [[user2DictForThisHole valueForKey:@"YardsSwungThisHole"] floatValue];
        float yardsToHole2 = totalYardsNum - yardsTraveledThisHole2;
        if (yardsToHole2 <= [app.puttingGreenRadius floatValue]) {
            self.user2ExpectedPuttLabel.text = [NSString stringWithFormat:@"%f ft putt",yardsToHole2*3.0];
        }
        else {
            self.user2ExpectedPuttLabel.text = [NSString stringWithFormat:@"%f ft chip",yardsToHole2*3.0];
        }
        
        float yardsTraveledThisHole3 = [[user3DictForThisHole valueForKey:@"YardsSwungThisHole"] floatValue];
        float yardsToHole3 = totalYardsNum - yardsTraveledThisHole3;
        if (yardsToHole3 <= [app.puttingGreenRadius floatValue]) {
            self.user3ExpectedPuttLabel.text = [NSString stringWithFormat:@"%f ft putt",yardsToHole3*3.0];
        }
        else {
            self.user3ExpectedPuttLabel.text = [NSString stringWithFormat:@"%f ft chip",yardsToHole3*3.0];
        }
    }
    

}

@end
