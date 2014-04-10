//
//  ISViewController.m
//  client
//
//  Created by Yuriy Buyanov on 09/04/14.
//  Copyright (c) 2014 Yuriy Buyanov. All rights reserved.
//

#import "ISViewController.h"
#import "ISSessionManager.h"
#import "UIKit+AFNetworking.h"
#import "MRProgress.h"
#import "ISSearchResults.h"
#import "ISItem.h"

static const NSString* identifier = @"itemCell";


@interface ISViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *data;

@end

@implementation ISViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    
    NSDictionary* params = @{
         @"term": @"app",
         @"media": @"software",
         @"limit": @"20"
    };
    
    MRProgressOverlayView* progress =[MRProgressOverlayView showOverlayAddedTo:self.view title:@"Loading" mode:MRProgressOverlayViewModeIndeterminate animated:YES];
    
    
    
    NSURLSessionDataTask* task = [[ISSessionManager sharedManager] searchWithParams:params success:^(NSURLSessionDataTask *task, ISSearchResults *results) {
        self.data = results.results;
        NSLog(@"Results count: %d", self.data.count);
        [self.tableView reloadData];
        [progress hide:YES];

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [progress hide:YES];
        NSLog(@"Error: %@", error);
    }];
    
    [UIAlertView showAlertViewForTaskWithErrorOnCompletion:task delegate:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    ISItem* item = self.data[indexPath.row];
    
    [cell.imageView cancelImageRequestOperation];
    [cell.imageView setImageWithURL:item.artworkUrl60 placeholderImage:[UIImage imageNamed:@"Placeholder"]];
    
    cell.textLabel.text = item.trackName;
    return cell;
}

@end
