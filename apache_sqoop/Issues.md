# Issues

## MBean Trust Permission

> ERROR Could not register mbeans java.security.AccessControlException: access denied ("javax.management.MBeanTrustPermission" "register")

```sh
sudo sed -i '/grant *{/a \        permission javax.management.MBeanTrustPermission "register";' ${JAVA_HOME}/jre/lib/security/java.policy
```
