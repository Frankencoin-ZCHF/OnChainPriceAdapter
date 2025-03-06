// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Ownable} from '@openzeppelin/contracts/access/Ownable.sol';

interface ICurvePool {
	function get_dy(int128 i, int128 j, uint256 dx) external view returns (uint256);
}

interface IOracle {
	function getPrice() external view returns (uint256);
}

contract CurvePriceAdapter is IOracle, Ownable {
	ICurvePool public immutable curvePool;
	int128 public immutable tokenIndexA;
	int128 public immutable tokenIndexB;
	uint256 public immutable amountIn; // Amount of Token A used for price calculation

	constructor(address _curvePool, int128 _tokenIndexA, int128 _tokenIndexB, uint256 _amountIn) Ownable(msg.sender) {
		curvePool = ICurvePool(_curvePool);
		tokenIndexA = _tokenIndexA;
		tokenIndexB = _tokenIndexB;
		amountIn = _amountIn;
	}

	function getPrice() external view override returns (uint256) {
		return curvePool.get_dy(tokenIndexA, tokenIndexB, amountIn);
	}
}
