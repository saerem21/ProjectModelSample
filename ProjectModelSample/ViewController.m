//
//  ViewController.m
//  ProjectModelSample
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>

@interface ViewController ()
{
    sqlite3 *db;
}
@property (weak, nonatomic) IBOutlet UIView *messageView;
@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self openDB];
    [self selectMessages];
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
    CATransform3D _3Dt = CATransform3DRotate(self.messageView.layer.transform, 3.14, 0.0,1.0,0.0);
    CATransform3D _3Dt1 = CATransform3DScale(_3Dt, 2.3, 2.3, 2.3);
    [UIView setAnimationRepeatCount:10];
    [UIView setAnimationDuration:0.08];
    self.messageView.layer.transform=_3Dt1;
    [UIView commitAnimations];
    
    
    //[self performSelector:@selector(onFullSizeScreen) withObject:nil afterDelay:1.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
