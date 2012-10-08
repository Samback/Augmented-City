//
//  ARPlayerViewController.m
//  Cherkasy
//
//  Created by Max on 09.10.12.
//  Copyright (c) 2012 Max Tymchii. All rights reserved.
//

#import "ARPlayerViewController.hpp"
#import "LayarPlayer.hpp" 

@interface ARPlayerViewController ()<LayarPlayerDelegate>
@property (strong, nonatomic) IBOutlet UIButton *play;

@end

@implementation ARPlayerViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)playClick:(UIButton *)sender {
    NSString *layerName = @"layername";
    NSString *consumerKey = @"consumerkey";
    NSString *consumerSecret = @"consumersecret";
    
    NSArray *oauthKeys = [NSArrayarrayWithObjects:LPConsumerKeyParameterKey, LPConsumerSecretParameterKey, nil];
    NSArray *oauthValues = [NSArray arrayWithObjects:consumerKey, consumerSecret, nil];
    NSDictionary *oauthParameters = [NSDictionary dictionaryWithObjects:oauthValues forKeys:oauthKeys];
    NSArray *layerKeys = [NSArray arrayWithObject:@"radius"];
    NSArray *layerValues = [NSArray arrayWithObject:@"1000"];
    NSDictionary *layerFilters = [NSDictionary dictionaryWithObjects:layerValues forKeys:layerKeys];
    
    LPAugmentedRealityViewController *augmentedRealityViewController = [[LPAugmentedRealityViewController alloc] init];  // NOTE that here we do not use "autorelease" because we enabled " Use Automatic Reference Counting" when the project      was created. If this option is disabled, you need to manage resource yourself in the code.
    
    augmentedRealityViewController.delegate = self;
    
    [self presentModalViewController:augmentedRealityViewController animated:YES];
    
    [augmentedRealityViewController loadLayerWithName:layerName oauthParameters:oauthParameters parameters:layerFilters options:LPMapViewDisabled | LPListViewDisabled];
}

- (void)viewDidUnload {
    [self setPlay:nil];
    [super viewDidUnload];
}
@end
