# Twitter

## Source

- [User Guide](https://flume.apache.org/FlumeUserGuide.html#twitter-1-firehose-source-experimental)

### Required

```conf
<Agent>.sources.<Source>.channels = <Channel1> <Channel2>

<Agent>.sources.<Source>.type = org.apache.flume.source.twitter.TwitterSource
<Agent>.sources.<Source>.consumerKey = [CONSUMER_KEY]
<Agent>.sources.<Source>.consumerSecret = [CONSUMER_SECRET]
<Agent>.sources.<Source>.accessToken = [ACCESS_TOKEN]
<Agent>.sources.<Source>.accessTokenSecret = [ACCESS_TOKEN_SECRET]
```
