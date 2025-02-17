# Obfuscate

<!--
b********@g****.com
b*******o@g***l.com
****@brun*********
-->

<!--
(6*) ****0-2595
-->

## Terms

- Data Protection
- Sensitive Data

<!--
export const obfuscateApiKey = (apiKey: string) => {
  const [prefix, identifier, secretPart] = apiKey.split('_') as [
    string,
    string,
    string,
  ]

  return `${prefix}_${identifier}_${'*'.repeat(secretPart.length)}`
}
-->
