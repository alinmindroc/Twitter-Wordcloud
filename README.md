# twitter_wordcloud
###### Homework for Hootsuite internship

This is a python app which gets data from the [Twitter Sample Stream](https://dev.twitter.com/streaming/reference/get/statuses/sample) and returns the
occurence count for every word in the stream or for a number of words specified by the user in JSON format. It can be used as the backend for a
[wordcloud](https://www.google.com/search?site=&tbm=isch&q=wordcloud) service.      

The app is enclosed in a docker container and uses docker-compose to communicate with a redis server which is running in another docker container.

To use the app, you have to [register a twitter app](https://apps.twitter.com/app/new) to get a consumer key and access token for accessing the stream,
and set them in [wordcloud.py](wordcloud_files/wordcloud.py) at lines 12-16.

#### How to run the app inside the docker container:
(this will download the docker images for redis and python:2.7.9)  

1. Install docker and docker-compose
2. To run the app with the default args: `sudo docker-compose up` (this will gather data for 2 seconds from the stream and print the first 4 words ordered by occurence count, by running the command in [docker-compose.yml](docker-compose.yml))
3. To run the app with custom command line args, you can use  
  `sudo docker-compose run web ./wordcloud.py [seconds_of_streaming] [max_words]`

#### How to run the app locally (without docker):

1. Make sure you have python version 2.7.9 installed. For older versions, use `pip install requests[security]` so that the requests done by urllib3 won't throw security exceptions.
2. Install redis `pip install redis` (python 2.7.9 comes with pip)
3. Install tweepy `pip install tweepy`
4. Start the redis server
5. Replace the value of the redis host at line 20 in [wordcloud.py](wordcloud_files/wordcloud.py) with the IP of the redis server. You can use 'localhost' if the server is local.
5. Run `./wordcloud.py [seconds_of_streaming] [max_words]`

