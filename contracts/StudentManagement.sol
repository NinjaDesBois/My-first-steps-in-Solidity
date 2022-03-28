// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract StudentManagement{
 
 address owner;
 
 struct grades{
     string subject;
     uint grade;
}

 struct student{
     string name;
     string surname;
     uint numberofgrades;
     mapping(uint => grades) Grades;
 }
 
 mapping(address => student) Students;

 constructor(){
     owner =msg.sender;
 }

 function addStudent(address _studentadress , string memory _name , string memory _surname)public{
     require(msg.sender == owner , "Not allowed");

      //verifier si l'eleve existe deja
      bytes memory existName = bytes(Students[_studentadress].name);
      require(existName.length == 0 , "Name already exists");
      //si le nom n'existe pas on passe a la suite de la fonction
      Students[_studentadress].name = _name;
      Students[_studentadress].surname = _surname;
 }

 function addGrade(address _studentadress , uint _grade, string memory _subject) public{
    require(msg.sender == owner , "Not allowed");

    //verifier si l'eleve existe deja
      bytes memory existName = bytes(Students[_studentadress].name);
      require(existName.length == 0 , "Student not found");
      //si le nom n'existe pas on passe a la suite de la fonction
      Students[_studentadress].Grades[Students[_studentadress].numberofgrades].grade= _grade;
      Students[_studentadress].Grades[Students[_studentadress].numberofgrades].subject= _subject;
      Students[_studentadress].numberofgrades ++;     
 }

 function getGrades(address _studentadress)public view returns(uint[] memory){
    require(msg.sender == owner , "Not allowed");
    uint numberGradesOfThisStudent = Students[_studentadress].numberofgrades;
    uint[] memory grades = new uint[](numberGradesOfThisStudent);
    for(uint i=0 ; i< numberGradesOfThisStudent ; i++){
        grades[i] = Students[_studentadress].Grades[i].grade; 
    }

    return grades;
 }
 }