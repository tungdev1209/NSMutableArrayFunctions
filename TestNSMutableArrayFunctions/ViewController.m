//
//  ViewController.m
//  TestNSMutableArrayFunctions
//
//  Created by Tung Nguyen on 7/19/17.
//  Copyright © 2017 Tung Nguyen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *arr;
@property (nonatomic, assign) int numberLoops;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _arr = [[NSMutableArray alloc] init];
    _numberLoops = 10000;
    
    dispatch_queue_t q = dispatch_queue_create("com.test.mutablearray", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(q, ^{
        NSLog(@"%@", [NSThread currentThread]);
        
        for (int j = 0; j < _numberLoops; j++) {
            if (![_arr containsObject:@(j)]) {
                [_arr addObject:@(j)];
            }
        }
    });
    
    dispatch_async(q, ^{
        NSLog(@"%@", [NSThread currentThread]);
        
        for (int i = 0; i < _numberLoops; i++) {
            if (![_arr containsObject:@(i)]) {
                [_arr addObject:@(i)];
            }
        }
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
