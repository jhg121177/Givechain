pragma solidity ^0.8.0;

contract CampaignRegistry {
    enum Category {
        EDU,
        HEALTH,
        ENV,
        ART
    }

    bytes32 public code;
    Category public category;
    uint256 public totalDonated;

    constructor(
        bytes32 campaignCode,
        Category categoryChoice
    ) {
        code = campaignCode;
        category = categoryChoice;
    }   

    function isHealth() public view returns (bool) {
        return category == Category.HEALTH;
    }
}