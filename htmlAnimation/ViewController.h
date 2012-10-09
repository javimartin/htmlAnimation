//
//  ViewController.h
//  htmlAnimation
//
//  Created by Javier Martin on 9/10/12.
//  Copyright (c) 2012 Javier Martin de Valmaseda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;

- (IBAction)buttonPressed:(id)sender;
@end
