// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract test {
  address lastPerson;
  uint balance;

  function getLastperson() public view returns(address){
      return lastPerson;
  }

  function getBalance() public view returns(uint){
      return balance;
  }

  receive() external payable{
     lastPerson = msg.sender;
     balance = balance + msg.value;
  }

}