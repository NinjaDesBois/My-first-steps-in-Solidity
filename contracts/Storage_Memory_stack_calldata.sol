// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Storage_Memory_stack_calldata {
    //A variable outside a function is by default on Storage , Storage means that the data is write into the blockchain
    uint number;
    
    //Here the difference between Storage and Memory
    //1.Storage
    uint[]public myArray;

    function Dosomething() external {
        myArray.push(7);
        myArray.push(17);

        uint[] storage newArray = myArray;

        newArray[0]=1;
    }
    //In this Storage method the value of myArray become the new value of the new Array Storage, the variable will be changed
    //in the Blockchain and will be forever
    
    //2.Memory

    uint[] public MymemoryArray;

    function dosomethingelse()external {
        MymemoryArray.push(50);
        MymemoryArray.push(47);

        uint[] memory newmemoryarray= MymemoryArray;
        newmemoryarray[0]=5;
    }
    //in this function the memory array is valid only in the function and will be deleted when the function is finish
    

    //3.Stack
    //Stack is memory inside the function for a variable , the variable will have a value inside the function and will loose it when the function is executed

    uint number1;

    function stack() public {
        uint number2 = 5 ;
    }

    //4.CallData
    //When the function is external , memory = call data
    //example

    uint number3;

    function callData(uint[] calldata _users)external{

    }

}