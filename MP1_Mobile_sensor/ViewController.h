//
//  ViewController.h
//  MP1_Mobile_sensor
//
//  Created by Yifang Zhang on 9/3/16.
//  Copyright © 2016 Yifang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *acc_x;
@property (strong, nonatomic) IBOutlet UILabel *acc_y;
@property (strong, nonatomic) IBOutlet UILabel *acc_z;

@property CMMotionManager * motionManager;

@property BOOL flag;

- (IBAction)switcher:(id)sender;

@end

