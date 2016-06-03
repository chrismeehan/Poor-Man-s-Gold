//
//  ViewController.m
//  Poor Man's Golf
//
//  Created by Meehan, Christopher on 5/25/16.
//  Copyright © 2016 Meehan, Christopher. All rights reserved.
//

#import "ViewController.h"
#import "UserSwungVC.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *currentHoleNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalYardsForThisHoleLabel;
@property (weak, nonatomic) IBOutlet UILabel *thisHolesParLabel;

@end

@implementation ViewController

- (IBAction)previousHoleWasSelected:(id)sender {
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    int upcomingHoleNum = [app.currentHoleNumber intValue] - 1;
    if (upcomingHoleNum == 0) {
        upcomingHoleNum = 1;
    }
    
    app.currentHoleNumber = [NSNumber numberWithInt:upcomingHoleNum];
    UIStoryboard *sb = self.storyboard;
    ViewController * mainVC = [sb instantiateViewControllerWithIdentifier:@"HowLongIsThisHoleVCID"];
    [self presentViewController:mainVC animated:NO completion:nil];
    
    
}

- (IBAction)nextHoleWasSelected:(id)sender {
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    app.currentHoleNumber = [NSNumber numberWithInt:[app.currentHoleNumber intValue] + 1];

    
    if ([app.currentHoleNumber intValue] != 19) {
        // Setup all data for all users for this next hole.
        
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
        
        UIStoryboard *sb = self.storyboard;
        ViewController * mainVC = [sb instantiateViewControllerWithIdentifier:@"MainVCID"];
        [self presentViewController:mainVC animated:YES completion:nil];
    }
    else {  // 18th hole is over, time to put.
        [self timeToPutWasSelected:nil];
    }
    

}

- (IBAction)timeToPutWasSelected:(id)sender {
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    app.numOfHolesActuallyPlayed = app.currentHoleNumber;
    app.currentHoleNumber = [NSNumber numberWithInt:1];
    
    UIStoryboard *sb = self.storyboard;
    ViewController * mainVC = [sb instantiateViewControllerWithIdentifier:@"PuttingVCID"];
    [self presentViewController:mainVC animated:YES completion:nil];
    
}

