# Correlation

<!--
CPI (Weekly) vs !GAAPSPX | Correlation

MORTGAGE30US (Weekly) + USCSHPI vs USCBBS

TB3MS + FEDFUNDS + USIRYY = Pinned to Scale B
-->

## Terms

- National Financial Conditions Index (NFCI)
- US Dollar Index (DXY)

<!--
S&P 500
+ FEDFUNDS
+ TVC:USOIL
+ GOLD
+ TLT
+ EEM
+ XLP
-->

## JNK With S&P 500

<!--
1h TF
-->

**Level:** Strong

1. Open `AMEX:JNK`
2. Compare or Add Symbol `CBOT_MINI:ES1!` -> New price scale
3. Indicators `ES1!, CBOT_MINI` -> More -> Pin to scale -> Pinned to scale B
4. Toggle Log Scale
5. Indicators `ES1!, CBOT_MINI` -> Settings -> Style Baseline

## S&P 500 With US10Y

<!--
1d TF
Manufacturing PMI
-->

**Level:** Strong

1. Open `CBOT_MINI:ES1!`
2. Compare or Add Symbol `TVC:US10Y` -> New price scale
3. Indicators `US10Y, TVC` -> More -> Pin to scale -> Pinned to scale B
4. Toggle Log Scale
5. Indicators `US10Y, TVC` -> Settings -> Style Baseline

<!--
Look for US10Y or ES1! Divergences
-->

## S&P 500 With DXY

<!--
1d TF
-->

**Level:** Strong

1. Open `CBOT_MINI:ES1!`
2. Compare or Add Symbol `1/TVC:DXY` -> New price scale
3. Indicators `1/DXY, TVC` -> More -> Pin to scale -> Pinned to scale B
4. Toggle Log Scale
5. Indicators `1/DXY, TVC` -> Settings -> Style Baseline

<!-- ## S&P 500 With NFCI

**Level:** Strong

1. Open `CBOT_MINI:ES1!`
2. Compare or Add Symbol `1/FRED:NFCI` -> New price scale
3. Indicators `1/NFCI, FRED` -> More -> Pin to scale -> Pinned to scale B
4. Toggle Log Scale
5. Indicators `1/NFCI, FRED` -> Settings -> Style Baseline -->
