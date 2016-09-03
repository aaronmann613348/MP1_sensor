//
//  ViewController.m
//  MP1_Mobile_sensor
//
//  Created by Yifang Zhang on 9/3/16.
//  Copyright © 2016 Yifang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.acc_x.text = @"0";
    self.acc_y.text = @"0";
    self.acc_z.text = @"0";
    
    // Do any additional setup after loading the view, typically from a nib.
    
    self.motionManager.accelerometerUpdateInterval = 0.1;
    
    self.flag = false;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)switcher:(id)sender {
    if(self.flag == false){
        self.flag = true;
        //[self.motionManager startAccelerometerUpdates];
        [
        self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
            withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error)
        {
            [self outputAccelertionData:accelerometerData.acceleration];
            if(error){
                NSLog(@"%@", error);
            }
        }
        ];
    }
    else{
        [self.motionManager stopAccelerometerUpdates];
        self.flag = false;
    }

}

-(void)outputAccelertionData:(CMAcceleration)acceleration
{
    self.acc_x.text = [NSString stringWithFormat:@"%f", acceleration.x];
    self.acc_y.text = [NSString stringWithFormat:@"%f", acceleration.y];
    self.acc_z.text = [NSString stringWithFormat:@"%f", acceleration.z];
}

@end
