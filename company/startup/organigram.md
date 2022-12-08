# Organizational Chart (a.k.a Organigram, Organogram, or Organizational Breakdown Structure)

## Glossary

- Chief Executive Officer (CEO)
- Chief Financial Officer (CFO)
- Chief Sales Officer (CSO)
- Chief Technology Officer (CTO)
- Objectives and Key Results (OKR)
- Product Owner (PO)
- Project Lead (PL)

<!--
- Business Manager (BM)
- Chief Analytics Officer (CAO)
- Chief Compliance Officer (CCO)
- Chief Customer Officer (CCO)
- Chief Data Officer (CDO)
- Chief Green Officer (CGO)
- Chief Human Resources Manager (CHRM)
- Chief Human Resources Officer (CHRO)
- Chief Information Officer (CIO)
- Chief Marketing Officer (CMO)
- Chief Operating Officer (COO)
- Chief Security Officer (CSO)
- Department of Human Resources (DHR)
- Enterprise Content Management (ECM)
- Product Manager (PM)
- Project Management Office (PMO)
-->

## Organigram

```mermaid
flowchart TD
  CEO{CEO};
  CFO{CFO};
  CSO{CSO};
  CTO{CTO};
  PO{PO};
  DEV{Dev. Team};
  TM{PL};
  TL{Dep. Head};
  CEO -- Company OKR --> CTO;
  CTO -- Product OKR --> PO;
  CTO <-. Platform architecture .-> TM;
  PO -- Project OKR --> TM;
  TM <-- Project collab. --> TL;
  PO <-- Roadmap Planing --> TL;
  PO -- Product Update --> DEV;
  CEO --> CSO
  CEO --> CFO
```

### Artifacts & Ownership

```mermaid
flowchart LR
  CEO{CEO};
  CTO{CTO};
  PO{PO};
  TM{PL};
  companyVision[[Company Vision]];
  productVision[[Product Vision]];
  productRoadmap[[Product Roadmap]];
  companyObjectives[[Company Objectives]];
  companyKeyResults[[Company Key Results]];
  productObjectives[[Product Objectives]];
  productKeyResults[[Product Key Results]];
  projectKeyResults[[Project Key Results]];
  projectObjectives[[Project Objectives]];
  project[[Project]];
  CEO -. owns .- companyVision;
  CEO -. sets .- companyObjectives;
  CTO -. delivers .- companyKeyResults;
  CTO -. owns .- productVision;
  CTO -. set .- productObjectives;
  PO -. delivers .- productKeyResults;
  PO -. owns .- productRoadmap;
  PO -. sets .- projectObjectives;
  TM -. delivers .- projectKeyResults;
  TM -. owns .- project;
```

### Key Functions

| Position | Name |
| -------- | ---- |
| CEO      |      |
| CFO      |      |
| CSO      |      |
| CTO      |      |
| PO       |      |
| PL       |      |
