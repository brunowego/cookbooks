# Application Security Testing (AST)

<!--
https://crashtest-security.com/sast-dast-iast-rasp/#:~:text=Static%20Application%20Security%20Testing%20(SAST,Runtime%20Application%20Self%20Protection%20(RASP)

http://www.hackertest.net/
-->

## Links

- [Free for Open Source Application Security Tools](https://owasp.org/www-community/Free_for_Open_Source_Application_Security_Tools)

## Glossary

- Static Application Security Testing (SAST)
- Dynamic Application Security Testing (DAST)
- Interactive Application Security Testing (IAST)
- Run-time Application Security Protection (RASP)

<!--
Software Composition Analysis (SCA)
-->

## Proposes

| Name | Description                                                                         | Penetration Testing |
| ---- | ----------------------------------------------------------------------------------- | ------------------- |
| SAST | Scans the application code at rest to discover fault code posing a security threat. | White-Box           |
| DAST | Tests the running application and has no access to its source code.                 | Black-Box           |
| IAST |                                                                                     |                     |
| RASP |                                                                                     |                     |

<!--
SAST

- Analise estatica
- Conhecimento do codigo fonte
- Execução rápida
- Plugins para IDE's e Editores

Bandit
Horusec

---
DAST

- Analise dinamica
- Não possui conhecimento do codigo fonte
- Normalmente recebe apenas uma URL
- Execução lenta

OWASP ZAP
Nessus
Open VAS
Acunetix 360

---
IAST

- Analise interativa
- Um agente é instalado no servidor
- Combina os testes de SAST e DAST
- Monitoramento das requesições e dos binarios da aplicação

Contrast Security

---
RASP

---
SCA

- Analise dos arquivos de dependencias
- Verificação de falhas ja encontradas e respostas

npm audit
yarn audit
-->
