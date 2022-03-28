// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract exoEnum{
    //enumeration de chaque etape du contrat
   enum step {booked , shiped , delivery}
//structure de l'objet produit
   struct product{
       uint _SKU;
       step _step;
   }

   mapping(address => product) Commandes;
//fonction de commande
   function command(address _client,uint _SKU)public{
       product memory p=product(_SKU,step.booked);
       Commandes[_client] = p;
   }
//fonction d'expedition
   function expedition(address _client) public{
       Commandes[_client]._step = step.shiped;
   }
//Lire le SKU d'un produit depuis l'adresse du client
   function getSKU(address _client) public view returns(uint){
       return Commandes[_client]._SKU;
   }
//Lire a quel etape se trouve un produit
   function getStep(address _client) public view returns(step){
       return Commandes[_client]._step;
   }
}