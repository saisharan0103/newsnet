// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./NewsToken.sol";

/// @title NewsDAO - manages story submissions, voting and rewards
contract NewsDAO is Ownable {
    struct Story {
        address submitter;
        string uri; // could point to IPFS or off-chain storage
        uint256 voteCount;
        bool exists;
    }

    NewsToken public immutable token;
    uint256 public rewardPerVote = 1 ether; // 1 NEWS per vote
    uint256 public nextStoryId;

    mapping(uint256 => Story) public stories;
    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event StorySubmitted(uint256 indexed id, address indexed submitter, string uri);
    event Voted(uint256 indexed id, address indexed voter, uint256 weight);

    constructor(address tokenAddress) {
        token = NewsToken(tokenAddress);
    }

    /// @notice Submit a new story URI
    function submitStory(string calldata uri) external {
        uint256 id = nextStoryId++;
        stories[id] = Story({submitter: msg.sender, uri: uri, voteCount: 0, exists: true});
        emit StorySubmitted(id, msg.sender, uri);
    }

    /// @notice Vote for a story. Each address can vote once per story
    function vote(uint256 storyId) external {
        Story storage story = stories[storyId];
        require(story.exists, "Story does not exist");
        require(!hasVoted[storyId][msg.sender], "Already voted");
        hasVoted[storyId][msg.sender] = true;
        story.voteCount += 1;

        // reward voter and submitter
        token.mint(msg.sender, rewardPerVote);
        token.mint(story.submitter, rewardPerVote);

        emit Voted(storyId, msg.sender, rewardPerVote);
    }

    /// @notice Owner can update reward amount
    function setRewardPerVote(uint256 amount) external onlyOwner {
        rewardPerVote = amount;
    }
}