- (IBAction)userWasSelected:(id)sender {
    [self performSegueWithIdentifier:@"userSwungSegue" sender:sender];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UserSwungVC* vC = segue.destinationViewController;
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    if ([sender tag] == 0) {
        vC.userName = app.user0Name;
    }
    else if ([sender tag] == 1) {
        vC.userName = app.user1Name;
    }
    else if ([sender tag] == 2) {
        vC.userName = app.user2Name;
    }
    else {
        vC.userName = app.user3Name;
    }
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    int holeNum =  [app.currentHoleNumber intValue] ;
    self.currentHoleNumLabel.text = [NSString stringWithFormat:@"Hole # %d",holeNum];
    int totalYardsNum = [app.eachHolesDistance[holeNum-1] intValue];
    int thisHolesParCount = [app.eachHolesParCount[holeNum-1] intValue];

    self.totalYardsForThisHoleLabel.text = [NSString stringWithFormat:@"Total Yards: %d", totalYardsNum ] ;
    self.thisHolesParLabel.text = [NSString stringWithFormat:@"Par %d", thisHolesParCount ] ;
    
    self.nameLabel0.text = app.user0Name;
    self.nameLabel1.text = app.user1Name;
    self.nameLabel2.text = app.user2Name;
    self.nameLabel3.text = app.user3Name;
    
    NSMutableDictionary* user0DictForThisHole = [app getAUsersDict:app.user0Name forHole:holeNum];
    NSMutableDictionary* user1DictForThisHole = [app getAUsersDict:app.user1Name forHole:holeNum];
    NSMutableDictionary* user2DictForThisHole = [app getAUsersDict:app.user2Name forHole:holeNum];
    NSMutableDictionary* user3DictForThisHole = [app getAUsersDict:app.user3Name forHole:holeNum];
    
    NSString* str0 = [user0DictForThisHole objectForKey:@"SwingsThisHole"];
    self.swingsThisHoleLabel0.text = [@"Swings this hole: " stringByAppendingString:[NSString stringWithFormat:@"%@",str0] ];
    NSString* str1 = [user1DictForThisHole objectForKey:@"SwingsThisHole"];
    self.swingsThisHoleLabel1.text = [@"Swings this hole: " stringByAppendingString:[NSString stringWithFormat:@"%@",str1] ];
    NSString* str2 = [user2DictForThisHole objectForKey:@"SwingsThisHole"];
    self.swingsThisHoleLabel2.text = [@"Swings this hole: " stringByAppendingString:[NSString stringWithFormat:@"%@",str2] ];
    NSString* str3 = [user3DictForThisHole objectForKey:@"SwingsThisHole"];
    self.swingsThisHoleLabel3.text = [@"Swings this hole: " stringByAppendingString:[NSString stringWithFormat:@"%@",str3] ];
    
    self.totalSwingsLabel0.text = [NSString stringWithFormat:@"Entire game's swings: %d",[app getTotalSwingsForUser:app.user0Name]];
    self.totalSwingsLabel1.text = [NSString stringWithFormat:@"Entire game's swings: %d",[app getTotalSwingsForUser:app.user1Name]];
    self.totalSwingsLabel2.text = [NSString stringWithFormat:@"Entire game's swings: %d",[app getTotalSwingsForUser:app.user2Name]];
    self.totalSwingsLabel3.text = [NSString stringWithFormat:@"Entire game's swings: %d",[app getTotalSwingsForUser:app.user3Name]];
    
    self.yardsSwungThisHoleLabel0.text = [NSString stringWithFormat:@"Yards traveled this hole: %@", [user0DictForThisHole objectForKey:@"YardsSwungThisHole"]] ;
    self.yardsSwungThisHoleLabel1.text = [NSString stringWithFormat:@"Yards traveled this hole: %@", [user1DictForThisHole objectForKey:@"YardsSwungThisHole"]] ;
    self.yardsSwungThisHoleLabel2.text = [NSString stringWithFormat:@"Yards traveled this hole: %@", [user2DictForThisHole objectForKey:@"YardsSwungThisHole"]] ;
    self.yardsSwungThisHoleLabel3.text = [NSString stringWithFormat:@"Yards traveled this hole: %@", [user3DictForThisHole objectForKey:@"YardsSwungThisHole"]] ;
    
    float yardsTraveledThisHole0 = [[user0DictForThisHole valueForKey:@"YardsSwungThisHole"] floatValue];
    float yardsToHole0 = totalYardsNum - yardsTraveledThisHole0;
    self.yardsToHoleLabel0.text = [NSString stringWithFormat:@"Yards to hole: %f", totalYardsNum - yardsTraveledThisHole0];
    float yardsTraveledThisHole1 = [[user1DictForThisHole valueForKey:@"YardsSwungThisHole"] floatValue];
    float yardsToHole1 = totalYardsNum - yardsTraveledThisHole1;
    self.yardsToHoleLabel1.text = [NSString stringWithFormat:@"Yards to hole: %f", totalYardsNum - yardsTraveledThisHole1];
    float yardsTraveledThisHole2 = [[user2DictForThisHole valueForKey:@"YardsSwungThisHole"] floatValue];
    float yardsToHole2 = totalYardsNum - yardsTraveledThisHole2;
    self.yardsToHoleLabel2.text = [NSString stringWithFormat:@"Yards to hole: %f", totalYardsNum - yardsTraveledThisHole2];
    float yardsTraveledThisHole3 = [[user3DictForThisHole valueForKey:@"YardsSwungThisHole"] floatValue];
    float yardsToHole3 = totalYardsNum - yardsTraveledThisHole3;
    self.yardsToHoleLabel3.text = [NSString stringWithFormat:@"Yards to hole: %f", yardsToHole3];
    
    if (yardsToHole0 <= [app.takeItToTheGreenDistance intValue]) {
        [self.control0 setBackgroundColor:[UIColor grayColor]];
        self.control0.userInteractionEnabled = NO;
    }
    if (yardsToHole1 <= [app.takeItToTheGreenDistance intValue]) {
        [self.control1 setBackgroundColor:[UIColor grayColor]];
        self.control1.userInteractionEnabled = NO;
    }
    if (yardsToHole2 <= [app.takeItToTheGreenDistance intValue]) {
        [self.control2 setBackgroundColor:[UIColor grayColor]];
        self.control2.userInteractionEnabled = NO;
    }
    if (yardsToHole3 <= [app.takeItToTheGreenDistance intValue]) {
        [self.control3 setBackgroundColor:[UIColor grayColor]];
        self.control3.userInteractionEnabled = NO;
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
