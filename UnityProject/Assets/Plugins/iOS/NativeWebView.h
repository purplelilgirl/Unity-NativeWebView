#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

// Root view controller of Unity screen
extern UIViewController *UnityGetGLViewController();

@interface NativeWebView : UINavigationController
{   UIWebView *webView;
}

-(void) openURL: (const char*) urlString;
-(void) dismissModal;

@end
