//
//  ViewController.m
//  ProjectModelSample
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>

@interface ViewController ()<UIScrollViewDelegate>
{
    sqlite3 *db;
    UIScrollView *scroll;
}
@property (strong, nonatomic) IBOutlet UIView *manuView;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self openDB];
    [self selectMessages];
    
    //self.view.backgroundColor = [UIColor redColor];
    scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //scroll.pagingEnabled = YES;
    
    NSInteger numberOfViews = 3;
    
//    for (int i = 0; i < numberOfViews; i++) {
//        CGFloat yOrigin = i * self.view.frame.size.height;
//        UIView *awesomeView = [[UIView alloc] initWithFrame:CGRectMake(0, yOrigin, self.view.frame.size.width, self.view.frame.size.height)];
//        awesomeView.backgroundColor = [UIColor colorWithRed:0.5/i green:0.5 blue:0.5 alpha:1];
//        //[scroll addSubview:awesomeView];
//    }
    for (int i=1; i<4; i++) {
        UIView *addview = [self.view viewWithTag:i];
        addview.frame = CGRectMake(0,300*(i-1), 320,300 );
        [scroll addSubview:addview];
    }
    
    scroll.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * numberOfViews);
    [self.view addSubview:scroll];

    

}

- (void)openDB{
    NSString *dbFilePath = [[NSBundle mainBundle] pathForResource:@"db" ofType:@"sqlite"];
    
    int ret = sqlite3_open([dbFilePath UTF8String], &db);
    
    NSAssert1(SQLITE_OK == ret, @"err on opening", sqlite3_errmsg(db));
    NSLog(@"success");
}

-(void)selectMessages {
    NSString *queryStr = @"SELECT * from message";
    sqlite3_stmt *stmt;
    
    sqlite3_prepare_v2(db, [queryStr UTF8String], -1, &stmt, NULL);
    
    while (SQLITE_ROW == sqlite3_step(stmt)) {
        char *sender = (char *)sqlite3_column_text(stmt, 0);
        NSString *senderString = [NSString stringWithCString:sender encoding:NSUTF8StringEncoding];
        NSLog(@"sender %@",senderString);
    }
}

- (IBAction)button_clicked:(id)sender {
    
    
    [UIView beginAnimations:nil context:nil];
    
    
    CATransform3D _3Dt = CATransform3DRotate(self.btn1.layer.transform, 3.14,0.0,1.0,0.0);
    CATransform3D _3Dt1 = CATransform3DScale(_3Dt, 2.0, 2.0, 0.0);
    //CATransform3D _3Dt2 = CATransform3DTranslate(_3Dt1,0, 85, 0.0);
    //CATransform3D _3Dt2 = CATransform3DTranslate(self.btn_num2.layer.transform, 0.0, 171, 0.0);
    
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationDuration:0.5];
    self.btn1.layer.transform=_3Dt1;
    [UIView commitAnimations];
    
    
    [self performSelector:@selector(massagePageOn) withObject:nil afterDelay:0.5];
}

-(void)massagePageOn{
    
     UIView *addview = [self.view viewWithTag:10];
    //scroll.hidden=YES;
    addview.frame = CGRectMake(0,20, addview.frame.size.width, addview.frame.size.height );
    addview.hidden = NO;
    [self.view addSubview:addview];
    
}

- (IBAction)btn2:(id)sender {
    [UIView beginAnimations:nil context:nil];
    
    
    CATransform3D _3Dt = CATransform3DRotate(self.btn2.layer.transform, 3.14,0.0,1.0,0.0);
    CATransform3D _3Dt1 = CATransform3DScale(_3Dt, 2.0, 2.0, 0.0);
    //CATransform3D _3Dt2 = CATransform3DTranslate(_3Dt1,0, 85, 0.0);
    //CATransform3D _3Dt2 = CATransform3DTranslate(self.btn_num2.layer.transform, 0.0, 171, 0.0);
    
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationDuration:0.5];
    self.btn2.layer.transform=_3Dt1;
    [UIView commitAnimations];
    
}
- (IBAction)btn3:(id)sender {
    [UIView beginAnimations:nil context:nil];
    
    
    CATransform3D _3Dt = CATransform3DRotate(self.btn3.layer.transform, 3.14,0.0,1.0,0.0);
    CATransform3D _3Dt1 = CATransform3DScale(_3Dt, 2.0, 2.0, 0.0);
    //CATransform3D _3Dt2 = CATransform3DTranslate(_3Dt1,0, 85, 0.0);
    //CATransform3D _3Dt2 = CATransform3DTranslate(self.btn_num2.layer.transform, 0.0, 171, 0.0);
    
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationDuration:0.5];
    self.btn3.layer.transform=_3Dt1;
    [UIView commitAnimations];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
