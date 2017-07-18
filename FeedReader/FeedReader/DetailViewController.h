//
//  DetailViewController.h
//  FeedReader
//
//  Created by Francisco José Navarro García on 18/7/17.
//  Copyright © 2017 fjnavarro.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ItemModel;

@interface DetailViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong) ItemModel *feed;

@end
