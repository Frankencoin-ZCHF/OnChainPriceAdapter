import { Address } from 'viem';

export type DeploymentParams = {
	proxy: Address;
};

export const params: DeploymentParams = {
	proxy: '0xB90D347e10a085B591955Cbd0603aC7866fCADC8',
};

export type ConstructorArgs = [Address];

export const args: ConstructorArgs = [params.proxy];
