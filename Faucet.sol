pragma solidity ^0.5.1;

//faucet contract

contract Faucet{
	
	//basic faucet functionality

	function withdraw(uint withdraw_amount) public{
		//parameter to only allow within window of Ether denominations
		require(withdraw_amount <= 100000000000000);

		msg.sender.transfer(withdraw_amount);
	}

	//implement payable
	function () public payable()
}