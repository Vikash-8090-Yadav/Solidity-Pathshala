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
