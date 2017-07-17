//
//  RemoteFeedService.h
//  FeedReader
//
//  Created by Francisco José Navarro García on 17/7/17.
//  Copyright © 2017 fjnavarro.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ItemModel;

// Si se cambia la url cambiarla en el Info.plist -> NSExceptionDomains
static NSString * const feedURL = @"http://www.xatakandroid.com/tag/feeds/rss2.xml";

typedef void (^RemoteFeedServiceCompletionBlock)(NSArray <ItemModel *>*object, NSError *error);

@interface RemoteFeedService : NSObject

-(void)getFeedOnCompletion: (RemoteFeedServiceCompletionBlock) completionBlock;

@end
