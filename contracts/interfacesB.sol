// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import './interfacesA.sol';

contract B {
  
  address addressA ;

  function setAdress(address _addressA)external {
      addressA = _addressA;
  }

  function callGetNumber()external view returns (uint) {
      interfaceA a = interfaceA (addressA);
      return a.getNumber();
  }

  function callSetNumber(uint _number)external {
      interfaceA a = interfaceA (addressA);
      a.setNumber(_number);
  }
}

