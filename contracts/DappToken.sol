pragma solidity ^0.4.2;

//ERC-20 standard

contract DappToken{
  // Constructor
  // Set the total number of tokens
  //Read the total number of tokens
  uint256 public totalSupply;

  function DappToken() public{
    totalSupply = 1000000;

  }
}
