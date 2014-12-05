using UnityEngine;
using System;
using System.Collections;
using System.Runtime.InteropServices;

public class WebViewHandler : Singleton<WebViewHandler> 
{
	#if UNITY_IPHONE
	[DllImport ("__Internal")] private static extern void _OpenURL(string url);
	#endif
	
	public void openURL(string url)
	{
		if(!Application.isEditor)
		{	#if UNITY_IPHONE
			_OpenURL(url);
			#endif
		}	else
		{	Debug.Log("WebViewHandler:: Cannot open WebView in Editor.");
		}
	}
}	
