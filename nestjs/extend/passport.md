# Passport

TODO

<!--
https://github.com/codewithmecoder/crud_nestjs_prisma_postgres_passport_jwt
https://snyk.io/advisor/npm-package/@nestjs/passport/example

# .env
SECRET_KEY='S3cr3t_K#Key'

# src/common/constants/env.ts
export const SECRET_KEY = process.env.SECRET_KEY

# src/modules/config/app.config.ts
export default registerAs('app', () => ({
  // ...
  secretKey: SECRET_KEY,
}))

# src/modules/config/config.module.ts
const validationSchema = Joi.object({
  // ...
  SECRET_KEY: Joi.string().required(),
})
-->