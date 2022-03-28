// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ExoMApping{
//mapper chaque adresse a un uint comme un tableau
mapping(address=>uint) Balances;
//fonction d'envoi de valeur
receive() external payable{
    Balances[msg.sender]=msg.value;
}
//fonction pour lire chaque balance par utilisateur 
function getBalance(address _monAdresse) public view returns(uint){
    return Balances[_monAdresse];
}

}