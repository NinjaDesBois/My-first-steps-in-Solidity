// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

  contract Vax {
    
    string public CODE ="Covid Vax";
    address public product;
    address public supplier;
    address public hospital;
    mapping (address => bool)public deliverers;

    enum Step{production , waiting , onWay, shipped , defective}
    enum DefectiveReason{nothing , temperature , accident , confusion}
    
    //Events about the owner of product and deliverer
    event OwnerOfProduct(address supplier);
    event Deliverer(address deliverer);


    //Events if the product is defective
    event Temperature(string temperature);
    event Accident(string accident);
    event Confusion(string confusion);

    Step public step;
    DefectiveReason public defectiveReason;

    constructor(address _product , address _hospital){
       supplier = msg.sender;
       product = _product;
       hospital = _hospital;
       step = Step.production;
       emit OwnerOfProduct(supplier);
    }

    modifier isOwner(){
        require(msg.sender == supplier, " You are not the owner");
        _;
    }

       modifier isDeliverer(){
        require(deliverers[msg.sender] == true, " You are not the owner");
        _;
    }

    function Auth(address _deliverer)external isOwner{
        deliverers[_deliverer] = true;
        emit OwnerOfProduct(msg.sender);
    }
    
    function StepOfDelivery() external isOwner{
        require(step == Step.production, "Not in production");
        step = Step.waiting;

        emit OwnerOfProduct(msg.sender);
    }

    function deliveryManfunction() external isDeliverer{
        require(step == Step.waiting , "Not ready");
        step = Step.onWay;
        emit Deliverer(msg.sender);
    }

    function delivery()external {
        require(step == Step.onWay , "Still waiting for delivery");
        require(msg.sender == hospital, "Not the right hospital");
        step = Step.shipped;
        emit OwnerOfProduct(msg.sender);
    }

      function ProductDestruct(DefectiveReason _reason)external {
        require(step == Step.shipped , "Still waiting for delivery");
        require(msg.sender == hospital, "Not the right hospital");
        step = Step.defective;
        
        if (_reason == DefectiveReason.temperature){
            emit Temperature(" temperature too high or too low during delivery");
        }
        else if (_reason == DefectiveReason.accident){
            emit Accident("Accident during delivery");
        }
        else{
            emit Confusion("There was a confusion of product during the delevery");
        }

        emit OwnerOfProduct(msg.sender);
    }


  }