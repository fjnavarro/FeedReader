//
//  ListFeedTableViewController.m
//  FeedReader
//
//  Created by Francisco José Navarro García on 17/7/17.
//  Copyright © 2017 fjnavarro.com. All rights reserved.
//

#import "ListFeedTableViewController.h"
#import "RemoteFeedService.h"
#import "ItemModel.h"
#import "ItemTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ListFeedTableViewController ()

@property (nonatomic, strong) NSArray<ItemModel *> *feeds;

@end

@implementation ListFeedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Obtenemos feeds
    [self loadFeeds];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.feeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"CellIdentifier";
    
    // Obtenemos celda tuneada
    ItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[ItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                        reuseIdentifier:cellId];
    }
    
    // Obtenemos el item activo
    ItemModel *item = [self.feeds objectAtIndex:indexPath.row];
    
    // Configuramos la celda
    cell.titleLabel.text = item.title;
    cell.descriptionLabel.text = item.descrip;
    [cell.imageView sd_setImageWithURL:item.imageLink];
//    [cell.imageView sd_setImageWithURL:item.imageLink
//                             completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//                                 if (error) {
//                                     NSLog(@"%@", error.localizedDescription);
//                                 }else{
//                                     NSLog(@"image: %@", image);
//                                 }
//                             }];
    
    return cell;
}

#pragma mark - Table view delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Tuneamos la altura de la celda
    return 200.0f;
}

#pragma mark - Utilites
-(void)loadFeeds {
    // Obtenemos los feeds del webservices
    RemoteFeedService *remoteFeedS = [RemoteFeedService new];
    
    [remoteFeedS getFeedOnCompletion:^(NSArray<ItemModel *> *object, NSError *error) {
        if (error != nil) {
            // Ups algo pasó
        } else {
            self.feeds = object;
            
            [self.tableView reloadData];
        }
    }];
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
