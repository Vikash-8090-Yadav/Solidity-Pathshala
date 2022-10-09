# ERC-20 Upgradable Smart Contract

## About this Project

Normally, when we deploy smart contracts on the blockchain, it is impossible to edit the code deployed. And it should be totally fine that way. The fact that it could not be deployed to replace the existing codes means that that particular contract can not be modified afterward. (this increase safety of people who interact with that contract)

Immutability comes with the drawback that bugs will not be fixed, gas optimizations won’t be implemented, existing functionality will not be improved

But, what are upgradable smart contracts? First off, you should be aware that the word "upgradable" in this context does not imply mutable. One of the fundamental tenets of EVM is that a contract cannot be altered once it has been deployed. An upgradeable smart contract, on the other hand, employs a unique proxy pattern. The latter entails implementing implementation contracts and proxy contracts (logic contracts)

This project will look at the creation and execution of tests for upgradeable ERC-20 contracts.

To Watch the Video Version go [here](#video-version)

---

## What is an Upgradable Contract

> An Upgradable contract is a contract that can be (kind of) altered, after the deployment. At the time this article was written, to use an upgradeable smart contract, there is a tool, or plugin, to help us build. This plugin is introduced by [OpenZeppelin](https://www.openzeppelin.com/).

---

## 🤔 Why an Upgrade

Here’s what you’d need to do to fix a bug in a contract you cannot upgrade:

- Deploy a new version of the contract

- Manually migrate all state from the old one contract to the new one (which can be very expensive in terms of gas fees!)

- Update all contracts that interacted with the old contract to use the address of the new one

- Reach out to all your users and convince them to start using the new deployment (and handle both contracts being used simultaneously, as users are slow to migrate)

---

## 🙋 How does it work

We must first comprehend what a delegate call is in order to grasp how it operates.

> `delegatecall` is a low level function similar to call. When contract A executes delegatecall to contract B, B's code is executed with contract A's storage

<br>

First, an external caller makes a function call to the proxy. Second, the proxy delegates the call to the delegate, where the function code is located. Third, the result is returned to the proxy, which forwards it to the caller. Because the `delegatecall` is used to delegate the call, the called function is executed in the context of the proxy. This means that the storage of the proxy is used for function execution, thus resulting in the limitation that the storage of the delegate contract has to be append only. The `delegatecall` opcode was introduced in [EIP-7](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-7.md).

<img src="https://dev-to-uploads.s3.amazonaws.com/uploads/articles/3fl7hdmh7f160kkpsq19.png" alt="Working of a Upgradable Contract" width="600px" />

---

## 📃 Let's start making a Upgradable ERC-20 Contract

### **Step 1: Set up Development Environment**

Firstly initialize a npm project using the following command:

```bash
npm init -y
```

Now we will Install Hardhat which will be used to deploy our smart contract to the Blockchain

```bash
npm install --save-dev hardhat
```

and then let's create a Hardhat project and install necessary dependencies:

```bash
npx hardhat
```

```bash
npm install --save-dev @openzeppelin/contracts-upgradeable @nomiclabs/hardhat-ethers @openzeppelin/hardhat-upgrades dotenv
```

Here we have installed the dependency `dotenv` which will be used to access secrets from the `.env` file.

---

### **Step 2: Get Alchemy Credentials**

We must connect Hardhat to the Polygon Mumbai Testnet with RPC credentials in order to deploy our Contracts there. The following features of Alchemy are beneficial. You must have an Alchemy Account to begin using the programme. If you don't already have one, you can quickly create one. Creating an account with Alchemy is easy, [sign up for free here](https://dashboard.alchemyapi.io/signup/).

<img src="https://i.ibb.co/hZpxZPJ/signup.png" width="400px" />

<br>

Now it is time to Create an Alchemy app. To use Alchemy’s products, you need an API key to authenticate your requests. You can create API keys from the [dashboard](https://dashboard.alchemy.com/). To make a new key, navigate to “+ CREATE APP” as shown below:

<img src="https://i.ibb.co/r5Hdfq8/create-app.png" width="800px" />

Fill in the details under “CREATE APP” and click on Create App. In this case we will be using Polygon Chain and Mumbai Network. You can also see apps you previously made and those made by your team here. Pull existing keys by clicking on “View Key” for any app.

Once You app is created you can view you `RCP_URL` and `API_Key` by clicking the View Key Button.

<img src="https://i.ibb.co/hKzhHBQ/key.png" width="400px" />

<br>

The link under the `HTTPS` heading is your `RPC_URL`.

---

### **Step 3: Setup Hardhat config**

Create a new file called `.env` in your project root and add the following details.

```
URL = 'URL_HERE'
PRIVATE_KEY = 'PRIVATE_KEY_HERE'
```

You can get your RPC URL from [Alchemy](https://dashboard.alchemyapi.io/).
`PRIVATE_KEY` will be your Metamask Account Private Key(Not the key phrase).
For this tutorial we will be using Polygon Mumbai Testnet.
Make sure you have some testnet funds in your account.

Open up `hardhat.config.js` and replace the existing code with this

```javascript
require("@nomiclabs/hardhat-ethers");
require("@openzeppelin/hardhat-upgrades");
require("dotenv").config();

module.exports = {
  solidity: "0.8.7",
  networks: {
    mumbai: {
      url: process.env.URL,
      accounts: [process.env.PRIVATE_KEY],
    },
  },
};
```

Here, we merely initialise a basic boilerplate that hardhat may utilise to get the parameters needed to deploy our smart contract.

---

### **Step 4: Create a new ERC20 Upgradable Contract.**

Open the `Contracts` Folder and create a new file called `ERC20UpgradeableV1.sol`.

This will be out first Version of Smart Contract.

First we will make a Upgradable ERC-20 Contract using [OpenZeppelin Contract Wizard](https://docs.openzeppelin.com/contracts/4.x/wizard) using the following configuration.

<br>

![Contract Wizard](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/k7b59b17ef2mm34mojqk.png)

Here is a sample code for a upgradable contract

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract ERC20UpgradableV1 is Initializable, ERC20Upgradeable, ERC20BurnableUpgradeable, PausableUpgradeable, OwnableUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize() initializer public {
        __ERC20_init("ERC20Upgradable", "EUC");
        __ERC20Burnable_init();
        __Pausable_init();
        __Ownable_init();
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}
```

The above ERC-20 contract is a normal contract with `mint`,`pause` and `burn` properties.

---

### **Step 5: Deploy Contract.**

Now is the time to write our deploy Script.
For this we use [deployProxy](https://docs.openzeppelin.com/upgrades-plugins/1.x/api-hardhat-upgrades#deploy-proxy) function instead of normal deploy function.

Create a new file called `deploy.js` in the scripts folder.

```javascript
const { ethers, upgrades } = require("hardhat");

async function main() {
  const ERC20UpgradableV1 = await ethers.getContractFactory(
    "ERC20UpgradableV1"
  );
  console.log("Deploying ERC20UpgradableV1...");
  const contract = await upgrades.deployProxy(ERC20UpgradableV1, [], {
    initializer: "initialize",
    kind: "transparent",
  });
  await contract.deployed();
  console.log("ERC20UpgradableV1 deployed to:", contract.address);
}

main();
```

now run the script with the following command

```bash
npx hardhat run scripts/deploy.js --network mumbai
```

The output should be something like this

```bash
Compiled 11 Solidity files successfully
Deploying ERC20UpgradableV1...
ERC20UpgradableV1 deployed to: 0xC81cBaB47B1e6D6d20d4742721e29f22C5835dcB
```

Take note of the deployed contract address, it will be useful for testing our smart contract.

---

### **Step 6: Testing Contract**

Now we have to test our smart contract so in terminal run

```bash
npx hardhat console --network mumbai
```

The aforementioned command will log us into the Polygon Mumbai Blockchain hardhat console where we may communicate with other contracts that have been set up on the Mumbai Blockchain.

Let's now use the following command to initialise a new variable with our `ERC20UpgradableV1` contract:

```js
const Contract = await ethers.getContractFactory("ERC20UpgradableV1");
```

We now connect the deployed contract to the initialised variable mentioned earlier. The deployed contract address is completed in step 5 and is what you will require.

```js
const contract = await Contract.attach(
  "0xC81cBaB47B1e6D6d20d4742721e29f22C5835dcB"
);
```

The above two commands get the contract and connect to it

We will issue 100 tokens to a recipient, in my example `0xBF4979305B43B0eB5Bb6a5C67ffB89408803d3e1`.

The ethers utils library assists us in parsing integers into ether tokens, therefore we used `ethers.utils.parseEther("100.0")` instead of just `100` because `100` provides us tokens in _wei_ that are 100 \* 10<sup>-18</sup>.

```js
await contract.mint(
  "0xBF4979305B43B0eB5Bb6a5C67ffB89408803d3e1",
  ethers.utils.parseEther("100.0")
);
```

The above command will mint 100 Tokens to `0xBF4...3e1`

You can checck your metamask wallet to see if the token have arrived. It may take 2-5 mins for the tokens to arrive.

![Balance](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/o99vsxshrdqav2l8x9eb.png)

---

### **Step 7: Create a V2 Contract**

Let's imagine we now wish to add a new feature to our contract, say `"whitelist"` On a conventional contract, we would not be able to modify the code, but on an upgradeable contract, we could simply direct calls to another implementation contract through the proxy contract.

In the contracts folder, let's create a new contract named `"ERC20UpgradableV2.sol"` and add some rudimentary whitelist functionality by mapping an address to a boolean and then determining if the address is whitelisted or not during the mint function.

Here's the code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract ERC20UpgradableV2 is Initializable, ERC20Upgradeable, ERC20BurnableUpgradeable, PausableUpgradeable, OwnableUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    mapping(address => bool) whitelistedAddresses;

    function addUser(address _addressToWhitelist) public onlyOwner {
        whitelistedAddresses[_addressToWhitelist] = true;
    }

    function verifyUser(address _whitelistedAddress) public view returns(bool) {
        bool userIsWhitelisted = whitelistedAddresses[_whitelistedAddress];
        return userIsWhitelisted;
    }

    function initialize() initializer public {
        __ERC20_init("ERC20Upgradable", "EUC");
        __ERC20Burnable_init();
        __Pausable_init();
        __Ownable_init();
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public {
        require(verifyUser(to));
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}
```

Here, we've built a straightforward mapping that associates user addresses with a boolean value that denotes whether they're on a whitelist or not.

Additionally, we developed the two functions `verifyUser` and `addUser`. `addUser` maps the user address to a boolean value `true`. `verifyUser` returns `true` if the mapping for the user address contains `true` and returns `false` if it does not.

We utilise the `verifyUser` Function in our `mint` function to check whether the user has a whitelist or not; if not, we receive an error and return; otherwise, we mint `100` tokens to the provided address.

---

### **Step 8: Upgrading the Contract**

Make a new file called `upgrade.js` in the scripts folder and add the following code to it.

```javascript
const { ethers, upgrades } = require("hardhat");

async function main() {
  const ERC20UpgradableV2 = await ethers.getContractFactory(
    "ERC20UpgradableV2"
  );
  console.log("Upgrading ERC20UpgradableV1...");
  await upgrades.upgradeProxy(
    "0xC81cBaB47B1e6D6d20d4742721e29f22C5835dcB",
    ERC20UpgradableV2
  );
  console.log("Upgraded Successfully");
}

main();
```

Run this file with the following command

```bash
npx hardhat run scripts/upgrade.js --network mumbai
```

You should get the following output

```bash
Upgrading ERC20UpgradableV1...
Upgraded Successfully
```

Let's do some tests now that the Contract has successfully been upgraded and whitelist capability has been added.

---

### **Step 9: Running Tests for Upgraded Contract**

We must now connect to the Hardhat Mumbai console, initialise our smart contract, and attach the contract address before we can test it.

```bash
npx hardhat console --network mumbai
```

```js
const Contract = await ethers.getContractFactory("ERC20UpgradableV2");
```

```js
const contract = await Contract.attach(
  "0xC81cBaB47B1e6D6d20d4742721e29f22C5835dcB"
);
```

The above two commands get the contract and connect to it

Now let's check if we are whitelisted or not

```js
await contract.verifyUser("0xBF4979305B43B0eB5Bb6a5C67ffB89408803d3e1");
```

The result should be `false`

Let's try to mint tokens without having a whitelist and see if we get an error or not

```js
await contract.mint(
  "0xBF4979305B43B0eB5Bb6a5C67ffB89408803d3e1",
  ethers.utils.parseEther("100.0")
);
```

We get the following error

```js
Error: cannot estimate gas; transaction may fail or may require manual gas limit
```

which indicates that the V2 contract handles execution, and because we lack whitelist access, we are unable to mint tokens.

Let's now give ourselves whitelist access and then try to mint tokens.

```js
await contract.addUser("0xBF4979305B43B0eB5Bb6a5C67ffB89408803d3e1");
```

Now wait about 30 seconds till the transaction gets hashed and then again verify that the address has whitelist access.

```js
await contract.verifyUser("0xBF4979305B43B0eB5Bb6a5C67ffB89408803d3e1");
```

This time we should get `true` and now we can mint tokens

```js
await contract.mint(
  "0xBF4979305B43B0eB5Bb6a5C67ffB89408803d3e1",
  ethers.utils.parseEther("100.0")
);
```

![Balance](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/pfzg5f8m05oxcb28caxo.png)

---

This explains how to use the OpenZeppelin Upgradable Smart Contract Library to upgrade contracts to the same contract address in order to fix errors and add new features to an already-deployed smart contract.

---

## Video Version

<br>

https://user-images.githubusercontent.com/65389981/194726748-231107e0-ff94-458f-9890-7b5c3aa4bb8c.mp4

---
