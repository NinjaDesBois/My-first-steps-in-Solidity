// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract WalletExo {
//Structure de l'objet wallet
 struct wallet{
 uint balance;
 uint numpay;

 }
 //mapping de chaque wallet avec son objet correspondant
 mapping(address=>wallet) Wallets;
//recevoir la balance totale du SC
 function getTotalBalance() public view returns(uint){
   return address(this).balance;
 }
 //recevoir la balance specifique du msg.sender
 function getBalanceOf() public view returns(uint){
     return Wallets[msg.sender].balance;
 }
//fonction pour recuperer son argent
 function withdrawAll(address payable _to) public{
     uint _amount=Wallets[msg.sender].balance;
     Wallets[msg.sender].balance= 0 ;
     _to.transfer(_amount);

 }
 //fonction de paiement sur SC
 receive()external payable {
     Wallets[msg.sender].balance +=msg.value;
     Wallets[msg.sender].numpay +=1;
 }
 

}