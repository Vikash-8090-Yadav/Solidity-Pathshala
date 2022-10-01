# 1. Smart Contract Language
### The most important thing for a smart contract developer is to able to write the smart contract and for that, developers should know the languages used in writing smart contract. Some of the common languages used in writing smart contracts 

### - [Solidity](https://docs.soliditylang.org/): Solidity is the most dominant, most used smart contract development language. Solidity works on most smart contract platforms, like Ethereum, Avalanche, Moonbeam, Polygon, BSC, and more. This is due to most blockchains adopting the [Ethereum Virtual Machine (EVM)](https://ethereum.org/en/developers/docs/evm/), which solidity was built for. 
<p align="center" width="100%">
    <img src="https://res.cloudinary.com/practicaldev/image/fetch/s--Rxmub8vz--/c_imagga_scale,f_auto,fl_progressive,h_420,q_auto,w_1000/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/5jd65usaioipnkv5xs5a.png" width="300" height="200" class="center" >
</p>

### - [Vyper](https://vyper.readthedocs.io/en/stable/): Vyper is another EVM compatible language,  it is a python based language which support EVM. 
<p align="center" width="100%">
    <img src="https://repository-images.githubusercontent.com/73461676/d3e6c900-6a1b-11ea-91be-d87dfda8b8e7" width="300" height="200" class="center" >
</p>

### - [Rust](https://www.rust-lang.org/): Rust is the new in blockchain technology, and you’re not going to be able to use it with our EVM blockchains like Ethereum, Polygon, Binance Smart Chain, and such. However, with Rust, we can  able to deploy to chains like Solana, Terra and build blockchains with Polkadot. Rust is a performant general-purpose language used even outside smart contracts; 
<p align="center" width="100%">
    <img src="https://pbs.twimg.com/media/FTK93H3UAAAMGiU.png" width="300" height="200" class="center" >
</p>

## Smart Contract Language Summary - 

### **Must-Know**: Solidity

### Python Lovers: Vyper

### Terra, Solana, Polkadot, etc: Rust

# 2. Smart Contract Essentials
## Chainlink
### - Chainlink is what’s known as a [blockchain oracle](https://chain.link/education/blockchain-oracles), which means it’s a device that enables your smart contracts to become [hybrid smart contracts](https://blog.chain.link/hybrid-smart-contracts-explained/), which means they include some off-chain component and connect with the real world.
### - To use some off-chain component (like data or external computation) to keep our smart contracts decentralized, we must also have our external data and computation decentralized, and that’s exactly what the Chainlink network and tooling are for.
### - Chainlink is an essential feature for any smart contract developer coming into this space, no matter the language or blockchain!
<p align="center" width="100%">
    <img src="https://imageio.forbes.com/specials-images/imageserve/5f4a80a8be4f21f4dc24f9e8/Chainlink-logo/960x0.jpg?format=jpg" width="300" height="200" class="center" >
</p>

## Openzeppelin
### - [Openzeppelin](https://openzeppelin.com/) has cemented itself as the “standard library for solidity.” Anytime any developer is looking for a quick way to deploy an NFT/ERC721, ERC20, upgradable contracts, DAOs/governance.
### - Openzeppelin is a suite of smart contracts already written, so you don’t have to reinvent the wheel. It saved countless hours using their already-audited extendable smart contracts into projects.
<p align="center" width="100%">
    <img src="https://academy.moralis.io/wp-content/uploads/2021/06/openzeplogo.png" width="300" height="200" class="center" >
</p>

# 3. Deployment & Testing Framework
Smart Contract frameworks are an essential part of any developer’s journey. They allow you to test and deploy your smart contracts effectively. Having at least one is a crucial step to success.

## Hardhat
### - The hardhat framework is easily the most dominant smart contract development framework. Hardhat is a javascript & solidity-based development framework that does a beautiful job of quickly getting your applications up to speed. You can check out the [hardhat-starter-kit](https://github.com/smartcontractkit/hardhat-starter-kit) to see an example of what a hardhat project looks like.

### - With Hardhat’s testing speed, typescript support, wide adoption, incredible developer experience-focused team, it’s no wonder why it’s risen so quickly in popularity.

### - It uses ethersjs on the backend, its own local blockchain for testing, and the team is currently in the midst of building a new cutting edge development platform integrated into Hardhat.
<p align="center" width="100%">
    <img src="https://pbs.twimg.com/profile_images/1317925773425168384/XQkaoFRg_400x400.jpg" width="300" height="200" class="center" >
</p>

