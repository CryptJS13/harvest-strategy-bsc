//SPDX-License-Identifier: Unlicense

pragma solidity 0.6.12;

import "../../../base/venus-base/VenusWBNBFoldStrategyV2.sol";

contract VenusFoldStrategyV2Mainnet_WBNB is VenusWBNBFoldStrategyV2 {

  address public wbnb_unused; // just a differentiator for the bytecode

  constructor() public {}

  function initializeStrategy(
    address _storage,
    address _vault
  ) public initializer {
    address underlying = address(0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c);
    address venus = address(0xcF6BB5389c92Bdda8a3747Ddb454cB7a64626C63);
    address vbnb = address(0xA07c5b74C9B40447a954e1466938b865b6BBea36);
    address comptroller = address(0xfD36E2c2a6789Db23113685031d7F16329158384);
    VenusWBNBFoldStrategyV2.initializeStrategy(
      _storage,
      underlying,
      vbnb,
      _vault,
      comptroller,
      venus,
      580, //borrowTarget
      599, //collateralFactor
      1000, //Denominator
      true  //fold?
    );
    liquidationPath = [venus, underlying];
  }
}
