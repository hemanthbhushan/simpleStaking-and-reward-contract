// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RewardToken is ERC20 {
    constructor() ERC20("RewardToken", "RT") {
        _mint(msg.sender, 1000000*10**18);
    }
    function mintToken(uint amount) public {
     _mint(msg.sender,amount);
    }
    function transfer(address to, uint256 amount) public override returns (bool success){
        _transfer(msg.sender, to, amount);
        return true;
        }
    function transferFrom(address from, address to, uint256 value) public override returns (bool success){
         _transfer(from, to, value);
         return true;
        }
    function approve(address spender, uint256 amount) public override returns (bool success){
        _approve(msg.sender, spender, amount);
        return true;
        }
    }