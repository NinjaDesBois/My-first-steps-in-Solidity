// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ExoStruct{

//Le struct est un genre d'objets qui peux contenir plusieurs variables afin de l'integrer dans un tableau mapping
struct balance {
    uint numpayements;
    uint money;
}
//mapping de chaque adresse avec le struct
mapping(address=> balance) Balances;


//fonction de paiement 
 receive() external payable{
    Balances[msg.sender].money +=msg.value;
    Balances[msg.sender].numpayements +=1;
}

//Lire la balance de chaque utilisateur qui a envoyer de l'argent
 function getBalance() public view returns(uint){
    return Balances[msg.sender].money ;
 }
//Lire la le nombre de paiement de chaque utilisateur qui a fait sur le SC
 function getnumpayements() public view returns(uint){
    return Balances[msg.sender].numpayements;
}

}