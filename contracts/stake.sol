// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Vesting is Ownable{

    constructor(address tokenAddr){
       //address _tokenAddr = tokenAddr;
    }
//user is the staker
    struct Stake{
        address user;
        uint256 amount;
        bool isActive;
        uint256 timestamp;
    }


//userStakes checks for active stakers
    mapping (address => Stake)userStakes;
//stakes keep track of the index for the staker in the stake array
    mapping (address => uint256) internal stakes;

//we store all userStakes performed in the contract here
    Stake[] public stakeHolders;


//staked event is triggered whenever a user stakes tokens, address is index
event Staked(address indexed user, uint256 amount, uint256 index, bool isActive, uint256 timestamp);

function _addStaker(address staker) public returns(uint256){
    //push an empty item to the array to make space for new stakeholders
    stakeHolders.push();
    //calc the index of the last item in the array by -1
    uint256 userIndex = stakeHolders.length - 1;
    //assign the addr to the new index
    stakeHolders[userIndex].user = staker;
    //add index to the stakeholders
    stakes[staker] = userIndex;
    return userIndex;

}


//stakeToken removes the amount staked from the stakers account and depositi in the contract
// function _stakeToken(uint256 _amount) public{
//     require(_amount > 0, "You have to stake a value greater than 0");
//     uint256 index = stakes[msg.sender];
//     uint timestamp = block.timestamp;
//     if (index == 0){
//         index = _addStaker(msg.sender);
//     }
//     stakeHolders[index].push(Stake(msg.sender,_amount,isActive, timestamp));
//     emit Staked(msg.sender, amount, index, isActive, timestamp);





// }

}