// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//Conditions structure(if ,else ,for and while

contract ConditionStructure {
//example if/else 1
    uint number; 

    function setNumber(uint _number) public{
        if(_number == 5){
            revert("not possible");
        }
        else{
            number = _number;
        }
    }
////////////////////////////////////////////////
//Example if/else 2
    bool is Paused 
    
    function isPaused()public{
        if(Paused){
            Paused = false
        }
        else{
            Paused = true
        }
    }

////////////////////////////////////////////////

//example for loop

uint number2 = 10

 function verification()public {
     for(uint i=0 , i<number2,i++);{
         //action
     }
 }

 ////////////
 //example while

 bool isPaused;

 function isItPaused(){
     while(!isPaused){
         if(...){
             isPaused =true;
         }
         break;
     }
 }
}