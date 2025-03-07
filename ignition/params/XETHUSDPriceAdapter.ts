import { Address } from 'viem';

export type DeploymentParams = {
	proxy: Address;
};

export const params: DeploymentParams = {
	proxy: '0x0e5CAA5c889Bdf053c9A76395f62267E653AFbb0',
};

export type ConstructorArgs = [Address];

export const args: ConstructorArgs = [params.proxy];
