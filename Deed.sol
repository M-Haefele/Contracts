pragma solidity ^0.5.1;

contract Deed{
    address public lawyer;
    address payable public beneficiary;
    uint public earliest;
    
    constructor(
        address _lawyer,
        address payable _beneficiary,
        uint _amount,
        uint fromNow)
        payable public{
            require(_amount == msg.value);
            lawyer = _lawyer;
            beneficiary = _beneficiary;
            earliest = now +fromNow;
        }
        
    function withdraw() public {
    require(msg.sender == lawyer, 'lawyer only');
    require(now >= earliest, 'too early');
    beneficiary.transfer(address(this).balance);
        }
        
        
}