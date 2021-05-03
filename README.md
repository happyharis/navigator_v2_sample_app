'''
url enters -> RIP convert url to user defined data -> then this data is passed to the R. Delegate
this router delegate is incharge of the states of the app
book_route_path is basically that user defeined data which we will be parsing from URL 
'''

Steps - 
1. create a route_path model
2. so now we come down to RIP (RouteInformationParser), here we have two overrides functions -
   1. parseRouteInformation -  to parse the details (in the form of our route_path model) and navigate to desired page
   2. restoreRouteInformation -  this is actually responsible for syncing url with your browser based on our current route_path while you are using your app, hence in next furthere steps we will have to update our route_path too,
3. Now we will be working on Router Delegate
   1. currentConfiguration - so as we said in the step (2.2) that it fetches route_path model and syncs the url, so here in this method we actually update the route_path model.
   2. name_page extends Page basically implements a route for your scaffold.
   3. add this name_page udner the required condition into the build's Pages list
   4. now pass your custom function that will hold the variable change code to your desired pages.

source -
https://www.youtube.com/watch?v=FBoAXUkHu44
https://medium.com/flutter/learning-flutters-new-navigation-and-routing-system-7c9068155ade
https://github.com/happyharis/navigator_v2_sample_app