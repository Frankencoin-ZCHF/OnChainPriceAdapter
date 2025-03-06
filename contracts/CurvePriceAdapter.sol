// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IMinimalAggregatorV3Interface} from './interfaces/IMinimalAggregatorV3Interface.sol';
import {AggregatorV3Interface} from './interfaces/AggregatorV3Interface.sol';

interface ICurvePool {
	function price_oracle() external view returns (uint256);
}

contract ZCHFUSDTCurvePriceAdapter is IMinimalAggregatorV3Interface {
	ICurvePool public immutable curvePool;

	constructor(address _curvePool) {
		curvePool = ICurvePool(_curvePool);
	}

	function decimals() external pure override returns (uint8) {
		return 18;
	}

	function description() external pure override returns (string memory) {
		return 'zCHF/USDT exchange rate';
	}

	function latestRoundData()
		external
		view
		override
		returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound)
	{
		return (0, int256(curvePool.price_oracle()), 0, 0, 0);
	}
}
