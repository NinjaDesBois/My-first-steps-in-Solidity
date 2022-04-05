// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

 contract PayableSendCallTransfer {
      
      //transfer() 
      //Send()
      //Call()
       

      receive() external payable {

      }

      function transfer(address payable _to) external {
          payable(_to).transfer(address(this).balance);
      }

      function send(address payable _to) external {
          bool sent = payable(_to).send(address(this).balance);
          require (sent,"not sent");
      }

      function call(address payable _to) external {
        
        (bool success,) = payable(_to).call{value:10}("");
        require(success , "sent");
      }
 }