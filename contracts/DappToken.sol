pragma solidity ^0.4.2;

//ERC-20 standard

contract DappToken{
  //Name
  string public name = "DApp Token";
  //Symbol
  string public symbol ="DAPP";

  // below is not part of ERC-20 standard
  string public standard ="DApp Token v1.0";

  // Constructor
  // Set the total number of tokens
  //Read the total number of tokens
  uint256 public totalSupply;

  event Transfer(
    address indexed _from,
    address indexed _to,
    uint256 _value
    );

    //Approve
    event Approval(
      address indexed _owner,
      address indexed _spender,
      uint256 _value
      );

  mapping(address => uint256) public balanceOf;


  //allowance
  mapping(address => mapping(address => uint256)) public allowance;


  function DappToken(uint256 _initialSupply) public{
    balanceOf[msg.sender] = _initialSupply;
    totalSupply = _initialSupply;
    //allocate the intial supply
  }

  //tranfer

  function transfer(address _to, uint256 _value) public returns (bool success){
    //Exception if account doesn't have enough
    require(balanceOf[msg.sender] >= _value);
    //Transfer the balanceOf
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;
    //Transfer Event
    Transfer(msg.sender,_to,_value);
    //Return a boolean
    return true;
  }

  // Delegated Transfer

  //approve
  function approve(address _spender,uint256 _value) public returns(bool success){
    // allownace
    allowance[msg.sender][_spender] = _value;
    //Approve event
    Approval(msg.sender, _spender, _value);
    return true;
  }

  //tranferFrom
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
    //Require _from has enough tokens
    require(_value <= balanceOf[_from]);

    //Require allowance is big enough
    require(_value <= allowance[_from][msg.sender]);

    // change the balanceOf
    balanceOf[_from] -= _value;
    balanceOf[_to]+= _value;

    // update the allowance
    allowance[_from][msg.sender]-=_value;

    // transfer event
    Transfer(_from,_to,_value);

    // return a boolean
    return true;
  }




}
