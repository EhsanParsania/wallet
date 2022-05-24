// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ERC20Token{
    string name ; 
    mapping(address=>uint256) public balances;
    constructor(string memory _name){
        name = _name;
    }

    function mint() public {
        balances[msg.sender] ++ ;
    }
}