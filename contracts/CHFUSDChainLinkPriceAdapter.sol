// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AggregatorV3LightInterface} from './interfaces/AggregatorV3LightInterface.sol';

interface EACAggregatorProxy {
	function decimals() external view returns (uint8);

	function latestRoundData()
		external
		view
		returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);
}

contract CHFUSDChainLinkPriceAdapter is AggregatorV3LightInterface {
	EACAggregatorProxy public immutable proxy;

	constructor(address _proxy) {
		proxy = EACAggregatorProxy(_proxy);
	}

	function decimals() external view override returns (uint8) {
		return proxy.decimals();
	}

	function description() external pure override returns (string memory) {
		return 'CHF/USD EACAggregatorProxy price oracle';
	}

	function latestRoundData()
		external
		view
		override
		returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound)
	{
		(roundId, answer, startedAt, updatedAt, answeredInRound) = proxy.latestRoundData();
		answer = int256(10 ** (2 * proxy.decimals()) / uint256(answer));
	}
}
