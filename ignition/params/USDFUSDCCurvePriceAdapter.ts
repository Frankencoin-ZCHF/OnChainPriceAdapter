import { Address } from 'viem';

export type DeploymentParams = {
	pool: Address;
};

export const params: DeploymentParams = {
	pool: '0x72310daaed61321b02b08a547150c07522c6a976',
};

export type ConstructorArgs = [Address];

export const args: ConstructorArgs = [params.pool];
