pragma solidity ^0.5.1;

contract EtherWallet{
    address public owner;
    
    constructor(address _owner) public{
        owner = _owner;
    }
    function deposit() payable public{
        
    }
    
    function send(address payable to, uint amount) public{
        if(msg.sender == owner){
            to.transfer(amount);
            return;
        }
        revert("Sender is not allowed");
    }
    
    function balanceOf() view public returns(uint){
        return  address(this).balance;    
    }
    
    function validateAddress() view public returns(bool){
        if(msg.sender == owner){
            return true;
        }
        return false;
    }
    
}