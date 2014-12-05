using UnityEngine;
using System.Collections;

public class WebViewTestScene : MonoBehaviour 
{
	public string m_url = "https://www.facebook.com/pages/purplelilgirl/134333726586702";

	public void OnButtonClick(string buttonName)
	{	
		if(buttonName == "ViewWebsite")
		{	
			if(!Application.isEditor)
			{	WebViewHandler.Instance.openURL(m_url);
			} else
			{	Debug.Log("WebViewTestScene:: Cannot view WebView in Editor.");
			}
		}
	}
}
