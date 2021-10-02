# HTTP Strict Transport Security (HSTS)

## References

- [Wiki](https://en.wikipedia.org/wiki/HTTP_Strict_Transport_Security)

## Tips

### Bypass Firefox

1. Type in URL: `about:config`
2. Accept the Rist and Continue
3. Modify the follow Preferences:
   - `security.mixed_content.use_hstsc` to `false`
   - `network.stricttransportsecurity.preloadlist` to `false`
4. Command + Shift + Delete -> Clear All History -> Ok

<!--
https://appuals.com/how-to-clear-or-disable-hsts-for-chrome-firefox-and-internet-explorer/
https://security.stackexchange.com/questions/102279/can-hsts-be-disabled-in-firefox
-->
