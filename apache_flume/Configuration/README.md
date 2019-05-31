# Configuration

## Structure

```sh
sudo -u flume touch /etc/flume-ng/[source]-[channel]-[sink].conf || exit
```

```conf
<Agent>.sources = <Source>
<Agent>.sinks = <Sink>
<Agent>.channels = <Channel1> <Channel2>

<Agent>.sources.<Source>.channels = <Channel1> <Channel2>
<Agent>.sinks.<Sink>.channel = <Channel1>

<Agent>.sources.<Source>.<Property> = <Value>

<Agent>.sinks.<Sink>.<Property> = <Value>

<Agent>.channels.<Channel>.<Property> = <Value>
```

## Agent

```sh
sudo -u flume `which flume-ng` agent \
  -n [name] \
  -c /opt/apache-flume/conf \
  -f /etc/flume-ng/[source]-[channel]-[sink].conf \
  -Dflume.root.logger=INFO,console
```
