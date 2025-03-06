import { Address } from 'viem';

export type DeploymentParams = {
	proxy: Address;
};

export const params: DeploymentParams = {
	proxy: '0x449d117117838fFA61263B61dA6301AA2a88B13A',
};

export type ConstructorArgs = [Address];

export const args: ConstructorArgs = [params.proxy];
