#import "NativeWebView.h"

@implementation NativeWebView

- (id)init
{
    webView = [[UIWebView alloc] init];
    
    UIViewController *webViewController = [[UIViewController alloc] init];
    webViewController.view = webView;
    
    self = [super initWithRootViewController: webViewController];
    
    self.navigationBar.barStyle = UIBarStyleDefault;
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style: UIBarButtonItemStylePlain target:self action: @selector(dismissModal)];
    [self.navigationBar.topItem setLeftBarButtonItem: cancelButton];
    
    return self;
}

-(void) openURL: (const char*) urlString
{
    NSURL *url = [[NSURL alloc] initWithString: [NSString stringWithUTF8String: urlString]];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [webView loadRequest:request];
        
    [UnityGetGLViewController() presentModalViewController: self animated: YES];
}

-(void) dismissModal
{   [UnityGetGLViewController() dismissModalViewControllerAnimated: YES];
}

-(BOOL) shouldAutorotate
{   return false;
}

@end

static NativeWebView *nativeWebViewPlugin = nil;

extern "C"
{
	void _OpenURL(const char* url)
	{
        if (nativeWebViewPlugin == nil)
			nativeWebViewPlugin = [[NativeWebView alloc] init];
        
        [nativeWebViewPlugin openURL: url];
    }
}