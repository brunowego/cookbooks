# OWASP Zed Attack Proxy (ZAP)

<!--
https://marketplace.visualstudio.com/items?itemName=kasunkodagoda.owasp-zap-scan
-->

TODO

## Tips

### Generate NUnit XML report

```sh
#
npm install handlebars-cmd -g

#
cat << EOF > ./.zap/nunit-template.hbs
{{#each site}}
<test-run
    id="2"
    name="Owasp test"
    start-time="{{../[@generated]}}"  >
    <test-suite
        id="{{@index}}"
        type="Assembly"
        name="{{[@name]}}"
        result="Failed"
        failed="{{alerts.length}}">
        <attachments>
            <attachment>
                <filePath>./.zap/report.html</filePath>
            </attachment>
        </attachments>
    {{#each alerts}}<test-case
        id="{{@index}}"
        name="{{alert}}"
        result="Failed"
        fullname="{{alert}}"
        time="1">
            <failure>
                <message>
                    <![CDATA[{{{desc}}}]]>
                </message>
                <stack-trace>
                    <![CDATA[
Solution:
{{{solution}}}
Reference:
{{{reference}}}
instances:{{#each instances}}
* {{uri}}
    - {{method}}
    {{#if evidence}}- {{{evidence}}}{{/if}}
                    {{/each}}]]>
                </stack-trace>
            </failure>
    </test-case>
    {{/each}}
    </test-suite>
</test-run>
{{/each}}
EOF

#
handlebars \
  ./.zap/reports/results.json \
    < ./.zap/nunit-template.hbs \
      > ./.zap/test-results.xml
```
