//
//  Main_messageViewController.m
//  ProjectModelSample
//
//  Created by SDT-1 on 2014. 1. 14..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "Main_messageViewController.h"

@interface Main_messageViewController ()
@property (weak, nonatomic) IBOutlet UIView *btn_view;
@property (weak, nonatomic) IBOutlet UIImageView *btn_img;
@end

@implementation Main_messageViewController


- (void)onFullSizeScreen{
    self.btn_img.hidden = YES;
    self.btn_view.hidden =YES;
}




//- (IBAction)button_clicked:(id)sender {
//    
//        [UIView beginAnimations:nil context:nil];
//        CATransform3D _3Dt = CATransform3DRotate(self.btn_view.layer.transform, 3.14, 0.0,1.0,0.0);
//        CATransform3D _3Dt1 = CATransform3DScale(_3Dt, 2.3, 2.3, 2.3);
//        [UIView setAnimationRepeatCount:10];
//        [UIView setAnimationDuration:0.08];
//        self.btn_view.layer.transform=_3Dt1;
//        [UIView commitAnimations];
//    
//    
//    [self performSelector:@selector(onFullSizeScreen) withObject:nil afterDelay:1.0];
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
