//
//  UserSwungVC.h
//  Poor Man's Golf
//
//  Created by Meehan, Christopher on 5/25/16.
//  Copyright © 2016 Meehan, Christopher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserSwungVC : UIViewController{
}
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet NSString *userName;
@property (weak, nonatomic) IBOutlet UITextField *howFarTextField;
@property (weak, nonatomic) IBOutlet UITextField *howCloseToHoleTextField;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet UIButton *feetButton;
@property (weak, nonatomic) IBOutlet UIButton *yardsButton;


@end
