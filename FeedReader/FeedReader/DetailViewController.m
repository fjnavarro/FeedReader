//
//  DetailViewController.m
//  FeedReader
//
//  Created by Francisco José Navarro García on 18/7/17.
//  Copyright © 2017 fjnavarro.com. All rights reserved.
//

#import "DetailViewController.h"
#import "ItemModel.h"

@interface DetailViewController ()

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIWebView *contentWebView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleLabel.text = self.feed.title;
    
    [self loadContent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushShowInSafari:(id)sender {
    NSDictionary *options = @{UIApplicationOpenURLOptionUniversalLinksOnly : @NO};
    [[UIApplication sharedApplication] openURL:self.feed.link
                                       options:options
                             completionHandler:nil];
}

#pragma mark - Utilities

-(void)loadContent {
    
    // Montamos el html del contenido
    NSString *contentHTML = [@[
                               @"<html><head></head><body>",
                               self.feed.content,
                               @"</body></html>"] componentsJoinedByString:@""];
    
    // Cargamos el contenido en el webview
    [self.contentWebView loadHTMLString:contentHTML
                                baseURL:nil];
}

@end
