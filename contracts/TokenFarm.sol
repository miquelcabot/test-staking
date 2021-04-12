// SPDX-License-Identifier: MIT

pragma solidity ^0.6.6;

import "./Token.sol";

contract TokenFarm {
    string public name = "Token Farm";
    Token public token;

    constructor (Token _token) public {
      token = _token;
    }
}
