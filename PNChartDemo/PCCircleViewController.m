//
//  PCCircleViewController.m
//  PNChartDemo
//
//  Created by 肖文之 on 14/12/1.
//  Copyright (c) 2014年 kevinzhow. All rights reserved.
//

#import "PCCircleViewController.h"
#include "PNChart.h"

@interface PCCircleViewController ()

- (IBAction)sliderValueChanged:(UISlider *)sender;

@property (weak, nonatomic) PNCircleChart *circleChart;
@property (weak, nonatomic) UISlider *slider;

@end

@implementation PCCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Add circle chart
    UILabel * circleChartLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, SCREEN_WIDTH, 30)];
    circleChartLabel.text = @"Circle Chart";
    circleChartLabel.textColor = PNFreshGreen;
    circleChartLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:23.0];
    circleChartLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:circleChartLabel];
    
    PNCircleChart *circleChart = [[PNCircleChart alloc] initWithFrame:CGRectMake(0, 80.0, SCREEN_WIDTH, 100.0)
                                                                 total:@100
                                                               current:@0
                                                             clockwise:YES
                                                                shadow:YES];
    circleChart.backgroundColor = [UIColor clearColor];
    [circleChart setStrokeColor:PNGreen];
    [circleChart setStrokeColorGradientStart:[UIColor blueColor]];
    [circleChart strokeChart];
    [self.view addSubview:circleChart];
    self.circleChart = circleChart;
    
    self.title = @"Circle Chart";
    
    // add slider to update circleChart dynamically
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(10, 400, SCREEN_WIDTH-20, 30)];
    slider.maximumValue = 100.0;
    slider.minimumValue = 0.0;
    slider.value = 0;
    slider.continuous = NO;
    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    self.slider = slider;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderValueChanged:(UISlider *)sender
{
    [self.circleChart setCurrent:[NSNumber numberWithFloat:sender.value]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
