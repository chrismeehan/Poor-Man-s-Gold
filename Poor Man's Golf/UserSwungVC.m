//
//  UserSwungVC.m
//  Poor Man's Golf
//
//  Created by Meehan, Christopher on 5/25/16.
//  Copyright © 2016 Meehan, Christopher. All rights reserved.
//

#import "UserSwungVC.h"
#import "AppDelegate.h"

@implementation UserSwungVC
- (IBAction)doneWasSelected:(id)sender {
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSMutableDictionary* thisUserThisHoleDict = [app getAUsersDict:self.userName forHole:[app.currentHoleNumber intValue]];
    
    int swingsThisHole = [[thisUserThisHoleDict valueForKey:@"SwingsThisHole"]intValue];
    [thisUserThisHoleDict setObject:[NSNumber numberWithInt:swingsThisHole+1] forKey:@"SwingsThisHole"];
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *thisSwingTraveled = [f numberFromString:self.howFarTextField.text];
    
    int yardsTraveledThisHole = [[thisUserThisHoleDict valueForKey:@"YardsSwungThisHole"]intValue] + [thisSwingTraveled intValue];
    int origDistanceToHole = [app.eachHolesDistance[[app.currentHoleNumber intValue]-1]intValue];
    if (yardsTraveledThisHole > origDistanceToHole) {
        int diff = yardsTraveledThisHole - origDistanceToHole;
        [thisUserThisHoleDict setObject:[NSNumber numberWithInt:origDistanceToHole-diff] forKey:@"YardsSwungThisHole"];
    }
    else {
        [thisUserThisHoleDict setObject:[NSNumber numberWithInt:yardsTraveledThisHole] forKey:@"YardsSwungThisHole"];
    }
    
    [self dismissViewControllerAnimated:NO completion:nil];
}
- (IBAction)cancelWasSelected:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (IBAction)feetWasSelected:(id)sender {
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSMutableDictionary* thisUserThisHoleDict = [app getAUsersDict:self.userName forHole:[app.currentHoleNumber intValue]];
    int swingsThisHole = [[thisUserThisHoleDict valueForKey:@"SwingsThisHole"]intValue];
    [thisUserThisHoleDict setObject:[NSNumber numberWithInt:swingsThisHole+1] forKey:@"SwingsThisHole"];
    
    int origDistanceToHole = [app.eachHolesDistance[[app.currentHoleNumber intValue]-1]intValue];
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *thisFarFromHole = [f numberFromString:self.howCloseToHoleTextField.text];
    
    float thisHoleUserHasHitThisFarTotal = origDistanceToHole - ([thisFarFromHole floatValue]/3.0);
    
    [thisUserThisHoleDict setObject:[NSNumber numberWithFloat:thisHoleUserHasHitThisFarTotal] forKey:@"YardsSwungThisHole"];
    [self dismissViewControllerAnimated:NO completion:nil];

}

- (IBAction)yardsWasSelected:(id)sender {
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSMutableDictionary* thisUserThisHoleDict = [app getAUsersDict:self.userName forHole:[app.currentHoleNumber intValue]];
    int swingsThisHole = [[thisUserThisHoleDict valueForKey:@"SwingsThisHole"]intValue];
    [thisUserThisHoleDict setObject:[NSNumber numberWithInt:swingsThisHole+1] forKey:@"SwingsThisHole"];
    
    int origDistanceToHole = [app.eachHolesDistance[[app.currentHoleNumber intValue]-1]intValue];
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *thisFarFromHole = [f numberFromString:self.howCloseToHoleTextField.text];
    
    int thisHoleUserHasHitThisFarTotal = origDistanceToHole - [thisFarFromHole intValue];

    [thisUserThisHoleDict setObject:[NSNumber numberWithInt:thisHoleUserHasHitThisFarTotal] forKey:@"YardsSwungThisHole"];
    [self dismissViewControllerAnimated:NO completion:nil];

}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.howFarTextField becomeFirstResponder];
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.nameLabel.text = self.userName;

}

@end
