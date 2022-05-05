/* SPDX-License-Identifier: MIT OR Apache-2.0 */

pragma solidity ^0.8.0;

import "./Ownable.sol";

contract Wallet is Ownable  {
  
    uint256 internal savedAmount = 0;

    //write method
    function addCoin(uint256 _amount) external  returns(uint256  , uint256 ) {
       savedAmount += _amount ;
       return ( _amount ,  savedAmount);
    }

    //read method
    function getCoinAmount() external view returns(uint256 ){
     return savedAmount;
    }
}
