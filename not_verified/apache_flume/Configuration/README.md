# Configuration

## Structure

```sh
sudo -u flume touch /etc/flume-ng/[source]-[channel]-[sink].conf || exit
```

```conf
<Agent1>.sources = <Source1>
<Agent1>.sinks = <Sink1>
<Agent1>.channels = <Channel1>

<Agent1>.sources.<Source1>.channels = <Channel1>
<Agent1>.sinks.<Sink1>.channel = <Channel1>

<Agent1>.sources.<Source1>.<Property> = <Value>

<Agent1>.sinks.<Sink1>.<Property> = <Value>

<Agent1>.channels.<Channel1>.<Property> = <Value>
```

## Agent

```sh
sudo -u flume `which flume-ng` agent \
  -n [name] \
  -c /opt/apache-flume/conf \
  -f /etc/flume-ng/[source]-[channel]-[sink].conf \
  -Dflume.root.logger=INFO,console
```
