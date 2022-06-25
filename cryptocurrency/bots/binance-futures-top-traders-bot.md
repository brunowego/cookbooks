# Binance Futures Top Traders Ratio Bot

## Links

- [Code Repository](https://github.com/severin-richner/binance-futures-top-traders-bot)

## Installation

```sh
#
git clone 'https://github.com/severin-richner/binance-futures-top-traders-bot.git' binance-futures-top-traders-bot && cd "$_"

#
virtualenv ./.venv

#
source ./.venv/bin/activate

#
pip install \
  matplotlib===3.5.2 \
  PySimpleGUI===4.60.1 \
  python-binance===1.0.16 \
  requests===2.27.1
```

## Configuration

1. [API Management](https://www.binance.com/en/my/settings/api-management)
2. Create API
   - Label API key to proceed: Top Traders Ratio Bot
   - Next
3. Only "Enable Reading" in "API restrictions".
4. Edit `API_KEY` and `API_SECRET` in `./config.py` and save.

## Using

```sh
#
python3 ./top_traders_bot.py
```
