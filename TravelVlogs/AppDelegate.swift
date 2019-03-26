import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
  
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient,
                                                         mode: AVAudioSessionModeMoviePlayback,
                                                         options: [.mixWithOthers])
        
        window = UIWindow(frame: UIScreen.main.bounds)
    
    
        let feed = VideoFeedViewController()
        feed.videos = Video.allVideos()
        feed.title = "Travel Vlogs"
    
        let nav = UINavigationController(rootViewController: feed)
        nav.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.red,
                                             NSAttributedStringKey.font: UIFont(name: "Roboto-Bold", size: 21)!]
    

        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    
        return true
    }
}

