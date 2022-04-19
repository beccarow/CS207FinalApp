# Final Team Project L

## Bin It! - About the app

The Bin It! app classifies images of objects as recyclable and not recyclable and directs users to the recyclable center nearest to the user's current location. This app utilizes the MobileNetV2 image classification model through Core ML as well as MapKit.


## Features

The user can upload an existing photo from their photo library or take a live capture photo and determine the subject's classification. Users are informed of the percent likelihood of the subject being recyclable or not and are then given the choice to find a recycling center close by. Users are able to reupload and/or retake photos until they find they decide on one to classify.

## Design

When first opened, the app has a launch screen with a simple icon that matches its app icon on the home screen. The main screen has icon buttons that allow users to upload or take photos, a "Determine" button to process and classify the image, and a space for the chosen photo to be displayed. The next screen will present a green or red plastic bag icon depending on whether the image is classified as recyclable, as well as the text that relays information about percent likelihood. Finally, the last screen presents the user with an interactive map that shows them their location and the recycling center's location. The user can go back to earlier pages at any stage in this process.

## Team members

1. Pippa Lother: CoreLocation and GPS implementation
2. Kushara Ghosh: camera integration & ViewController implementation
3. Soumya Bodavula: photo upload implementation & app/launch screen icon
4. Rebecca Row: implementation of CoreML model
5. Joie You: UI/storyboard design

