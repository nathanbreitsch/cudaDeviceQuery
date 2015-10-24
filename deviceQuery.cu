#include <stdio.h>


//cudaGetDeviceCount(addr): assigns count to addr, returns status value cudaSuccess, cudaErrorNoDevice, cudaErrorInsufficientDriver 
//cudaDeviceProp: struct for device props
//cudaGetDeviceProperties(addr, index): assigns device properties to addr, returns status value cudaSuccess, cudaErrorInvalidDevice



int main(){
	int device_count;
	cudaError device_count_status = cudaGetDeviceCount(&device_count);
	if(device_count_status == cudaErrorNoDevice){
		printf("No devices were found");
		return 0;
	}
	else if(device_count_status == cudaErrorInsufficientDriver){
		printf("Insufficient Driver");
		return 0;
	}
	cudaDeviceProp current_device_properties;
	for(int i = 0; i < device_count; ++i){
		cudaError current_device_status = cudaGetDeviceProperties(&current_device_properties, i);
		if(current_device_status == cudaErrorInvalidDevice){
			printf("Device number:%d is invalid", i);
		}
		else{
			printf("time to list the stuff");
		}
	}

	return 0;
}
