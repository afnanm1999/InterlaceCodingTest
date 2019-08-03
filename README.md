## Interlace Coding Test

### Features

- Displays Featured Gifs fetched frmo Giphy
- Uses MVVM Design Pattern.

### Technical Specifications

- XCode Version: <a href="https://developer.apple.com/documentation/xcode_release_notes/xcode_10_2_release_notes" target="_blank">10.2</a><br/>
- Design Pattern: <a href="https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel" target="_blank">MVVM</a>

### Dependencies

This project relies on CocoaPods to integrate these dependencies:

- <a href="https://github.com/SwiftyJSON/SwiftyJSON" target="_blank">SwiftyJSON</a><br/>
- <a href="https://github.com/SDWebImage/SDWebImage" target="_blank">SDWebImageFLPlugin</a><br/>

### How to Use the app

In order to test the app, project files need to be opened in Xcode 10.2<br/>
You might have to run the `pod install` command in the terminal to install the dependencies. After that you can run the app. When the app first launches it will fetch the data from `https://api.giphy.com/v1/gifs/trending`  and show a UICollectionView with all of the featured gif images. You can use the search functionailty by clicking on the search bar and typing a word. Doing so will fetch data from  `https://api.giphy.com/v1/gifs/search` API and show it in the UICollectionView.   

### Challenge

Using the Giphy API, build an app that has the ability to search and display search results for a query. Please spend no more than 4 hours on this exercise, and focus on the core functionality rather than the UI of this app.
