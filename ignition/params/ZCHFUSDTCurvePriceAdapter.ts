import { Address } from 'viem';

export type DeploymentParams = {
	pool: Address;
};

export const params: DeploymentParams = {
	pool: '0x6031bDd613E6A2F587b244e078053Fe7BbaBE3B5',
};

export type ConstructorArgs = [Address];

export const args: ConstructorArgs = [params.pool];
