// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract StudentManagement{
  address owner;

  struct grade{
      string subject;
      uint   note;
  }

  struct student{
      string name;
      string surname;
      uint numberOfgrade;
      mapping(uint => grade) Grades;
  }

  mapping(address => student) Students;

  constructor(){
      owner = msg.sender;
  }

  function addStudent(address _studentAdress , string memory _name , string memory _surname) public {
      require(msg.sender == owner , "you are not allowed to proceed this action");
      bytes memory AlreadyExist = bytes(Students[_studentAdress].name);
      require(AlreadyExist.length == 0 , "Student Already Exist");
      Students[_studentAdress].name =_name;
      Students[_studentAdress].surname = _surname;
        }

  function addGrade (address _studentAdress , string memory _subject , uint _note) public {
      require(msg.sender == owner , " you are not allowed to proceed this action");
      bytes memory Alreadyexist = bytes(Students[_studentAdress].name);
      require(Alreadyexist.length > 0 , "You have to create a student first");
      Students[_studentAdress].Grades[Students[_studentAdress].numberOfgrade].note = _note;
      Students[_studentAdress].Grades[Students[_studentAdress].numberOfgrade].subject = _subject;
      Students[_studentAdress].numberOfgrade ++;
  }

  function getGrades(address _studentAdress) public view returns (uint[] memory) {
    require(msg.sender == owner , " you are not allowed to proceed this action");
    uint GradesOfThisStudent = Students[_studentAdress].numberOfgrade;
    uint[] memory result = new uint[](GradesOfThisStudent);
    for(uint i=0 ; i<GradesOfThisStudent ; i++){
        result[i] = Students[_studentAdress].Grades[i].note;
    }
    return result;
  }
 }