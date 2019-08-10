pragma solidity ^0.5.1;

//faucet contract

contract Faucet{
	
	function withdraw(uint withdraw_amount) public{

		require(withdraw_amount <= 100000000000000);

		msg.sender.transfer(withdraw_amount);
	}


	function () public payable()
}