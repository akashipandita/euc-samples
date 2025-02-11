# Mozilla Firefox #

## Overview
- **Authors**: Robert Terakedis
- **Email**: rterakedis@vmware.com
- **Date Created**: 5/9/2018
- **Supported Platforms**: AirWatch version 9.3+
- **Tested on macOS Versions**: macOS High Sierra

## Purpose
<!-- Summary Start -->
Firefox for Enterprise allows administrators to manage certain settings within the browser.  It also provides the flexibility for admins to better control the browser release cadence within their organization by adopting either the rapid release or the extended support release.   One item to note is that policy availability does differ between the two releases.   Policies for macOS are now deployed via a mobileconfig file (or via profile payloads in your MDM).  Be mindful of which policies you wish to deploy, as some are only available for the Extended Support Release (ESR) version of Firefox.
<!-- Summary End -->
> The ESR release is a SEPARATE download.  ESR functionality does not necessarily apply in the non-ESR download/installer.

To deploy with VMware Workspace ONE UEM, add FireFox as an internal application and then customize the mobileconfig to your liking by using the following template:

The contents of the XML should look similar to this (modify or remove items as needed):

```XML
<dict>
    <key>PayloadDisplayName</key>
    <string>Firefox ESR Policies</string>
    <key>PayloadEnabled</key>
    <true/>
    <key>PayloadIdentifier</key>
    <string>org.mozilla.firefox.BCADDC78-843E-4112-936A-DAB8EEEF514C</string>
    <key>PayloadType</key>
    <string>org.mozilla.firefox</string>
    <key>PayloadUUID</key>
    <string>BCADDC78-843E-4112-936A-DAB8EEEF514C</string>
    <key>PayloadVersion</key>
    <key>EnterprisePoliciesEnabled</key>
	<false/>
	<key>AppUpdateURL</key>
	<string>https://www.example.com/update.xml</string>
	<key>Authentication</key>
	<dict>
		<key>SPNEGO</key>
		<array>
			<string>mydomain.com</string>
			<string>https://myotherdomain.com</string>
		</array>
		<key>Delegated</key>
		<array>
			<string>mydomain.com</string>
			<string>https://myotherdomain.com</string>
		</array>
		<key>NTLM</key>
		<array>
			<string>mydomain.com</string>
			<string>https://myotherdomain.com</string>
		</array>
		<key>AllowNonFQDN</key>
		<dict>
			<key>SPNEGO</key>
			<true/>
			<key>NTLM</key>
			<true/>
		</dict>
		<key>AllowProxies</key>
		<dict>
			<key>SPNEGO</key>
			<true/>
			<key>NTLM</key>
			<true/>
		</dict>
		<key>Locked</key>
		<true/>
	</dict>
	<key>BlockAboutAddons</key>
	<true/>
	<key>BlockAboutConfig</key>
	<true/>
	<key>BlockAboutProfiles</key>
	<true/>
	<key>BlockAboutSupport</key>
	<true/>
	<key>Bookmarks</key>
	<array>
		<dict>
			<key>Title</key>
			<string>Example1</string>
			<key>URL</key>
			<string>https://www.example.org</string>
			<key>Favicon</key>
			<string>https://www.example.org/favicon.ico</string>
			<key>Placement</key>
			<string>toolbar</string>
			<key>Folder</key>
			<string>Example1Folder</string>
		</dict>
		<dict>
			<key>Title</key>
			<string>Example2</string>
			<key>URL</key>
			<string>https://www.example.com</string>
			<key>Favicon</key>
			<string>https://www.example.com/favicon.ico</string>
			<key>Placement</key>
			<string>menu</string>
			<key>Folder</key>
			<string>Example2Folder</string>
		</dict>
	</array>
	<key>CaptivePortal</key>
	<false/>
	<key>Certificates</key>
	<dict>
		<key>ImportEnterpriseRoots</key>
		<true/>
		<key>Install</key>
		<array>
			<string>cert1.der</string>
			<string>cert2.pem</string>
		</array>
	</dict>
	<key>Cookies</key>
	<dict>
		<key>Allow</key>
		<array>
			<string>https://www.example.org/</string>
		</array>
		<key>Block</key>
		<array>
			<string>https://www.example.edu/</string>
		</array>
		<key>Default</key>
		<false/>
		<key>AcceptThirdParty</key>
		<string>never</string>
		<key>ExpireAtSessionEnd</key>
		<true/>
		<key>RejectTracker</key>
		<true/>		
		<key>Locked</key>
		<true/>
	</dict>
	<key>DefaultDownloadDirectory</key>
	<string>${home}/Downloads</string>
	<key>DownloadDirectory</key>
	<string>${home}/Downloads</string>
	<key>DNSOverHTTPS</key>
	<dict>
		<key>Enabled</key>
		<false/>
		<key>ProviderURL</key>
		<string>URL_TO_ALTERNATE_PROVIDER</string>
		<key>Locked</key>
		<true/>
	</dict>
	<key>DisableAppUpdate</key>
	<true/>
	<key>DisableBuiltinPDFViewer</key>
	<true/>
	<key>DisableDeveloperTools</key>
	<true/>
	<key>DisableFeedbackCommands</key>
	<true/>
	<key>DisableFirefoxAccounts</key>
	<true/>
	<key>DisableFirefoxScreenshots</key>
	<true/>
	<key>DisableFirefoxStudies</key>
	<true/>
	<key>DisableForgetButton</key>
	<true/>
	<key>DisableFormHistory</key>
	<true/>
	<key>DisableMasterPasswordCreation</key>
	<true/>
	<key>DisablePasswordReveal</key>
	<true/>
	<key>DisablePocket</key>
	<true/>
	<key>DisablePrivateBrowsing</key>
	<true/>
	<key>DisableProfileImport</key>
	<true/>
	<key>DisableProfileRefresh</key>
	<true/>
	<key>DisableSafeMode</key>
	<true/>
	<key>DisableSecurityBypass</key>
	<dict>
		<key>InvalidCertificate</key>
		<true/>
		<key>SafeBrowsing</key>
		<true/>
	</dict>
	<key>DisableSetDesktopBackground</key>
	<true/>
	<key>DisableSystemAddonUpdate</key>
	<true/>
	<key>DisableTelemetry</key>
	<true/>
	<key>DisplayBookmarksToolbar</key>
	<true/>
	<key>DontCheckDefaultBrowser</key>
	<true/>
	<key>EnableTrackingProtection</key>
	<dict>
		<key>Value</key>
		<true/>
		<key>Locked</key>
		<true/>
		<key>Cryptomining</key>
		<true/>
		<key>Fingerprinting</key>
		<true/>
	</dict>
	<key>Extensions</key>
	<dict>
		<key>Install</key>
		<array>
			<string>https://addons.mozilla.org/firefox/downloads/file/1053714/ghostery_privacy_ad_blocker-8.2.4-an+fx.xpi</string>
		</array>
		<key>Uninstall</key>
		<array/>
		<key>Locked</key>
		<array>
			<string>firefox@ghostery.com</string>
		</array>
	</dict>
	<key>ExtensionSettings</key>
	<dict>
		<key>*</key>
		<dict>
			<key>blocked_install_message</key>
			<string>Custom error message.</string>
			<key>install_sources</key>
			<array>
				<string>https://addons.mozilla.org/</string>
			</array>
			<key>installation_mode</key>
			<string>blocked</string>
		</dict>
		<key>uBlock0@raymondhill.net</key>
		<dict>
			<key>installation_mode</key>
			 <string>force_installed</string>
			<key>install_url</key>
			<string>https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi</string>
		</dict>
	</dict>
	<key>ExtensionUpdate</key>
	<false/>
	<key>FirefoxHome</key>
	<dict>
		<key>Search</key>
		<true/>
		<key>TopSites</key>
		<true/>
		<key>Highlights</key>
		<true/>
		<key>Pocket</key>
		<false/>
		<key>Snippets</key>
		<false/>
		<key>Locked</key>
		<true/>
	</dict>
	<key>FlashPlugin</key>
	<dict>
		<key>Allow</key>
		<array>
			<string>https://www.example.com</string>
		</array>
		<key>Block</key>
		<array>
			<string>https://www.example.org</string>
		</array>
		<key>Default</key>
		<true/>
		<key>Locked</key>
		<true/>
	</dict>
	<key>HardwareAcceleration</key>
	<false/>
	<key>Homepage</key>
	<dict>
		<key>URL</key>
		<string>http://example.com</string>
		<key>Locked</key>
		<true/>
		<key>Additional</key>
		<array>
			<string>https://www.example.com/extra-home1.htm</string>
			<string>https://www.example.com/extra-home2.htm</string>
			<string>https://www.example.com/extra-home3.htm</string>
		</array>
		<key>StartPage</key>
		<string>homepage</string>
	</dict>
	<key>InstallAddonsPermission</key>
	<dict>
		<key>Allow</key>
		<array>
			<string>https://example.org</string>
			<string>https://example.edu</string>
		</array>
		<key>Default</key>
		<false/>
	</dict>
	<key>LocalFileLinks</key>
	<array>
		<string>http://example.org</string>
		<string>http://example.edu</string>
	</array>
	<key>NetworkPrediction</key>
	<false/>
	<key>NewTabPage</key>
	<false/>
	<key>NoDefaultBookmarks</key>
	<true/>
	<key>OfferToSaveLogins</key>
	<false/>
	<key>OfferToSaveLoginsDefault</key>
	<true/>
	<key>OverrideFirstRunPage</key>
	<string>https://www.example.com</string>
	<key>OverridePostUpdatePage</key>
	<string></string>
	<key>PasswordManagerEnabled</key>
	<false/>
	<key>Permissions</key>
	<dict>
		<key>Camera</key>
		<dict>
			<key>Allow</key>
			<array>
				<string>https://example.org</string>
			</array>
			<key>Block</key>
			<array>
				<string>https://example.edu</string>
			</array>
			<key>BlockNewRequests</key>
			<true/>
			<key>Locked</key>
			<true/>
		</dict>
		<key>Microphone</key>
		<dict>
			<key>Allow</key>
			<array>
				<string>https://example.org</string>
			</array>
			<key>Block</key>
			<array>
				<string>https://example.edu</string>
			</array>
			<key>BlockNewRequests</key>
			<true/>
			<key>Locked</key>
			<true/>
		</dict>
		<key>Location</key>
		<dict>
			<key>Allow</key>
			<array>
				<string>https://example.org</string>
			</array>
			<key>Block</key>
			<array>
				<string>https://example.edu</string>
			</array>
			<key>BlockNewRequests</key>
			<true/>
			<key>Locked</key>
			<true/>
		</dict>
		<key>Notifications</key>
		<dict>
			<key>Allow</key>
			<array>
				<string>https://example.org</string>
			</array>
			<key>Block</key>
			<array>
				<string>https://example.edu</string>
			</array>
			<key>BlockNewRequests</key>
			<true/>
			<key>Locked</key>
			<true/>
		</dict>
	</dict>
	<key>PopupBlocking</key>
	<dict>
		<key>Allow</key>
		<array>
			<string>https://www.example.org</string>
			<string>https://www.example.edu</string>
		</array>
		<key>Default</key>
		<true/>
		<key>Locked</key>
		<true/>
	</dict>
	<key>Preferences</key>
	<dict>
		<key>app.update.auto</key>
		<true/>
		<key>security.default_personal_cert</key>
		<string>Ask Every Time</string>
		<key>security.osclientcerts.autoload</key>
	        <true/>
	</dict>
	<key>Proxy</key>
	<dict>
		<key>SocksVersion</key>
		<string>4</string>
		<key>Mode</key>
		<string>manual</string>
		<key>HTTPProxy</key>
		<string>proxy.example.com:80</string>
		<key>Locked</key>
		<true/>
	</dict>
	<key>RequestedLocales</key>
	<array>
		<string>de</string>
		<string>en-US</string>
	</array>
	<key>SanitizeOnShutdown</key>
	<true/>
	<key>SearchBar</key>
	<string>separate</string>
	<key>WebsiteFilter</key>
	<dict>
		<key>Block</key>
		<array>
			<string>&lt;all_urls&gt;</string>
		</array>
		<key>Exceptions</key>
		<array>
			<string>https://www.google.com/*</string>
			<string>https://www.yahoo.com/*</string>
		</array>
	</dict>
	<key>SecurityDevices</key>
	<dict>
		<key>NAME_OF_DEVICE</key>
		<string>PATH_TO_LIBRARY_FOR_DEVICE</string>
	</dict>
	<key>SSLVersionMin</key>
	<string>tls1.2</string>
	<key>SSLVersionMax</key>
	<string>tls1.3</string>
	<key>SupportMenu</key>
	<dict>
		<key>Title</key>
		<string>Click here for help</string>
		<key>URL</key>
		<string>http://example.edu/</string>
		<key>AccessKey</key>
		<string>C</string>
	</dict>
</dict>

```

There's more than the example policies shown above at the Github link listed below in "Additional Resources".   Use the Github Readme for reference to build the Custom Settings appropriate for your environment/needs/requirements.


## Required Changes/Updates
None

## Change Log
- 1/23/2020:  Updated Content to remove Policies.json and use Configuration Profiles (Custom Settings XML)
- 5/9/2018: Created Initial File


## Additional Resources
- [Deploying Firefox in an Enterprise Environment -- Mozilla](https://developer.mozilla.org/en-US/Firefox/Enterprise_deployment)
- [Customizing Firefox using Configuration Profiles -- Mozilla](https://support.mozilla.org/en-US/kb/customizing-firefox-macos-using-configuration-prof)
- [Customizing Firefox using policies.json -- Mozilla](https://support.mozilla.org/en-US/kb/customizing-firefox-using-policiesjson)
- [FireFox ESR Downloads -- Mozilla](https://www.mozilla.org/en-US/firefox/enterprise/#download)
- [Policy Templates (Github Repo) -- Mozilla](https://github.com/mozilla/policy-templates/blob/master/README.md)
- [Choosing a Firefox update channel -- Mozilla](https://support.mozilla.org/en-US/kb/choosing-firefox-update-channel)


