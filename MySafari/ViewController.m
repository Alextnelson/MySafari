//
//  ViewController.m
//  MySafari
//
//  Created by Alexander Nelson on 1/28/16.
//  Copyright © 2016 218 Apps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate, UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *networkActivityIndicator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self goToURLString:@"http://www.suilapp.com"];
}

-(void)goToURLString:(NSString *)urlString {
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSURL *url = [[NSURL alloc] initWithString:self.urlTextField.text];
    return url;
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    [self.networkActivityIndicator startAnimating];

}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.networkActivityIndicator stopAnimating];
}

@end
