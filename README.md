# TinderGram
Tinder + Instagram, need I say more? Swipe left/right to like 

##Notes:

Its still in developmentment. It fully work.

![cards](/tinderGramDemo.gif "Cards View")

##Installation

`$ git clone git@github.com:edwinbosire/TinderGram.git`

We are using [Cocoapods](cocoapods.org) as our package manager. Assuming you have Cocoapods setup

`$ pod Install`

Thats it, the app should run. You might want to change the clientID for Instagram to your own.

##What's done
- Authenticate a user using OAuth2 (Basically login to instagram)
- Load users feeds (limit 15 atm)
- Tinder-esque swipe cards, courtesy of Yalantis/Koloda project

##TODO
- Actually liking a photo (might need some special persmision from instagram)
- Unlike or pass an image
- Logic to wether show the same photos again. i.e do we log each item ID and not display them again..ever??


###Contributors
- Just me at the moment.

###Acknowledgment
I better write this before I became famous and forget to give credits.
A lot of the work here is based off the following frameworks, I've just written the glue to stick them together

- [Koloda](https://github.com/Yalantis/Koloda)
- [Pop](https://github.com/facebook/pop) by facebook

And of course stack overflow whenever I was too lazy to read up on a readily available, well documented iOS feature.

If you think that this is a cool project and you would like to see it go live, don't hesitate to let me know on twitter [@EdwinBosire](www.twitter.com/edwinbosire)

