[<div align="center"><img src="https://github.com/pontehu/respresso-client-ios/blob/master/images/header_ios.png" height="220" /></div>](https://respresso.io)  

# Respresso iOS client [![Tweet](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/intent/tweet?text=Save%20development%20time%21%20Respresso%20automatically%20transforms%20and%20delivers%20your%20digital%20assets%20into%20your%20projects&url=https://respresso.io&via=respresso_io&hashtags=developer,tool,localization,image,resources,digital-assets,convert,automation)  

[Respresso](https://respresso.io) is a centralized resource manager for shared [Android](https://github.com/pontehu/respresso-client-android), iOS and [Web frontend](https://github.com/pontehu/respresso-sync-for-clients#web) projects.
It allows you to simply import the latest assets into your workspace.
You may store several versions of the same resource in the cloud and pick the ones you need to import.
Respresso currently supports six types of resources:
* Images
* App icons
* Localization
* Fonts
* Colors
* Raw

## Table of contents

- [Installation](#installation)
- [Usage](#usage)
	- [Breakdown of the respressofile](#breakdown-of-the-respressofile)
	- [Optional arguments](#optional-arguments)
	- [Available Commands](#available-commands)
- [Live localization](#live-localization)  

## Installation 
[Download the latest release](https://github.com/pontehu/respresso-client-ios/releases)

## Usage
Using Respresso should be intuitive to anyone who has used Cocoapods before.
Configurations are stored in the respressofile, while your current assets’ metadata are stored in respressofile.lock.
Navigate to your project folder in Terminal, and type   
```bash
$ respresso init
```  
to initialize a new Respressofile.
```
host 'https://app.respresso.io'

project_token 'YOUR-PROJECT-TOKEN'

resource 'localization',	'1.0+'
resource 'image',		'1.0+'
resource 'font',		'1.0+'
resource 'color',		'1.0+'
resource 'appIcon',		'1.0+'
resource 'raw',			'1.0+'
```
*Respressofile with custom host requesting four ot ouf five resource categories*

⚠️ Before performing the next step, be sure to **close your Xcode project**.  

Configure your Respressofile as explained by the next section, then type  
```bash
$ respresso update
```  
to import all requested resources into your project.

### Breakdown of the respressofile
* Include the project token received during initialization of your project in the Respresso web interface. This is done in the same manner as the host with the keyword ‘project_token’ and your token inside single quotation marks
* Specify the required resources in the next line using the following format:
resource ‘[resource_name]’, ‘[version_number]’

The currently accepted resource names are:
* image
* appIcon
* color
* localization
* font
* raw
        
Accepted version formats are:
* [major].[minor].[patch]         eg. 1.2.0
* [major].[minor].[patch]+         eg. 1.2.0+ (not available in strict mode)
* [major].[minor]+                eg. 1.2+ (not available in strict mode)


#### Optional arguments
###### host
Specify the host of your assets in the first line by writing ‘host’ and your URL in single quotation marks separated by a space.
By omitting this argument Respresso will use its default host URL for syncing.

### Available Commands
Open terminal and navigate to your project folder. Use any of the commands below by typing  
```bash
$ respresso [command]
```

###### Init
Initializes a new Respressofile with an empty project token and a resource line commented out.

###### Install
Executes a Clean and an Update command sequentially.

###### Update
Downloads resources specified in your Respressofile from the server. Your current assets described in your Respressofile.lock are checked against the server’s state.
If ran for the first time, a new project with your assets and a new workspace containing both projects are created.

###### Clean
Removes your lock file and all assets associated with Respresso.

###### Options
**strict-mode**


Enabling strict mode will guarantee you get the same results each time you sync your assets. If set to true, you may only specify exact version numbers in your Respressofile. This option is set to false by default. Usage example:  
```bash
$ respresso update -strict-mode
```

## Live localization

Real-time preview how the translations will look like in your mobile app or web. No need to wait for the next deployment.

#### How to setting up

1. Import 'RespressoLive' framework. It's automatically added to your project.
2. Enable the live mode.

```
import RespressoLive

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        RespressoLocalizationLiveEdit.shared.liveLocalizationEnabled = true
        
        return true
    }
}
```

3. Use 'RespressoStrings' for localization
4. Observe for 'RespressoDidUpdateLocalization' notification.

```
import Respresso

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateTexts()
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.RespressoDidUpdateLocalization, object: nil, queue: nil) { [weak self] (notification) in
            self?.updateTexts()
        }
    }
    
    func updateTexts() {
        label.text = RespressoStrings.hello
    }
}

```

#### How to use it

1. Check above instructions
2. Go to respresso(https://app.respresso.io) sign in and choose a project
3. Select localization in the left panel and click the same version that you synced into your project 
4. Get your phone and shake it
5. Switch on 'Localization / Connection' in the popup window
> Now your modifications are going to appearance when you click the 'Save' button on the web
6. For using Live Edit Module* shake your phone again and switch on 'Localization / Live Editor' in the popup window
7. On web click on the 'Live Editor' button on the top right area
8. Scan the QR Code with your phone which visible in your web browser's top right section

Let see what happened after 7th option. You activated a visible items filter and your list have less elements than before and don't have to use Save button to get updated texts. Be careful, this modification stored just in your phone's memory and you can lose it. Use the Save button to store your modifications. 

\* Live Edit Module: shows real-time preview how the translations will look like in your mobile app. Check the translations’ accuracy, length and the UI experience in real-time.

