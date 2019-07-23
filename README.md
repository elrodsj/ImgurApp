# Imgur App

## Installation

This app uses cocoapods. To install cocoapods run `sudo gem install cocoapods`. Once cocoapods is installed, run a `pod install` before building.

## Dependencies

PINRemoteImage is used for asynchronous loading of images. It has PINCache and FLAnimatedImages as dependencies. PINRemoteImage & PINCache can be used for image caching if needed in the future.


## Usage

When you start the app, a prompt will appear asking for a username. Once a username is input and the "View Albums" button is tapped, the albums for that user will load. You can select an album to see the images inside the album. You can then select an image to display it full screen. When displaying an image full screen you can pinch to zoom, double tap to toggle the min/max zoom, and single tap to show/hide the close button.
