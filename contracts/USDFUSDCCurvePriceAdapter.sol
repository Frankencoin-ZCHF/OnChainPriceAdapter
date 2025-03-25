// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AggregatorV3LightInterface} from './interfaces/AggregatorV3LightInterface.sol';

interface ICurvePool {
	function price_oracle(uint256 i) external view returns (uint256);
}

contract USDFUSDCCurvePriceAdapter is AggregatorV3LightInterface {
	ICurvePool public immutable curvePool;

	constructor(address _curvePool) {
		curvePool = ICurvePool(_curvePool);
	}

	function decimals() external pure override returns (uint8) {
		return 18;
	}

	function description() external pure override returns (string memory) {
		return 'USDf/USDC curve pool price oracle';
	}

	function latestRoundData()
		external
		view
		override
		returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound)
	{
		return (0, int256(curvePool.price_oracle(0)), 0, 0, 0);
	}
}
