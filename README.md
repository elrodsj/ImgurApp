# Imgur App

Compiled using Xcode 10.2.1 and only tested on simulator. I didn't have any devices on iOS 12 or below that I could use for testing since I've upgraded my iPhone and iPad to iOS 13.

## Installation

This app uses cocoapods. To install cocoapods run `sudo gem install cocoapods`. Once cocoapods is installed, run a `pod install` before building.

## Dependencies

PINRemoteImage is used for asynchronous loading of images. It has PINCache and FLAnimatedImages as dependencies. PINRemoteImage & PINCache can be used for image caching if needed in the future.


## Usage

When you start the app, a prompt will appear asking for a username. Once a username is input and the "View Albums" button is tapped, the albums for that user will load. You can select an album to see the images inside the album. You can then select an image to display it full screen. When displaying an image full screen you can pinch to zoom, double tap to toggle the min/max zoom, and single tap to show/hide the close button.

Side note: Some albums do not have cover images. If this is the case, a gray box will appear in place of the cover image. Some test users I found online are: drbatookhan, chemistrydoc, & SlimJones123. No promises on their content, I just did some searches for people that have albums/images. Many users do not.

## Decisions

### ImgurApiClient
This app wraps the imgur api in ImgurApiClient.  Since all calls thus far are GET calls, the api client doesn't have generic methods for the other HTTP methods, but it has been made in such a way that it would be fairly easy to add the on. Each specific request to the Imgur api is in it's own file as an extension of the ImgurApiClient. This allows for us to build out the api without bogging down ImgurApiClient with specifics of each request.

### ImgurRepository
ImgurRepository separates ImgurApiClient and the rest of the app. With the current functionality of the app, this wasn't really needed, but if it were to grow, ImgurRepository might become more important. This would be where we could cache data received from the Imgur api or do some data manipulation or possibly make multiple calls at once to the api for a single purpose. The app shouldn't be tied directly to how the Imgur api operates and this is where that separation takes place. 

### Model
Album and Image are the two structs in the app's model. The app uses these instead of what is received directly from the api so that if the api changes, we need only change our api code and the mapping to our model instead of changing everything throughout the app.

### Build Config
The base url for the Imgur api and our client id are stored in the build configuration of the project. This would allow us to have different imgur base url's and different client id's for different environments which might be more important later one the app went into testing and distribution.

### Storyboards
The majority of the UI for this app is in Storyboards. Storyboards allow a lot of the boilerplate code to be handled by Apple and also creates a better separation between the view controller code and the UI.

### MVC vs MVVM
MVVM would have provided slightly better separation of concerns in the view controllers, but the differences between MVC and MVVM seemed fairly small for such a simple application. The benefits of MVVM seemed fairly negligible in this case.
