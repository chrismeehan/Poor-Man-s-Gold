//
//  PuttingVC.h
//  Poor Man's Golf
//
//  Created by Meehan, Christopher on 5/25/16.
//  Copyright © 2016 Meehan, Christopher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface PuttingVC : UIViewController
@property (weak, nonatomic) NSString *holeNum;
@property (weak, nonatomic) IBOutlet UILabel *holeNumLabel;

@property (weak, nonatomic) IBOutlet UILabel *user0Name;
@property (weak, nonatomic) IBOutlet UILabel *user1Name;
@property (weak, nonatomic) IBOutlet UILabel *user2Name;
@property (weak, nonatomic) IBOutlet UILabel *user3Name;

@property (weak, nonatomic) IBOutlet UILabel *user0TotalSwingsLabel;
@property (weak, nonatomic) IBOutlet UILabel *user1TotalSwingsLabel;
@property (weak, nonatomic) IBOutlet UILabel *user2TotalSwingsLabel;
@property (weak, nonatomic) IBOutlet UILabel *user3TotalSwingsLabel;

@property (weak, nonatomic) IBOutlet UILabel *user0ExpectedPuttLabel;
@property (weak, nonatomic) IBOutlet UILabel *user1ExpectedPuttLabel;
@property (weak, nonatomic) IBOutlet UILabel *user2ExpectedPuttLabel;
@property (weak, nonatomic) IBOutlet UILabel *user3ExpectedPuttLabel;

@property (weak, nonatomic) NSNumber *user0CurrentTotalPutts;
@property (weak, nonatomic) NSNumber *user1CurrentTotalPutts;
@property (weak, nonatomic) NSNumber *user2CurrentTotalPutts;
@property (weak, nonatomic) NSNumber *user3CurrentTotalPutts;

@property (weak, nonatomic) IBOutlet UILabel *user0CurrentTotalPuttsLabel;
@property (weak, nonatomic) IBOutlet UILabel *user1CurrentTotalPuttsLabel;
@property (weak, nonatomic) IBOutlet UILabel *user2CurrentTotalPuttsLabel;
@property (weak, nonatomic) IBOutlet UILabel *user3CurrentTotalPuttsLabel;

@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@end
