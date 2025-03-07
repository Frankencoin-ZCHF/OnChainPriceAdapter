// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AggregatorV3LightInterface} from './interfaces/AggregatorV3LightInterface.sol';

interface Proxy {
	function nav() external view returns (uint256);
}

contract XCVXUSDPriceAdapter is AggregatorV3LightInterface {
	Proxy public immutable proxy;

	constructor(address _proxy) {
		proxy = Proxy(_proxy);
	}

	function decimals() external pure override returns (uint8) {
		return 18;
	}

	function description() external pure override returns (string memory) {
		return 'xCVX/USD price oracle';
	}

	function latestRoundData()
		external
		view
		override
		returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound)
	{
		return (0, int256(proxy.nav()), 0, 0, 0);
	}
}
