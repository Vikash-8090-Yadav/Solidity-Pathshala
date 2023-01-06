## Chainlink Data Feeds 

**Chainlink Data Feeds** are the quickest way to connect your smart contracts to the real-world data such as asset prices, reserve balances, and L2 sequencer health.

![1](https://user-images.githubusercontent.com/95535448/210969743-046dec29-3d5d-40ad-82ca-5d4ef2150e37.jpg)


## Types of data feeds

Data feeds provide many different types of data for your applications.

- Price Feeds
- Proof of Reserve Feeds
- L2 sequencer uptime feeds

![3](https://user-images.githubusercontent.com/95535448/210970254-80bdab1a-7417-4283-8c1c-df3bf1971409.jpg)


## Price Feeds
See the Data Feeds Contract Addresses page for a list of networks and proxy addresses.

Smart contracts often act in real-time on data such as prices of assets. This is especially true in DeFi.

For example, Synthetix uses Data Feeds to determine prices on their derivatives platform. Lending and borrowing platforms like AAVE use Data Feeds to ensure the total value of the collateral.

Data Feeds aggregate many data sources and publish them on-chain using a combination of the Decentralized Data Model and Off-Chain Reporting.

## Proof of Reserve Feeds
Proof of Reserves feeds provide the status of reserves for stablecoins, wrapped assets, and real world assets. Proof of Reserve Feeds operate similarly to Price Feeds, but provide answers in units of measurement such as ounces (oz) or number of tokens.

## NFT Floor Pricing Feeds
NFT Floor Pricing Feeds provide the price of the lowest priced NFT available in a collection. These feeds operate similarly to Price Feeds so you can use the AggregatorV3Interface.sol contract to retrieve price answers.

## L2 sequencer uptime feeds
L2 sequencer feeds track the last known status of the sequencer on an L2 network at a given point in time. This helps you prevent mass liquidations by providing a grace period to allow customers to react to these events.

![2](https://user-images.githubusercontent.com/95535448/210969793-e596825c-a6ea-4f70-9847-3bfaa5abaa57.png)

## Components of a data feed
Data Feeds are an example of a decentralized oracle network and include the following components:

` Consumer`: A consumer is an on-chain or off-chain application that uses Data Feeds. Consumer contracts use the AggregatorV3Interface to call functions on the proxy contract and retrieve information from the aggregator contract. For a complete list of functions available in the AggregatorV3Interface, see the Data Feeds API Reference.

`Proxy contract`: Proxy contracts are on-chain proxies that point to the aggregator for a particular data feed. Using proxies enables the underlying aggregator to be upgraded without any service interruption to consuming contracts. Proxy contracts can vary from one data feed to another, but the AggregatorProxy.sol contract on Github is a common example.

`Aggregator contract`: An aggregator is a contract that receives periodic data updates from the oracle network. Aggregators store aggregated data on-chain so that consumers can retrieve it and act upon it within the same transaction. For a complete list of functions and variables available on most aggregator contracts, see the Data Feeds API Reference.

## Reading proxy and aggregator configurations
Because the proxy and aggregator contracts are all on-chain, you can see the current configuration by reading the variables through an ABI or using a blockchain explorer for your network. For example, you can see the BTC/USD proxy configuration on the Ethereum network using Etherscan.

If you read the BTC/USD proxy configuration, you can query all of the functions and variables that are publicly accessible for that contract including the aggregator address, latestRoundData() function, latestAnswer variable, owner address, latestTimestamp variable, and several others. To see descriptions for the proxy contract variables and functions, see the source code for your specific data feed on Etherscan.

The proxy contract points to an aggregator. This allows you to retrieve data through the proxy even if the aggregator is upgraded. If you view the aggregator address defined in the proxy configuration, you can see the aggregator and its configuration. For example, see the BTC/USD aggregator contract in Etherscan. This contract includes several variables and functions, including another latestRoundData(). To see descriptions for the aggregator variables and functions, see the source code on GitHub or Etherscan.

You can call the latestRoundData() function directly on the aggregator, but it is a best practice to use the proxy instead so that changes to the aggregator do not affect your application. Similar to the proxy contract, the aggregator contract has a latestAnswer variable, owner address, latestTimestamp variable, and several others.

## Components of an aggregator
The aggregator contract has several variables and functions that might be useful for your application. Although aggregator contracts are similar for each data feed, some aggregators have different variables. Use the typeAndVersion() function on the aggregator to identify what type of aggregator it is and what version it is running.

Always check the contract source code and configuration to understand how specific data feeds operate. For example, the aggregator contract for BTC/USD on Arbitrum is different from the aggregators on other networks.

## Updates to proxy and aggregator contracts
To accommodate the dynamic nature of off-chain environments, Chainlink Data Feeds are updated from time to time to add new features and capabilities as well as respond to externalities such as token migrations, protocol rebrands, extreme market events, and upstream issues with data or node operations.

These updates include changes to the aggregator configuration or a complete replacement of the aggregator that the proxy uses. If you consume data feeds through the proxy, your applications can continue to operate during these changes.

Proxy and aggregator contracts all have an owner address that has permission to change variables and functions. For example, if you read the BTC/USD proxy contract in Etherscan, you can see the owner address. This address is a multi-signature safe (multisig) that you can also inspect.

If you view the multisig contract in Etherscan using the Read as Proxy feature, you can see the full details of the multisig including the list of addresses that can sign and the number of signers required for the multisig to approve actions on any contracts that it owns.

The multisig-coordinated upgradability of Chainlink Data Feeds involves time-tested processes that balance collusion-resistance with the flexibility required to implement improvements and swiftly react to external conditions. The approach taken to upgradability will continue to evolve over time to meet user requirements.

## Monitoring data feeds
When you build applications and protocols that depend on data feeds, include monitoring and safeguards to protect against the negative impact of extreme market events, possible malicious activity on third-party venues or contracts, potential delays, and outages.

Create your own monitoring alerts based on deviations in the answers that data feeds provide. This will notify you when potential issues occur so you can respond to them.
