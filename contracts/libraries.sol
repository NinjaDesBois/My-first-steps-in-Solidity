// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import '@openzeppelin/contracts/utils/Strings.sol';
//How to use a library ? here an example of how to import utils from openzeppelin to convert uint to strings


contract libraries {
    function concatenation(uint _numberA , string memory _string , uint _numberB)external pure returns(string memory){
        string memory res = string(abi.encodePacked(Strings.toString(_numberA), _string , Strings.toString(_numberB) ));
        return res;
    }
 }
