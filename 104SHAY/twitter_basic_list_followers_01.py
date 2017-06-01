#!/usr/bin/python

import tweepy # A library to connect to the Twitter API with Python
# you will need to install this in the Terminal with: sudo pip install tweepy

from tweepy.auth import OAuthHandler

# Consumer keys and access tokens, used for OAuth
# these you will get from https://apps.twitter.com where you  setup your app
consumer_key = 'WgMVIOfrZGC6bYSJyrk55IIto'
consumer_secret = 'mej5w4ZBRPe94wVa9UKHgm91VfasH9EfIVzerNBckb6yD2Rd9z'
access_token = '868059693566091265-RTgB7meMERf8cqAKQEVp81QXDShm7vO'
access_token_secret = 'xsouGkj2YQiBVKcShX2P7IXSlV1SjYlDefN21UvzHdS9U'

# OAuth process, using the keys and tokens
auth = OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

# Creation of the actual interface, using authentication
api = tweepy.API(auth)

# get all the information about me from the API
me = api.me()

print(me.name); # print the information
print(me.location); # uncomment these to see more specific details
print(me.screen_name);
# print(me) # this will show everything

# get information about your followers
followers = tweepy.Cursor(api.followers).items()
# We use pagination a lot in Twitter API development.
# Iterating through timelines, user lists, direct messages, etc.
# In order to perform pagination we must supply a page/cursor parameter with
# each of our requests.

# now use a for loop to cycle through the list of followers pulling out specific
# data, uncomment the below on line at a time to see the data
for person in followers:
        print person.name
        print person.location
        print person.profile_image_url
#         # print person # this will show all the data about each person
