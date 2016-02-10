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
@property (weak, nonatomic) IBOutlet UIButton *forwardButton;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self goToURLString:@"http://www.suilapp.com"];
    [self.backButton setEnabled:NO];
    [self.forwardButton setEnabled:NO];
}

-(void)goToURLString:(NSString *)urlString {
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self goToURLString:textField.text];
    [textField resignFirstResponder];
    
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    [self.networkActivityIndicator startAnimating];

}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.networkActivityIndicator stopAnimating];
    [self.backButton setEnabled:[self.webView canGoBack]];
    [self.forwardButton setEnabled:[self.webView canGoForward]];
}

- (IBAction)onBackButtonPressed:(id)sender {
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }
}

- (IBAction)onForwardButtonPressed:(id)sender {
    if ([self.webView canGoForward]) {
        [self.webView goForward];
    }
}

- (IBAction)onStopLoadingButtonPressed:(id)sender {
    [self.webView stopLoading];
    [self webViewDidFinishLoad:self.webView];
}

- (IBAction)onReloadButtonPressed:(id)sender {
    [self.webView reload];
}

- (IBAction)comingSoon:(id)sender {
    UIAlertController *comingSoonAlert = [UIAlertController alertControllerWithTitle:@"Coming soon!" message:@"Currently under construction" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {[comingSoonAlert dismissViewControllerAnimated:YES completion:nil];}
                                    ];
    
    [comingSoonAlert addAction:defaultAction];
    [self presentViewController:comingSoonAlert animated:YES completion:nil];
}

@end
