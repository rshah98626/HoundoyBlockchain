const { assert } = require("chai");
const web3 = require("web3");

const Houndoy = artifacts.require("./Houndoy");

contract("Houndoy", (accounts) => {
  let [alice, bob] = accounts;
  let contractInstance;
  beforeEach(async () => {
      contractInstance = await Houndoy.new();
  });
  it("is a test", async () => { 
    assert.equal(true, true);
  });

  it("should be able to mint a token for a user", async () => {
    const result = await contractInstance.mintToken({from: alice, value: web3.utils.toWei(".001", "ether")});
    assert.isTrue(result.receipt.status);
    console.log(result.receipt.logs[0].args);
    //assert.equal(result.logs[0].args.id.toNumber(), alice);
  });
  
  xit("should be able to mint multiple tokens for a user", async () => {});
  xcontext("single-step transfer", async () => {
    it("should be able to transfer a token from one user to another", async () => {});
    it("should be able to transfer multiple tokens from one user to another", async () => {});
  })
  xcontext("two-step transfer", async () => {
    it("should approve a token transfer and then send the token when the approved address calls transferFrom", async () => {});
    it("it should approve a token transfer and then send the token when the owner calls transferFrom", async () => {});
  })
});