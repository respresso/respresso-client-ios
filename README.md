# Introduction 


Respresso is a centralized resource manager for shared Android and iOS projects.
It allows you to simply import the latest assets into your workspace.
You may store several versions of the same resource in the cloud and pick the ones you need to import.
Respresso currently supports five types of resources:
* Images
* App icons
* Localization
* Fonts
* Colors

# Installation
You can install Respresso with Homebrew using the following command:  
```$ brew install respresso```

# Usage
Using Respresso should be intuitive to anyone who has used Cocoapods before.
Configurations are stored in the respressofile, while your current assets’ metadata are stored in respressofile.lock.
Navigate to your project folder in Terminal, and type   
```$ respresso init```  
to initialize a new Respressofile.

![Respressofile with custom host requesting four ot ouf five resource categories](/images/respressofile.png)  
*Respressofile with custom host requesting four ot ouf five resource categories*


Once you have configured your Respressofile, type  
```$ respresso update```  
to import all requested resources into your project.

## Breakdown of the respressofile
* Include the project token received during initialization of your project in the Respresso web interface. This is done in the same manner as the host with the keyword ‘project_token’ and your token inside single quotation marks
* Specify the required resources in the next line using the following format:
resource ‘[resource_name]’, ‘[version_number]’

The currently accepted resource names are:
* image
* appIcon
* color
* localization
* font
        
Accepted version formats are:
* [major].[minor].[patch]         eg. 1.2.0
* [major].[minor].[patch]+         eg. 1.2.0+ (not available in strict mode)
* [major].[minor]+                eg. 1.2+ (not available in strict mode)


### Optional arguments
###### host
Specify the host of your assets in the first line by writing ‘host’ and your URL in single quotation marks separated by a space.
By omitting this argument Respresso will use its default host URL for syncing.

## Available Commands
Open terminal and navigate to your project folder. Use any of the commands below by typing  
```$ respresso [command]```

##### Init
Initializes a new Respressofile with an empty project token and a resource line commented out.

##### Install
Executes a Clean and an Update command sequentially.

##### Update
Downloads resources specified in your Respressofile from the server. Your current assets described in your Respressofile.lock are checked against the server’s state.
If ran for the first time, a new project with your assets and a new workspace containing both projects are created.

##### Clean
Removes your lock file and all assets associated with Respresso.

##### Options
###### strict-mode


Enabling strict mode will guarantee you get the same results each time you sync your assets. If set to true, you may only specify exact version numbers in your Respressofile. This option is set to false by default. Usage example:  
```$ respresso update -strict-mode```

# Licence
```
Copyright 2018 Ponte.hu Kft

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
