import { Address } from 'viem';

export type DeploymentParams = {
	proxy: Address;
};

export const params: DeploymentParams = {
	proxy: '0x00e632728d5aB91fe8319760fFdD2D7362E28139',
};

export type ConstructorArgs = [Address];

export const args: ConstructorArgs = [params.proxy];
