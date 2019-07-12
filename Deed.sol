pragma solidity ^0.5.1;

contract Deed{
    address public lawyer;
    address payable public beneficiary;
    uint public earliest;
    uint public amount;
    uint constant public PAYOUT = 10;
    uint constant public INTERVAL = 10;
    uint public paidPayouts;

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
            amount = msg.value / PAYOUTS;
        }
        
    function withdraw() public {
        require(msg.sender == beneficiary, 'beneficiary only');
        require(now >= earliest, 'too early');
        require(paidPayouts < PAYOUTS);

        uint elligiblePayouts = (now - earliest) / INTERVAL;
        beneficiary.transfer(eligiblePayouts * amount);
    }
        
        
}