// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AggregatorV3LightInterface} from './interfaces/AggregatorV3LightInterface.sol';

interface Proxy {
	function getCurrentNav() external view returns (uint256 _baseNav, uint256 _fNav, uint256 _xNav);
}

contract XETHUSDPriceAdapter is AggregatorV3LightInterface {
	Proxy public immutable proxy;

	constructor(address _proxy) {
		proxy = Proxy(_proxy);
	}

	function decimals() external pure override returns (uint8) {
		return 18;
	}

	function description() external pure override returns (string memory) {
		return 'xETH/USD price oracle';
	}

	function latestRoundData()
		external
		view
		override
		returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound)
	{
		(, uint256 price, ) = proxy.getCurrentNav();
		return (0, int256(price), 0, 0, 0);
	}
}
