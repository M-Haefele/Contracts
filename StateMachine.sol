pragma solidity ^0.5.1;

contract StateMachine{
    enum State {
        PENDING,
        ACTIVE,
        CLOSED,
    }
    
    State public state = State.PENDING;
    uint public amount;
    uint public interest;
    uint public end;
    address payable public borrower;
    address payable public lender;
    
    constructor(
        uint _amount,
        uint _interest,
        uint _duration,
        address payable _borrower,
        address payable _lender,
        ) public {
            amount = _amount;
            interest = _interest;
            end = now + _duration;
            borrower = _borrower;
            lender = _lender;
        }
        
    function fund() payable external{
        require(msg.sender == lender, 'Only lender can lend');
        require(address(this).balance == amount, 'Cannot lend the amoount');
        borrower.transfer(amount);
    }
    
    function reimburse() payable external
}