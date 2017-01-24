# README

This is the code challenge for Zype. It is build on Rails 5 and Ruby-2.4.0. On a broad level, there are 2 controllers: VideosController and SessionsController.

Whenever someone goes to the root route of the application, it dispatches them to video#index. I use the gem HTTParty to make a get api call to
'https://api.zype.com/videos?app_key={app_key}' to grab a list of videos, assign the response to a variable and render the title and image in the index view.

Whenever someone select the title or thumbnail image, it matches the route 'videos/:id' and dispatch them to the video#show route and passes the id in the params. Using the HTTParty gem again, I make an api call to
'https://api.zype.com/videos/{id}?app_key={app_key}' to grab the video with that id and display the information.

In the show view for video there is a check for subscription_required. if subscription_required === true, it shows the session/new partial where the user needs to login to see the subscription view. If subscription_required === false it displays a free video. When the user logs in, the app makes a post request to 'sessions/create'. Using HTTParty, I make a post request call to https://login.zype.com/oauth/token/. If the credentials is valid, it returns a hash where I assign the access_token to a session. If the credentials is not valid, it returns a flash error. If the login was successful, the user is able to see the subscription video.

You can check out the app at https://fierce-earth-77531.herokuapp.com/.
