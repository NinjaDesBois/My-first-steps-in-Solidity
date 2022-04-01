// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract evenements {
//Event is an inheritable member of a contract. 
//An event is emitted, it stores the arguments passed in transaction logs. 
//These logs are stored on blockchain and are accessible using address of the contract till the contract is present on the blockchain.
  
 uint[] numbers;
 event addNumber(address _address , uint _number);

 function add(uint _number) external {
   numbers.push(_number);
   emit addNumber(msg.sender , _number);

 }

}

