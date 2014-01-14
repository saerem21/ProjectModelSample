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

@end

@implementation Main_messageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)button_clicked:(id)sender {
    
        [UIView beginAnimations:nil context:nil];
        CATransform3D _3Dt = CATransform3DRotate(self.btn_view.layer.transform, 3.14, 0.0,1.0,0.0);
        [UIView setAnimationRepeatCount:100];
        [UIView setAnimationDuration:0.08];
        self.btn_view.layer.transform=_3Dt;
        [UIView commitAnimations];
    
}

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
