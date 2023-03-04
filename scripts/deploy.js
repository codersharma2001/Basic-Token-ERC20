const { ethers } = require("hardhat");

async function main() {
  const initialSupply = 1000000; // set the initial supply for your token
  const tokenName = "My Token"; // set the name for your token
  const tokenSymbol = "MYT"; // set the symbol for your token
  const decimalUnits = 18; // set the number of decimal units for your token

  // deploy the contract
  const BasicToken = await ethers.getContractFactory("BasicToken");
  const token = await BasicToken.deploy(initialSupply, tokenName, tokenSymbol, decimalUnits);

  console.log("Token address:", token.address);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
