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
    self.acc_x.text = @"";
    self.acc_y.text = @"";
    self.acc_z.text = @"";
    
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
        [self.motionManager startAccelerometerUpdates];
        CMAccelerometerData* data = [self.motionManager accelerometerData];
        while(data.acceleration.x == 0.0){
            data = [self.motionManager accelerometerData];
        }
        self.acc_x.text = [NSString stringWithFormat:@"%f", data.acceleration.x];
        self.acc_y.text = [NSString stringWithFormat:@"%f", data.acceleration.y];
        self.acc_z.text = [NSString stringWithFormat:@"%f", data.acceleration.z];
    }
    else{
        [self.motionManager stopAccelerometerUpdates];
        self.flag = false;
    }

}
@end
