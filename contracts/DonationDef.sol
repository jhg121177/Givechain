pragma solidity ^0.8.0;

contract DonationDef {
    struct Donation {
        address donor;
        uint256 amount;
        uint64 timestamp;
        uint256 campaignId;
    }

    Donation public latest;

    function setLatest() public {
        latest = Donation(
            msg.sender,
            1 ether,
            0,
            7
        );
    }
}