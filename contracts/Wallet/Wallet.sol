/* SPDX-License-Identifier: MIT OR Apache-2.0 */

pragma solidity ^0.8.0;

contract Wallet {
    uint256 internal savedAmount = 0;
    address payable public ownerWallet;

    mapping(address => uint256) public EpTokenBalance;

    event Purchase(address _buyer, uint256 _value);

    constructor(address payable _ownerWallet) {
        ownerWallet = _ownerWallet;
    }

    //write method
    function addCoin(uint256 _amount) external returns (uint256, uint256) {
        savedAmount += _amount;
        return (_amount, savedAmount);
    }

    //write method
    function resetWallet() external onlyOwner {
        savedAmount = 0;
    }

    //read method
    function getCoinAmount() external view returns (uint256) {
        return savedAmount;
    }

    modifier onlyOwner() {
        require(msg.sender == ownerWallet);
        _;
    }

    function buyToken() public payable {
        EpTokenBalance[msg.sender] += (msg.value);
        ownerWallet.transfer(msg.value);
        emit Purchase(msg.sender, 1);
    }
}
