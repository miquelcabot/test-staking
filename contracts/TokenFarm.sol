// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.8.0;

import "./ZCX.sol";

contract TokenFarm {
    string public name = "Token Farm";
    ZCX public zcx;

    constructor (ZCX _zcx) public {
      zcx = _zcx;
    }
}