## Brownie
### - Brownie is an open-sourced python-based framework built on top of web3.py used by protocols like Curve.fi, yearn.finance, and Badger. 
### - It supports both solidity and vyper, but the main draw to this framework is python-based.
### - You can check out the [brownie-starter-kit](https://github.com/smartcontractkit/chainlink-mix) (also known as “mixes” in the brownie world) to begin your journey working with the framework. Be sure to check out the [Brownie Mixes](https://github.com/brownie-mix) repo for a list of other starter kits.
<p align="center" width="100%">
    <img src="https://repository-images.githubusercontent.com/155913585/1e5baf00-2b82-11eb-9f4c-1f47e216cf05" width="300" height="200" class="center" >
</p>

## DappTools
### - Although [Dapptools](https://github.com/smartcontractkit/dapptools-starter-kit) doesn’t have a fancy logo, it’s a compelling application built with Haskell. Don’t worry, though; you don’t need to know Haskell to use it!.
### - Used primarily by the [MakerDAO](https://makerdao.com/en/) team (the group behind DAI), Dapptools was inspired by the philosophy of Unix, “Write programs that do one thing, and do it well.” Dapptools is a command-line-focused tool where instead of having to work with python, javascript, or some other high-level programming language to aid your development, you can use the command line/shell tools that you’re already familiar with, like bash or zsh. 
<p align="center" width="100%">
    <img src="https://opengraph.githubassets.com/8bde2e7df540f303018c371f97bdf0bd09bdfaa289893adc860a08e8ce64aae2/dapphub/dapptools" width="300" height="200" class="center" >
</p>

## Remix
### - Remix isn’t a framework per se but more of an IDE. Remix is a tool that I think everyone should at least start with so that it’s a common ground that everyone can meet on when trying to share ideas.
### - When you deploy a contract, you get buttons to interact with it. It’s easy to choose solidity versions, compile, run solidity tests, and the like. And if you want to use javascript, it has javascript scripts available too! It comes fully extendable, so you can improve it if you want to add a feature, and you can even connect your local disk to remix to run code from your version-controlled repo.
<p align="center" width="100%">
    <img src="https://static.bluelabellabs.com/wp-content/uploads/2022/01/remix-testing.png" width="300" height="200" class="center" >
</p>


## Truffle
### [Truffle](https://github.com/smartcontractkit/truffle-starter-kit) is one of the original frameworks and was originally part of, spun out from, and then merged back into [Consensys](https://consensys.net/). It’s a javascript-based framework that comes packed with tools like [Ganache](https://trufflesuite.com/ganache/) (which even frameworks like brownie use), [Drizzle](https://trufflesuite.com/drizzle/), and the now late truffle 
<p align="center" width="100%">
    <img src="https://miro.medium.com/max/356/1*wCUtLH3FFYJmxjtDiq_82Q.png" width="300" height="200" class="center" >
</p>

## Others 
###  - [ApeWorX](https://www.apeworx.io/)
###  - [Foundry](https://www.paradigm.xyz/2021/12/introducing-the-foundry-ethereum-development-toolbox/)
###  - [Waffle](https://github.com/EthWorks/Waffle)
###  - [Saddle](https://github.com/compound-finance/saddle)
###  - [Embark](https://framework.embarklabs.io/https://framework.embarklabs.io/)
###  - Some Non EVM - [Anchor](https://project-serum.github.io/anchor/getting-started/introduction.html), [TerraSDK](https://docs.terra.money/SDKs/)

# 4. Wallet
### If you’re deploying smart contracts in some capacity, you need a wallet to store funds or at least [testnet funds](https://faucets.chain.link/). Wallets are of three types
### - Cold Wallet (Ledger / Trezor)
### - Hot Wallet (MetaMask)
### - Multi Sign (Gnosis Safe)


## MetaMask
### [MetaMask](https://metamask.io/) is a hot wallet that is easy to use.it is a great to start with blockchain and to use testnet. But when it comes to real network It is not that safe i.e you will be out of your account if your private key is out or somebody taken access to your PC.
<p align="center" width="100%">
    <img src="https://www.ledger.com/wp-content/uploads/2019/06/assets_logo_metamask.jpg" width="300" height="200" class="center" >
</p>

## Gnosis Safe
### [Gnosis Safe](https://gnosis-safe.io/) is known as a multi-sig wallet, meaning it takes X number of signatures to send a transaction. This way, if one wallet is compromised, it doesn’t matter since that attacker would need to compromise at least half of the keyholders.
This is a massive tool for smart contract developers, especially those handling a lot of money and want to make sure their assets are safe

<p align="center" width="100%">
    <img src="https://moonbeam.network/wp-content/uploads/2021/12/Gnosis-Safe-Logo.png" width="300" height="200" class="center" >
</p>

