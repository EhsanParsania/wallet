// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ERC20Token{
    string name ; 
    mapping(address=>uint256) public balances;
    constructor(string memory _name){
        name = _name;
    }

    function mint(uint256 _amount) public {
        balances[tx.origin] += _amount;
    }
}