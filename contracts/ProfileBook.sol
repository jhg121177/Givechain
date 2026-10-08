pragma solidity ^0.8.0;

contract ProfileBook {
    struct DonorProfile {
        string name;
        uint256 score;
    }

    mapping(address => DonorProfile) public profiles;

    function join(string calldata donorName) public {
        profiles[msg.sender] = DonorProfile(
            donorName,
            0
        );
    }

    function addScore(uint256 pointsToAdd) public {
        profiles[msg.sender].score += pointsToAdd;
    }
}