## Ledger / Trezor
### [Ledger](https://www.ledger.com/) and [Trezor](https://trezor.io/) are known as “cold wallets,” or wallets that are a bit more cumbersome to make transitions with. This cumbersomeness is intentional; they make it harder for you, especially attackers, to move funds.

<p align="center" width="100%">
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz75j4MbVxTLwXtSKgTyHXP1HtqKUIb6B7FNtEg9D8NAzFPyR8HDiiefauGfCMdyZVzDM&usqp=CAU" width="300" height="200" class="center" >
</p>


# 5.  Block Explorer
Block explorers are crucial tools for people who want to “see” transactions and what is going on in the world. You have all the tools at your disposal to build one of these if you have a layer one connection, but 99% of the time, you’re going to want to use someone else’s.

## Etherscan
### [Etherscan](https://etherscan.io/) is a free, open-sourced tools. Etherscan comes built-in with most services, Etherscan is easily the most dominant block explorer for the ETH community, and they have built support for projects like Polygon, ETH 2, and Binance Smart Chain.
<p align="center" width="100%">
    <img src="https://etherscan.io/assets/svg/logos/logo-etherscan.svg?v=0.0.2" width="300" height="200" class="center" >
</p>

## Etherchain
### [Etherchain](https://etherchain.org/) is a lightweight block explorer that has also released a wonderful [ETH 2 explorer](https://beaconcha.in/).
<p align="center" width="100%">
    <img src="https://etherchain.io/modules/site2/assets/images/logo.svg?2" width="300" height="200" class="center" >
</p>

## Ethplorer
### Another ETH Block explorer, [Ethplorer](https://ethplorer.io/), might be another explorer you might want to check out.
<p align="center" width="100%">
    <img src="https://opengraph.githubassets.com/458d163effd7b5da454f2054241fb9c3476be43823563ca0d9272b0050b670aa/EverexIO/Ethplorer" width="300" height="200" class="center" >
</p>

# 6. Layer 1 Connection
### A “layer one node” refers to your blockchain connection. For ex - For example, to send a transaction on the ETH chain, you need to send the transaction to an ETH node. Even Metamask and wallets have a connection to a layer one node running in the background!, Now to send transactions, you need a blockchain to send them to, Now, if you worry about cost, all of these have free options. 

## Alchemy
### [Alchemy](https://alchemy.com/?a=673c802981) is fantastic and is my go-to for an ETH connection and all EVM connections. It’s fast, has a beautiful UI for tracking requests, has a vast array of layer 1s, and it just works. They are incredibly responsive, have great support and developer advocate team
<p align="center" width="100%">
    <img src="https://cryptoummah.com/wp-content/uploads/2022/05/is-ach-alchemy-halal.jpg" width="300" height="200" class="center" >
</p>

## Infura
### [Infura](https://infura.io/) is another application that was easily the most dominant back in 2020 and might still be. They have expanded into more products like IPFS, have a solid following, and many tools natively work with Infura. If you’re looking for a solid layer 1, this is the one for you.
<p align="center" width="100%">
    <img src="https://miro.medium.com/max/1400/1*7yVCUf1rZTpgT0_-EQTtiw.jpeg" width="300" height="200" class="center" >
</p>

## Moralis
### [Moralis](https://moralis.io/) add more value  in their front-end services but also support First Layer Connection. 
<p align="center" width="100%">
    <img src="https://moralis.io/wp-content/uploads/2022/05/Moralis-Logo-LightBG-Large.png" width="300" height="200" class="center" >
</p>

## QuickNode
### If one of the above doesn’t have the blockchain I want, there is a chance [QuickNode](https://www.quicknode.com/) will. With a massive array of nodes you can connect to and a simple setup, QuickNode is another service that might be for you
<p align="center" width="100%">
    <img src="https://mma.prnewswire.com/media/1816922/QuickNode_Logo.jpg?p=facebook" width="300" height="200" class="center" >
</p>


# 7. Front End Tools
## Web3js/Ethersjs
### [Web3js](https://web3js.readthedocs.io/en/v1.5.2/) and [Ethersjs](https://docs.ethers.io/v5/) are the two main javascript frameworks that the world uses, and they both perform exceptionally well on the front end. You pretty much have to use one of these tools if you’re building a website, and they do an outstanding job. Recently, trends have been moving towards Ethersjs as the more popular one; however, they will both do the job.

## Moralis
### [Moralis](https://moralis.io/) is a tool that has web3js support out of the box and a MASSIVE array of tools to improve your front-end life. It’s marketed as the “firebase of crypto,” and I think it does precisely that. Maybe you want a database for making your front end faster; perhaps you want to build an Etherscan or an Opensea; maybe you need a list of NFTs an address owns. There are many things you might want to do that Moralis has built-in support for frontend.
