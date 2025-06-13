const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("NewsDAO", function () {
  let token, dao, owner, addr1, addr2;

  beforeEach(async function () {
    [owner, addr1, addr2] = await ethers.getSigners();

    const NewsToken = await ethers.getContractFactory("NewsToken");
    token = await NewsToken.deploy(ethers.utils.parseEther("1000"));
    await token.deployed();

    const NewsDAO = await ethers.getContractFactory("NewsDAO");
    dao = await NewsDAO.deploy(token.address);
    await dao.deployed();

    await token.transferOwnership(dao.address);
  });

  it("allows story submission and voting", async function () {
    await dao.connect(addr1).submitStory("ipfs://story1");
    await dao.connect(addr2).vote(0);

    const story = await dao.stories(0);
    expect(story.voteCount).to.equal(1);

    expect(await token.balanceOf(addr2.address)).to.equal(ethers.utils.parseEther("1"));
    expect(await token.balanceOf(addr1.address)).to.equal(ethers.utils.parseEther("1"));
  });

  it("prevents double voting", async function () {
    await dao.connect(addr1).submitStory("ipfs://story1");
    await dao.connect(addr2).vote(0);
    await expect(dao.connect(addr2).vote(0)).to.be.revertedWith("Already voted");
  });
});
