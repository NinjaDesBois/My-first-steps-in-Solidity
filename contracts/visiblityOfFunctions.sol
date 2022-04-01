// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Visibility {
    //1.PRIVATE : can be called only inside the contract,the name of the function  has to start with a underscore
    uint number;

    function _setNumber(uint _number) private {
        number = _number;
    }



    //2.INTERNAL : Same as PRIVATE but can be called also from others smart contract with heritage

    contract X is ParentContract {
    function _setNombre (uint _number) internal{     
         //ACTION          
    }

    }


    //3.EXTERNAL : Can be called only outside the contract
     function setNumberexternal(uint _number) external {
        number = _number;
    }

    //4.PUBLIC : can be called both inside the contract but also outside the contract
       function setNumberPublic(uint _number) public {
        number = _number;
       }

       //Visibility can also be added to variables
       //For example 
       uint private number
       uint internal number
       uint external number
       //By default a variable is always private but if you change it to internal or public so the variable become also a getter function;

}