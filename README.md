# Imgur App

## Installation

This app uses cocoapods. Please run a `pod install` before building.

## Dependencies

PINRemoteImage is used for asynchronous loading of images. It has PINCache and FLAnimatedImages as dependencies. PINRemoteImage & PINCache can be used for image caching if needed in the future.


## Usage

When you start the app, a prompt will appear asking for a username. Once a username is input and the "View Albums" button is tapped, if the username exists and the user has albums, then they will display. Once the albums are loaded, you can select one to see the images inside the album. You can then select an image to display it full screen. When displaying an image full screen you can pinch to zoom, double tap to toggle the min/max zoom, and single tap to show/hide the close button.
