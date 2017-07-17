//
//  RemoteFeedService.m
//  FeedReader
//
//  Created by Francisco José Navarro García on 17/7/17.
//  Copyright © 2017 fjnavarro.com. All rights reserved.
//

#import "RemoteFeedService.h"
#import <AFNetworking/AFHTTPSessionManager.h>
#import <XMLDictionary/XMLDictionary.h>
#import "ItemModel.h"

@implementation RemoteFeedService

+(void)getFeedOnCompletion: (RemoteFeedServiceCompletionBlock) completionBlock {
    // Url del Feed
    NSURL *url = [NSURL URLWithString:feedURL];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // Obtenemos la respuesta para el XML
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    // Realizamos la conexión al Feed
    [manager GET:url.absoluteString
      parameters:nil
        progress:^(NSProgress * _Nonnull uploadProgress) {
            NSLog(@"%@", uploadProgress);
        }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             // Convertimos el XML en un diccionario
             NSDictionary *xmlDict =[NSDictionary dictionaryWithXMLData:responseObject];
             NSArray *items = [[xmlDict objectForKey:@"channel"] objectForKey:@"item"];
             
             NSMutableArray *results = [NSMutableArray new];
             
             for (NSDictionary *item in items) {
                 ItemModel *itemModel = [ItemModel new];
                 itemModel.title = [item objectForKey:@"title"];
                 itemModel.link = [item objectForKey:@"link"];
                 itemModel.descrip = [item objectForKey:@"description"];
                 
                 [results addObject:itemModel];
             }
             
             // Devolvemos los resultados
             completionBlock(results, nil);
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"Error WS: %@", error);
             
             completionBlock(nil, error);
         }];
}

@end
