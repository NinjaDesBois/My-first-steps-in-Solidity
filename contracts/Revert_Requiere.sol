// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract RevertRequiere{
    
    uint number;
    //First Method (Revert stop the function and give back the gas that is not used in the function)
    function setNumber(uint _number) public {
        if(_number == 10){
            revert("The number cannot be equal to 10");
        }
        number=_number;
    }
    //Second method
    function setNumber2(uint _number)public{
     require(_number != 10,"The number cannot be equal to 10");
     number=_number;
    }

    function getNumber() public view returns(uint){
        return number;
    }
}