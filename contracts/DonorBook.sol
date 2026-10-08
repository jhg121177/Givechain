pragma solidity ^0.8.0;

contract DonorBook {
    mapping(address => uint256) public donations;
    uint256 public totalDonated;

    function donate() public payable {
        require(msg.value > 0, "zero donation");

        donations[msg.sender] += msg.value;
        totalDonated += msg.value;
    }

    function refund(uint256 amount) public {
        require(
            amount <= donations[msg.sender],
            "exceeds donation"
        );

        donations[msg.sender] -= amount;
        totalDonated -= amount;

        (bool ok, ) = payable(msg.sender).call{value: amount}("");
        require(ok, "refund failed");
    }
}