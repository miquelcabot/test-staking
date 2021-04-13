// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.8.0;

import "./ZCX.sol";

contract TokenFarm {
    string public name = "Token Farm";
    ZCX public zcx;

    address[] public stakers;
    mapping(address => uint) public stakingBalance;
    mapping(address => bool) public hasStaked;
    mapping(address => bool) public isStaking;

    constructor (ZCX _zcx) public {
      zcx = _zcx;
    }

    /**
      Stakes ZCX
     */
    function stakeTokens(uint _amount) public {
      //Transfer ZCX tokens to this contract for staking
      zcx.transferFrom(msg.sender, address(this), _amount);
      // Update staking balance
      stakingBalance[msg.sender] = stakingBalance[msg.sender] + _amount;
      // Add user to stakers array *only* if they haven't staked already
      if (!hasStaked[msg.sender]) {
        stakers.push(msg.sender);
      }
      // Update staking status
      hasStaked[msg.sender] = true;
      isStaking[msg.sender] = true;
    }
}
