pragma solidity ^0.5.1;

contract SplitPayment{
    address public owner;
    
    constructor(address _owner) public {
        owner = _owner;
    }
    
    function send(address payable[] memory to, uint[] memory amount)
        payable onlyOwner() public{
            require(to.length == amount.length, "to and amount array must have same length");
            for(uint i = 0; i < to.length; i++){
                to[i].transfer(amount[i]);
            }
            
        }
    
    modifier onlyOwner(){
        require(msg.sender == owner, "only owner can send transaction");
        _;
    }
    
}
