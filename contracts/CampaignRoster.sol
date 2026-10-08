pragma solidity ^0.8.0;

contract CampaignRoster {
    uint256[] public campaignIds;

    function open(uint256 campaignId) public {
        campaignIds.push(campaignId);
    }

    function closeLast() public {
        require(campaignIds.length > 0, "empty");
        campaignIds.pop();
    }

    function swapRemove(uint256 index) public {
        require(index < campaignIds.length, "bad index");

        campaignIds[index] = campaignIds[campaignIds.length - 1];
        campaignIds.pop();
    }
}