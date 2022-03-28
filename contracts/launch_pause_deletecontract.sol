// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Owner{


  address owner;
  uint number;
  bool paused;

  constructor() {
      owner = msg.sender;
  }
 //pause the contract
  function setPaused(bool _paused) public{
      require(msg.sender == owner,"You are not the owner");
      paused=_paused;
  }
//set a number
  function setNumber(uint _number) public{
      require(msg.sender == owner,"You are not the owner");
      require(!paused,"contract is paused");
      number=_number;
  }
//get the number setted
  function getNumber() public view returns(uint){
      return number;
  }

  function destroy(address payable _to) public{
      require(msg.sender == owner,"Not the owner");
      selfdestruct(_to);
  }

}