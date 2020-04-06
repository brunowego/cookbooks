# Twitter

## Source

- [User Guide](https://flume.apache.org/FlumeUserGuide.html#twitter-1-firehose-source-experimental)

### Required

```conf
<Agent1>.sources.<Source1>.channels = <Channel1>

<Agent1>.sources.<Source1>.type = org.apache.flume.source.twitter.TwitterSource
<Agent1>.sources.<Source1>.consumerKey = [CONSUMER_KEY]
<Agent1>.sources.<Source1>.consumerSecret = [CONSUMER_SECRET]
<Agent1>.sources.<Source1>.accessToken = [ACCESS_TOKEN]
<Agent1>.sources.<Source1>.accessTokenSecret = [ACCESS_TOKEN_SECRET]
```
