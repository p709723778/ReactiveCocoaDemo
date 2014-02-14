//
//  ButtonViewController.m
//  ReactiveCocoaDemo
//
//  Created by Gary on 14-2-14.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import "ButtonViewController.h"
#import "RSSnippetsDataSource.h"

@interface ButtonViewController ()

@property (weak, nonatomic) IBOutlet UIButton *xibButton;


@end

@implementation ButtonViewController

+ (void)load
{
    [[RSSnippetsDataSource sharedInstance] addWithDescription:@"UIButton RACCommand Demo" demoClass:[self class]];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //代码创建按钮
    NSString *helloWorld = @"代码按钮Say";
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeSystem];
    myButton.frame = CGRectMake(100, 100, 100, 50);
    [myButton setTitle:@"代码按钮Say" forState:UIControlStateNormal];
    [self.view addSubview:myButton];
    myButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        NSLog(@"%@", helloWorld);
        return [RACSignal empty];
    }];
    
    //Xib按钮
    NSString *helloWorld1 = @"RACCommand XIB Button";
    self.xibButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        NSLog(@"%@", helloWorld1);
        return [RACSignal empty];
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
