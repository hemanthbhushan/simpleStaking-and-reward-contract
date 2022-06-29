// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract Staking1{
    address public owner;
    using SafeERC20  for  IERC20;
    IERC20 erc20Staking;
    IERC20 erc20reward;
    mapping(address =>uint) rewardOffered;
    mapping(address => uint)    stakedAmount;
    uint public balanceOfcontract;
    uint public  balanceOfStaked;
    uint public  balanceOfReward;
     uint public  balanceOfstaked1;
    uint public  balanceOfReward1;
   
    constructor(IERC20 staking,IERC20 reward){
        erc20Staking = staking;
        erc20reward = reward;
        owner = msg.sender;
        erc20reward.safeTransferFrom(owner,address(this),1000000000);
     }
     function balanceCheck(IERC20 token) private view returns(uint){
        return token.balanceOf(address(this));

     }

    function stakeToken(IERC20 token,uint amount) external{
        require(token == erc20Staking,"wrong ERC20 token");
        require(amount>0,"amount cant be less than zero");
         IERC20 reward = IERC20(erc20reward);
        token.safeTransferFrom(msg.sender,address(this),amount);

        
        

        balanceOfcontract += token.balanceOf(address(this));

      
        balanceOfReward = balanceCheck(reward);
        balanceOfStaked =  balanceCheck(token);
       
        
        stakedAmount[msg.sender] = amount;
        rewardOffered[msg.sender] = amount;
    } 
    function unStake(IERC20 token) external {
        require(token == erc20Staking,"wrong ERC20 token");
       IERC20 reward = IERC20(erc20reward);
       token.safeTransferFrom(address(this),msg.sender,stakedAmount[msg.sender]);
       reward.safeTransferFrom(address(this),msg.sender,stakedAmount[msg.sender]);
       balanceOfstaked1  = balanceCheck(token);
       balanceOfReward1 = balanceCheck(reward);

    }
    
}