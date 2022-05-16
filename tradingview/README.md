# TradingView

<!--
MTP Analysis
MTP ATRRange
MTP ATRStop
MTP OpeningGap
MTP STF
MTP VSA
-->

<!--
1-BINANCE:BTCUSDT
1-BINANCE:ETHUSDT
-->

<!--
Thomas Bulkowski
-->

<!--
Doji
-->

<!--
## Configuration

- Heikin Ashi
-->

## Links

- [Main Website](https://tradingview.com/)
- [All Markets](https://tradingview.com/markets/)

<!--
5m, 15m, 30m, 1h, 2h, 4h, 6h, 12h, 1d, 2d, 1w, 1m
-->

## Scale

- Arithmetic **Tip:** Good for day-trade
- Logarithmic **Tip:** Good for swing-trade

## Indicators

- Bollinger Bands (BB)
- Bollinger Bands Width (BBW)
- Commodity Channel Index (CCI) **Tip:** For weekly or daily time-frames.
- Cumulative Volume Delta (CVD)
- Delta Volume (DV) (kernel_phi) **Inputs:** Period of Cumulative Delta 50 (same as EMA). **Style:** Only Buy/Sell Volume and Cumulative Delta.
- EMA Ribbon. **Config:** Change the MA-1 color to green. **★**
- Exponential Moving Average (EMA). **Days:** 9, 21, 50 or 100.
- Ichimoku Cloud (IC). **Tip:** Remove Conversion/Base Lines and Lagging Span.
- Keltner Channels (KC). **Tip:** For day time-frames.
- MA Cross
- Money Flow Index (MFI)
- Moving Average (MA). **Tip:** Set length to 100. **★**
- Moving Average Convergence Divergence (MACD) **Tip:** Works better with >= 4 hours time-frames.
- On-Balance Volume (OBV)
- Open Interest (OI) (**_Futures Only_**) **Style:** Remove Tables
- Relative Strength Index (RSI). **Config:** MA Length: 20 **Tip:** Overbought (>= 70) and Oversold (<= 30). Remember to add a alert on RSI for Overbought (69) / Oversold (31). **★**
- RSI Levels
- Stochastic RSI **Tip:** Best use with weekly time-frame.
- TD Sequential
- True Strength Indicator (TSI) **Tip:** Best use with monthly time-frame.
- Volume Profile Visible Range (VPVR)
- Volume Weighted Average Price (VWAP) **Tip:** Used for intra-day signals. Can act as support/resistance.
- VuManChu Cipher B + Divergences. **Tip:** Works good for scalping. **Combo:** Stochastic RSI, Money Flow, VWAP (Intra-day) **★**
- Williams Alligator. **Tip:** Good seq. is green, red and blue.

<!--
VWAP: Session, Week, Month, Year
-->

<!--
- Average True Range (ATR)
- Central Pivot Range (CPR)
- Key EMAs
- Média de 8 Semanal
- Network Value to Transactions Ratio (NVT Ratio)
- Simple Moving Average (SMA)
- Squeeze Momentum Indicator (SMI)
- Supertrend
- Volume Profile and Volume Indicator (VPVI)
-->

## Terms

- Value Area High (VAH)
- Value Area Low (VAL)
- Back-testing

### Portuguese

- Índice de Força Relativa (IFR)
- Linha de Tendência de Alta (LTA)
- Linha de Tendência de Baixa (LTB)
- Média Móvel Aritmética (MMA)
- Média Móvel Exponencial (MME)
- Índice de Força Relativa (IFR). **Tip:** Sobre-comprado e Sobre-vendido.

## App

### Installation

#### Homebrew

```sh
brew install --cask tradingview
```

<!--
Volume Profile Trading Examples - How Do You Use Volume Profiles?
https://www.youtube.com/watch?v=JbtKyOFAht4

Plan Your Trades With The Long and Short Position Tools
https://www.youtube.com/watch?v=OTySzQHqYQw
-->

<!--
Longs / Shorts Ratios
Open Interest
Perpetuals Binance Futures
Liquidations (aggregation)
Funding Rate (aggregation)
-->

### Issues

#### Switching Screen

```log
When change the tab, Finder Screen also changes too.
```

**Fix:** Close application and open it in the desired screen.
