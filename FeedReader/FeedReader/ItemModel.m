//
//  itemModel.m
//  FeedReader
//
//  Created by Francisco José Navarro García on 17/7/17.
//  Copyright © 2017 fjnavarro.com. All rights reserved.
//

#import "ItemModel.h"

@implementation ItemModel

#pragma mark - Métodos de Clase - Constructores

+(instancetype) itemWithTitle: (NSString *) title
                 andImageLink: (NSURL *) imageLink
                      andLink: (NSURL *) link
               andDescription: (NSString *) description
                   andContent: (NSString *) content {
    
    return [[self alloc] initWithTitle:title
                          andImageLink:imageLink
                               andLink:link
                        andDescription:description
                            andContent:content];
}

#pragma mark - Métodos de Instancia - Inicializadores

// Designado
-(instancetype) initWithTitle: (NSString *) title
                 andImageLink: (NSURL *) imageLink
                      andLink: (NSURL *) link
               andDescription: (NSString *) description
                   andContent: (NSString *) content {
    
    if (self = [super init]) {
        // Asignamos los parámetros a las variables de instancia
        _title = title;
        _imageLink = imageLink;
        _link = link;
        _descrip = description;
        _content = content;
    }
    
    return self;
}

@end
