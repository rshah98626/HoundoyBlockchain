// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "./ownable.sol";

contract Houndoy is Ownable {
  event NewHoundoy(uint _tokenId, address _owner);

  uint private id = 0;
  mapping (uint => address) public tokenToAddress;
  mapping (address => uint) public addressToTokenCount;
  uint mintFee = .001 ether;

  function setLevelUpFee(uint _fee) external onlyOwner {
    mintFee = _fee;
  }

  function mintToken() public payable returns (uint) {
    require(msg.value >= mintFee);
    return _mintToken();
  }

  function _mintToken() private returns (uint) {
    tokenToAddress[id] = msg.sender;
    addressToTokenCount[msg.sender]++;
    emit NewHoundoy(id, msg.sender);
    id++;
    return id - 1;
  }
}

