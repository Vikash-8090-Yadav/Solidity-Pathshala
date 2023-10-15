# Arbitrage Bot Smart Contract
#### Aritrage Bot is used to earn the profit by trading the asset having different liquidities in different dexes.

## How to call dualDexTrade Function ?

#### Router1 - router address of dex that have less price of token2.
#### Router2 - router address of dex that have high price of token2.
#### Token1 - address of token1 i.e address of your asset(token you hold).
#### Token2 - address of token on which you want to perform the arbitrage.
#### AmountIn - amount of token1 you want to use for arbitrage. (in Wei).
#### Deadline - maximum timestamp to perform the arbitrage trade.

## For example:

Network - Goerli

Address of token1 - 0x7bC40cFa63A04312b954e648c0cCD0c271F86C39

Address of token2 - 0x68B379A700d2d2a9Bad1306e41eB34b777aF43ED

## Added the liquidity in two different dexes i.e Uniswap and Sushiswap

Uniswap Router Address - 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D

SushiSwap Router Address - 0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506

#### Liquidity on Uniswap

Token1 - 100000
Token2 - 10000000

That shows 1 Token1 = 100 Token2

#### Liquidity on SushiSwap

Token1 - 100000
Token2 - 1000000000

That shows 1 Token1 = 10000 Token2

#### Let's perform Arbitrage on it.

Router1 - 0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506

Router2 - 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D

Token1 - 0x7bC40cFa63A04312b954e648c0cCD0c271F86C39

Token2 - 0x68B379A700d2d2a9Bad1306e41eB34b777aF43ED

AmountIn - 1000000000000000000000 (1000 token1)

Deadline - Ideally, value is current timestamp + 60.

## So, the trade will perform in following steps:

1. Token1 is swapped to token2 on router1.

2. Token2 is swapped to token1 on router2.

3. Checking balance of token1 after the above two steps. If balanceAfterTrade is greater than balanceBeforeTrade, the trade will be successful, else it will revert.


## So, in our example, 

### Step 1

#### amountIn1 = 1000000000000000000000
#### amountOut1 = 9969006090092817746

### Step 2

#### amountIn2 = 9969006090092817746
#### amountOut2 = 99292303114452994728883

### Step 3

#### amountOut2 - amountIn1 > 0, so, trade succeeded.
