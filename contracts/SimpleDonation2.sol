pragma solidity ^0.8.0;

contract SimpleDonation {
    address payable public beneficiary;
    mapping(address => uint256) public donations;

    constructor(address payable _beneficiary) {
        require(_beneficiary != address(0), "invalid beneficiary");
        beneficiary = _beneficiary;
    }

    function donate() public payable {
        require(msg.value > 0, "zero donation");
        donations[msg.sender] += msg.value;
    }

    function withdraw() public {
        require(msg.sender == beneficiary, "not beneficiary");

        uint256 balance = address(this).balance;
        require(balance > 0, "no balance");

        (bool ok, ) = beneficiary.call{value: balance}("");
        require(ok, "transfer failed");
    }
}