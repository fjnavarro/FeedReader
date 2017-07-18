//
//  itemModel.h
//  FeedReader
//
//  Created by Francisco José Navarro García on 17/7/17.
//  Copyright © 2017 fjnavarro.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemModel : NSObject

@property (nonatomic, copy) NSString *descrip;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, strong) NSURL *link;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSURL *imageLink;


+(instancetype) itemWithTitle: (NSString *) title
                 andImageLink: (NSURL *) imageLink
                      andLink: (NSURL *) link
               andDescription: (NSString *) description
                   andContent: (NSString *) content;

@end
