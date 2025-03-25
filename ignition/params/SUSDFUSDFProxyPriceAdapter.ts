import { Address } from 'viem';

export type DeploymentParams = {
	pool: Address;
};

export const params: DeploymentParams = {
	pool: '0xc8cf6d7991f15525488b2a83df53468d682ba4b0',
};

export type ConstructorArgs = [Address];

export const args: ConstructorArgs = [params.pool];
