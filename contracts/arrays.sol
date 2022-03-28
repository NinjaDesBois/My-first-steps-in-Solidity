// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Arrays{
    //Declaration du tableau
    uint[] numbers;
    //Ajouter une valeur au tableau
    function addValue(uint _value) public{
        numbers.push(_value);
    }
    //Modifier une valeur du tableau
    function setNumber(uint _index , uint _value) public{
        numbers[_index]=_value;
    }
    //Effacer une valeur du tableau
    function deleteValue(uint _index) public{
        delete numbers[_index];
    }
    //Lire la valeur d'un tableau
    function getValueOf(uint _index) public view returns(uint){
        return numbers[_index];
    }
    //Recuperer les valeurs dans un autre tableau en les multipliant par 2
    function Doublevalue() public view returns(uint[] memory){
        uint longeur = numbers.length;
        uint[] memory Doublenumbers = new uint[](longeur);

        for(uint i = 0 ; i<longeur ; i++){
            Doublenumbers[i]=numbers[i]*2;
        }
        return Doublenumbers;
    }
}