// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract StructMappingArrays{

//Structure de l'eleve
struct eleve{
    string name;
    uint[]notes;
}

//Mapping des eleves
mapping(address=>eleve) Eleves;

function addNotes(address _eleve,uint _note) public {
    Eleves[_eleve].notes.push(_note);
}
function getNotes(address _eleve)public view returns(uint[] memory){
    return Eleves[_eleve].notes;
}
function getNom(address _eleve)public view returns (string memory){
    return Eleves[_eleve].name;
}
function setNom(address _eleve, string memory _name) public{
    Eleves[_eleve].name=_name;
}
   
}