# TradingLite

<!--
https://www.tradinglite.com/chart/GL5CPBJV#0,binancef:BTCUSDT,5

https://atas.net/ru/
https://bookmap.com/

Coloque ordens atrás, espere rompimento. Exercite a paciência
Sempre observe se tem uma resistência abaixo/acima. Procure por linha de tendencia, médias móveis, etc.
A ordem pesada pode está no caminho do verdadeiro alvo. Tática para evitar liquidados
Procure por confluência, RSI em sobre-vendido/sobre-comprado, L.S.R. alto/baixo, O.I, Funding Rate

Antes de entrar olhar TOTAL
Comesse a colocar ordens em cima das EMA's
Colocar ordem na base do pavio caso haja rejeição e ainda haja ordens pesadas abaixo

Encontre sempre por confluência
Apos rompimento de uma linha de tendencia aguarde por fechamento de candlestick

Abra outra ordem no sentido inverso para caso o mercado venha contra sua ordem, ainda mais se houver uma resistencia/suporte e apontar liquidaçao, ele vai correr para um lado uma hora
-->

## Links

- [Main Website](https://tradinglite.com/)
- [Status Page](https://status.tradinglite.com/)
- [Feedback](https://feedback.tradinglite.com/)

## Alternatives

- [TRDR](/trdr.md)
- [Coinglass](/coinglass.md)

## Glossary

- Volume Profile Visible Range (VPVR)

## Indicators

### Recommendations

- [VPVR Plus](https://www.tradinglite.com/learn/TradingLite/17/official-indicators#vpvr-plus)

### Configuration

- Main
- Heartmap
  - Extend Heatmap 5 bars
  - Check Hide values
  - Transparency 30%
- Liquidation Bubbles
  - Scaling 20
  - Uncheck Add Highlight
  - Long Liquidations `#54843170`
  - Short Liquidations `#A1253F79`
- Volume
- VPVR Plus
  - Ticks per row Minimum
  - Check Hide values
  - Point of Control: Mode Enable
- Counter (Trades)
  - Line Color `#FFFFFFFF`

<!--
Delta Volume
CVD
Open Interest
-->

## Market Manipulation

- Spoofing

## Configuration

### Orderbook

- Columns:
  - Disable: Enable animations

### Trades

- Min. Size >= 10000
- Sound Alert >= 1000000

## Heatmap Intensity

| Symbol | Min | Peak |
| ------ | --- | ---- |
| BTC    | 210 | 700  |

## Tips

## Heatmap Intensity Formula

### BTC/USDT Futures

- Min: (Max / 10) \* 1,5 (eq. 15%)
- Min: (Max / 10) \* 4 (eq. 40%)

**Options:** Enable HD heatmap
