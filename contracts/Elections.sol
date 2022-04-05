// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

 contract Elections {

   address owner;
   uint id;
   uint totalVotes;

   constructor() {
       owner = msg.sender;
   }

   struct candidates {
       uint id;
       string name;
       uint votes;
   }  

   struct voters {
       bool alreadyVoted;
       bool allowedtoVote;
       uint choice;
   }

   mapping(uint => candidates) public Candidates;
   mapping(address => voters) public Voters;
   
   event AddCandidate(address indexed admin , string _name);
   event Allowed(address indexed admin , address _voter);
   event Voted(address indexed _voter,uint _choice);

   modifier isOwner(){
       require(msg.sender == owner , "You are not the owner");
       _;
   }

   function addCandidate(string memory _name) public isOwner {
       id++;
       Candidates[id] = candidates(id,_name,0);
       emit AddCandidate(msg.sender , _name);
   }

   function allowVoter(address _voter) public isOwner {
       Voters[_voter].allowedtoVote = true;
       emit Allowed(msg.sender , _voter);
   }

   function Vote(uint _choice) public {
       require(msg.sender != owner , "owner have not the right to vote");
       require(Voters[msg.sender].alreadyVoted == false , "You already voted");
       require(Voters[msg.sender].allowedtoVote == true , "You are not allowed to vote yet");
       Voters[msg.sender].choice = _choice;
       Voters[msg.sender].alreadyVoted=true;
       Candidates[_choice].votes ++;
       totalVotes++;
       emit Voted(msg.sender , _choice);
   }
 }