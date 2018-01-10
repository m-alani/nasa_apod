#  NASA Pic of the Day

This is a sample app built to demonstrate basic compitency in iOS/Swift programming.
The project was built for Scotiabank as a step in the application process for an iOS developer position

-----

### Notes about the submitted code
- The code was organized using a standard MVC pattern, with all other functionality that doesn't fit into te pattern being put in the "Other" folder
- The custom fade animation for the image title is very visible with the default 0.35 seconds time, consider increasing that number (through the "config" file) to over 1 second to make a visible difference
- Given the simple nature of the app and its functionality, I decided not to invest much time in writing Unit Tests. Instead, I wrote few sample cases to demonstrate my ability to test some of the tricky situations (Async calls, and ViewControllers) a developer might encounter while writing test cases
- While XCode does provide the means to do simple UI testing, I did not see the point of implementing any UI tests without having a strict UI design (UI tests are usually written with help from the design team)
- Realistically, 3-6 hours are more than enough to put together an app that does the exact same functionality. I have spent a bit more time thought, just because I prefer to write maintainable code (it's clear that it's an overkill in this case, but that's how I prefer to write code)


-----
### Things to be added (if more time is available)
- More tests. Mainly for model consistency and more network async calls.
- Implement simple caching with a timestamp, probably though CoreData (Download the same image over & over again is a waste of network resources, given that NASA changes the picture only once a day )
- Implement a different transition effect where the fullscreen image view zooms in from the centre rather than slide up modally (I think this was the initial idea on your end? The instructions weren't clear enough)
- Have a quick discussion with the UI person in charge! perhaps we should add a title bar and an icon set for the app?
- Refactor the network calls and break them down into smaller functions. Nothing beats small functions when it comes to testing and maintenence
- Implement a zoom gesture recognizer for the image in fullscreen (user should be able to pinch zoom)

-----

Marwan Alani - 2018
