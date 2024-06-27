// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Poll {
        string question;
        string[] options;
        mapping(uint256 => uint256) votes;
        bool exists;
    }

    mapping(uint256 => Poll) private polls;
    uint256 private pollCount;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Create a new poll
    function createPoll(string memory question, string[] memory options) public {
        require(msg.sender == owner, "Only the owner can create polls");
        require(options.length > 1, "Poll must have at least two options");

        Poll storage newPoll = polls[pollCount];
        newPoll.question = question;
        newPoll.options = options;
        newPoll.exists = true;

        pollCount++;
    }

    // Vote in a poll
    function vote(uint256 pollId, uint256 optionIndex) public {
        require(polls[pollId].exists, "Poll does not exist");
        require(optionIndex < polls[pollId].options.length, "Invalid option");

        Poll storage poll = polls[pollId];
        poll.votes[optionIndex]++;
    }

    // Get poll results
    function getResults(uint256 pollId) public view returns (string memory question, uint256[] memory results) {
        require(polls[pollId].exists, "Poll does not exist");

        Poll storage poll = polls[pollId];
        uint256[] memory resultsArray = new uint256[](poll.options.length);

        for (uint256 i = 0; i < poll.options.length; i++) {
            resultsArray[i] = poll.votes[i];
        }

        return (poll.question, resultsArray);
    }

    // Assert example function to check contract owner
    function checkOwner() public view {
        assert(msg.sender == owner);
    }

    // Revert example function to demonstrate revert statement
    function revertExample() public pure {
        revert("This function always reverts");
    }
}
