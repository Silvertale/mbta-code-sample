Because this is a simple application using a csv, and to make installation easier, I have not used a database, and instead chosen to read directly from the file. This isn't a problem in
such a limited application since the file (as well as the request for the file) will automatically be cached.

To Install the application, simply run bundle install, and then rails s (or you can configure your server environment to server the application if you'd prefer). Navigate to the root page
(on a local machine, this will be localhost:3000). You can use the select boxes to filter the train schedule by destination and/or time.

The csv is parsed in such a way that more columns could easily be added without having to change any back-end code.

To make the front end development easier I have chosen to use an array of hashes as format so that it is possible to get values using $scope.destinations[x].myKey, where myKey is the
same as the header value in the csv file, and x is the row number. 
