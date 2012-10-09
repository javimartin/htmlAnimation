//
//  ViewController.m
//  htmlAnimation
//
//  Created by Javier Martin on 9/10/12.
//  Copyright (c) 2012 Javier Martin de Valmaseda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
-(void)loadDocument:(NSString*)documentName inView:(UIWebView*)webView
;

@end

@implementation ViewController
@synthesize webView;

- (void)viewDidLoad
{
    
    //[webView loadHTMLString:@"<script src=\"calc.js\"></script>" baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath]]];
    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"jsTest" ofType:@"html"]isDirectory:NO]]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)loadDocument:(NSString*)documentName inView:(UIWebView*)webView
{
    NSString *path = [[NSBundle mainBundle] pathForResource:documentName ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}


- (IBAction)buttonPressed:(id)sender {
    
    NSString *function = [[NSString alloc] initWithFormat: @"area(%i)", 10];
    NSString *result = [self.webView stringByEvaluatingJavaScriptFromString:function];
    NSLog(@"Area is: %@", result);

    // Calling -loadDocument:inView:
    //[self loadDocument:@"image.html" inView:webView];
    
}
@end
