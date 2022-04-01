// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import './2_Owner.sol';

contract Flats is Owner {

 enum typesOf {flat , house , villa}
 uint count;

 struct estate{
     uint id;
     string name;
     uint price;
     typesOf _typesOf;
 }   

 mapping(address => estate[]) Possessions;

 function addEstate(address _ownerOf , string memory _name , uint _price , typesOf _typesOf)public isOwner{
     require(_price > 1000 , "The minimum price is 1000wei");
     require(uint(_typesOf) >= 0 , "Choose a type");
     require(uint(_typesOf) <= 2 , "Choose a type");
     Possessions[_ownerOf].push(estate(count , _name , _price , _typesOf));
     count ++;
 }

 function getAllEstatesOf(address _ownerOf) public view isOwner returns(estate[] memory){
     return Possessions[_ownerOf];
 }

 function getMynumbersOfestates() public view returns(uint){
     return Possessions[msg.sender].length;
 }
}