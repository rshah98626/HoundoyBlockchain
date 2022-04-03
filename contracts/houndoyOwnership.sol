// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "./erc721.sol";
import "./Houndoy.sol";

contract HoundoyOwnership is Houndoy, ERC721 {
  mapping (uint => address) approvals;

  function balanceOf(address _owner) override external view returns (uint256) {
    return addressToTokenCount[_owner];
  }

  function ownerOf(uint256 _tokenId) override external view returns (address) {
    return tokenToAddress[_tokenId];
  }

  function transferFrom(address _from, address _to, uint256 _tokenId) override external payable {
    require(tokenToAddress[_tokenId] == msg.sender || approvals[_tokenId] == msg.sender);
    addressToTokenCount[_from]--;
    addressToTokenCount[_to]++;
    tokenToAddress[_tokenId] = _to;
    emit Transfer(_from, _to, _tokenId);
  }

  function approve(address _approved, uint256 _tokenId) override external payable {
    require(msg.sender == tokenToAddress[_tokenId]);
    approvals[_tokenId] = _approved;
    emit Approval(msg.sender, _approved, _tokenId);
  }
}