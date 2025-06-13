const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with", deployer.address);

  const NewsToken = await ethers.getContractFactory("NewsToken");
  const token = await NewsToken.deploy(ethers.utils.parseEther("1000"));
  await token.deployed();
  console.log("NewsToken deployed to", token.address);

  const NewsDAO = await ethers.getContractFactory("NewsDAO");
  const dao = await NewsDAO.deploy(token.address);
  await dao.deployed();
  console.log("NewsDAO deployed to", dao.address);

  // transfer ownership of token to DAO
  await token.transferOwnership(dao.address);
  console.log("Token ownership transferred to DAO");
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
