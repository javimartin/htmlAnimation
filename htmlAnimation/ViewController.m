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
    //load html file on UIWebView
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"jsTest" ofType:@"html"]isDirectory:NO]]];
    
    //load JavaScript file(using html string) in UIWebView
    //[webView loadHTMLString:@"<script src=\"calc.js\"></script>" baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath]]];
    
    //---load jquery libraries
    /*NSString *jqueryCDN = @"http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js";
    NSData *jquery = [NSData dataWithContentsOfURL:[NSURL URLWithString:jqueryCDN]];
    NSString *jqueryString = [[NSMutableString alloc] initWithData:jquery encoding:NSUTF8StringEncoding];
    [webView stringByEvaluatingJavaScriptFromString:jqueryString];
   //---load jquery libraries
    */
    //Load html file with JavaScript code
   /* NSString *filePath = [[NSBundle mainBundle] pathForResource:@"jqueryTest" ofType:@"js" inDirectory:@""];
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    NSString *jsString = [[NSMutableString alloc] initWithData:fileData encoding:NSUTF8StringEncoding];
    
    [webView stringByEvaluatingJavaScriptFromString:jsString];*/
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)loadDocument:(NSString*)documentName inView:(UIWebView*)webView
{
    //load document (html) into UIWebView
    NSString *path = [[NSBundle mainBundle] pathForResource:documentName ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}


- (IBAction)buttonPressed:(id)sender {
    
    //Calling JavaScript function embbedded in the webView (previously html loaded)
    NSString *function = [[NSString alloc] initWithFormat: @"area(%i)", 10];
    NSString *result = [self.webView stringByEvaluatingJavaScriptFromString:function];
    NSLog(@"Area is: %@", result);

    // Calling -loadDocument:inView:
    //[self loadDocument:@"image.html" inView:webView];
    
}
@end
