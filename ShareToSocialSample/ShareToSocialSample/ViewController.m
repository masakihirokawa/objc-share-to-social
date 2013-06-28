//
//  ViewController.m
//  ShareToSocialSample
//
//  Created by 廣川政樹 on 2013/06/28.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

//Facebookへ投稿
- (IBAction)postToFacebook:(id)sender {
    SLComposeViewController *slc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [slc setInitialText:@"via Dolice Alternative Design"];
    [slc addImage:[UIImage imageNamed:POST_IMG_NAME]];
    [slc addURL:[NSURL URLWithString:@"http://dolice.net/mb/"]];
    [self presentViewController:slc animated:YES completion:nil];
}

//Twitterへ投稿
- (IBAction)postToTwitter:(id)sender {
    SLComposeViewController *slc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [slc setInitialText:@"via Dolice Alternative Design"];
    [slc addImage:[UIImage imageNamed:POST_IMG_NAME]];
    [slc addURL:[NSURL URLWithString:@"http://dolice.net/mb/"]];
    [self presentViewController:slc animated:YES completion:nil];
}

//LINEへ投稿
- (IBAction)postToLine:(id)sender {
    UIPasteboard *pasteboard = [UIPasteboard pasteboardWithUniqueName];
    [pasteboard setData:UIImagePNGRepresentation([UIImage imageNamed:POST_IMG_NAME]) forPasteboardType:@"public.png"];
    NSString *LineUrlString = [NSString stringWithFormat:@"line://msg/image/%@", pasteboard.name];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:LineUrlString]];
}

@end
