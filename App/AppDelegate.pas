namespace;

interface

uses
  UIKit;

type
  [UIApplicationMain]
  [IBObject]
  AppDelegate = class(IUIApplicationDelegate)
	method application(application: nullable UIApplication) didFinishLaunchingWithOptions(launchOptions: nullable NSDictionary<nullable UIApplicationLaunchOptionsKey,nullable rtl.id>): not nullable Bool; override;
	method applicationWillResignActive(application: not nullable UIApplication); override;
	//  Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	//  Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	method applicationDidEnterBackground(application: not nullable UIApplication); override;
	//  Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	//  If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	method applicationWillEnterForeground(application: not nullable UIApplication); override;
	//  Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	method applicationDidBecomeActive(application: not nullable UIApplication); override;
	//  Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	method applicationWillTerminate(application: not nullable UIApplication); override;
  assembly
	var window: nullable UIWindow;
  end;

implementation

method AppDelegate.application(application: nullable UIApplication) didFinishLaunchingWithOptions(launchOptions: nullable NSDictionary<nullable UIApplicationLaunchOptionsKey,nullable rtl.id>): not nullable Bool;
begin
  window := UIWindow();
  if UIDevice.currentDevice.userInterfaceIdiom = UIUserInterfaceIdiom.Phone then begin
	//  create your iPhone views here
  end
  else begin
  end;
  window:makeKeyAndVisible();
  exit true;
end;

method AppDelegate.applicationWillResignActive(application: not nullable UIApplication);
begin
end;

method AppDelegate.applicationDidEnterBackground(application: not nullable UIApplication);
begin
end;

method AppDelegate.applicationWillEnterForeground(application: not nullable UIApplication);
begin
end;

method AppDelegate.applicationDidBecomeActive(application: not nullable UIApplication);
begin
end;

method AppDelegate.applicationWillTerminate(application: not nullable UIApplication);
begin
end;

end.