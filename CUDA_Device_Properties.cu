// CUDA_Device_Properties.cpp : Definiert den Einstiegspunkt für die Konsolenanwendung.
/*
* Description:
*	Acquire info about CUDA devices on system.
*
*	Author:	P Stegmann
*	Date: 2014-10-22
*/
//

#include <stdio.h>
#include <iostream>
#include <cuda.h>
#include <cuda_runtime.h>
#include "device_launch_parameters.h"


int main()
{
	// Get number of devices
	int nDevices = 0;
	cudaError_t errorcode = cudaSuccess;
	errorcode = cudaGetDeviceCount(&nDevices);
	std::cout << "Anzahl der CUDA GPUs: " << nDevices << std::endl;
	std::cout << cudaGetErrorString(errorcode) << std::endl;
	// Loop over all devices
	
	for(int ii = 0; ii < nDevices; ii++)
	{	
		cudaDeviceProp prop;
		cudaGetDeviceProperties(&prop, ii);
		printf("Device number: %d\n", ii);
		printf(" Device name: %s\n", prop.name);
		printf(" Minor Compute capability: %d\n", prop.minor);
		printf(" Major compute capability: %d\n", prop.major);
		printf(" Memory Clock Rate (KHz): %d\n", prop.memoryBusWidth);
		printf(" Peak Memory Bandwidth (GB/s) : %f\n", 
			2.0*prop.memoryClockRate*(prop.memoryBusWidth/8)/1.0e6);
		printf(" Maximum threads per block: %d\n", prop.maxThreadsPerBlock);
		printf(" Size of a warp: %d\n", prop.warpSize);
		printf(" Available shared memory: %d\n", prop.sharedMemPerBlock);
		printf(" Maximum global memory: %d\n", prop.totalGlobalMem);
	}
	
	return 0;
}

