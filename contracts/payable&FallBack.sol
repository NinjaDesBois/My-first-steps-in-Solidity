// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Payable {

  function get() public view returns (uint) {
      return address(this).balance / 1 ether;
  }

  receive() external payable {

  }

} 