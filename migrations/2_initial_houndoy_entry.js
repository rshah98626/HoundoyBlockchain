const Houndoy = artifacts.require("./Houndoy.sol");

module.exports = function (deployer) {
  deployer.deploy(Houndoy);
};
