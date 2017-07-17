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

-(void)getFeedOnCompletion: (RemoteFeedServiceCompletionBlock) completionBlock {
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
                 itemModel.link = [NSURL URLWithString:[item objectForKey:@"link"]];
                 itemModel.content = [item objectForKey:@"description"];
                 itemModel.descrip = [self cleanHTMLWithString:[item objectForKey:@"description"]];
                 itemModel.imageLink = [self getImageUrlWithString:[item objectForKey:@"description"]];
                 
                 [results addObject:itemModel];
             }
             
             // Devolvemos los resultados
             completionBlock(results, nil);
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"Error WS: %@", error);
             
             completionBlock(nil, error);
         }];
}

#pragma mark - Utilities

-(NSString *)cleanHTMLWithString: (NSString *) string {
    // Eliminamos todo el html del
    NSAttributedString *attr = [[NSAttributedString alloc] initWithData:[string dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                                                          NSCharacterEncodingDocumentAttribute:@(NSUTF8StringEncoding)}
                                                     documentAttributes:nil
                                                                  error:nil];
    NSString *stringClean = [attr string];
    
    if ([stringClean hasPrefix:@"\n"]) {
        // Si empezamos con un salto de línea, limpiamos la cadena
        stringClean = [stringClean substringFromIndex:1];
    }
    
    return  stringClean;
}

-(NSURL *)getImageUrlWithString: (NSString *) string {
    // Obtenemos la primera imágen del html
    string = [string substringFromIndex:[string rangeOfString:@"src="].location+[@"src=" length]+1];
    string = [string substringToIndex:[string rangeOfString:@"\""].location];
    
    return [NSURL URLWithString:[@"http:" stringByAppendingString:string]];
}

@end
