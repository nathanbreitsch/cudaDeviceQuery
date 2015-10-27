#include <stdio.h>


//cudaGetDeviceCount(addr): assigns count to addr, returns status value cudaSuccess, cudaErrorNoDevice, cudaErrorInsufficientDriver 
//cudaDeviceProp: struct for device props
//cudaGetDeviceProperties(addr, index): assigns device properties to addr, returns status value cudaSuccess, cudaErrorInvalidDevice



int main(){
	int device_count;
	cudaError device_count_status = cudaGetDeviceCount(&device_count);
	if(device_count_status == cudaErrorNoDevice){
		printf("No devices were found \n");
		return 0;
	}
	else if(device_count_status == cudaErrorInsufficientDriver){
		printf("Insufficient Driver \n");
		return 0;
	}
	cudaDeviceProp current_device_properties;
	for(int i = 0; i < device_count; ++i){
		cudaError current_device_status = cudaGetDeviceProperties(&current_device_properties, i);
		if(current_device_status == cudaErrorInvalidDevice){
			printf("Device number:%d is invalid \n", i);
		}
		else{
			char* name = current_device_properties.name;
			int multiprocessor_count = current_device_properties.multiProcessorCount;
			size_t shared_mem_per_block = current_device_properties.sharedMemPerBlock;
			size_t total_global_memory = current_device_properties.totalGlobalMem;
			int max_threads_per_block = current_device_properties.maxThreadsPerBlock;
			int* block_dim_limits = current_device_properties.maxThreadsDim;
			int* grid_dim_limits = current_device_properties.maxGridSize;
			printf("Stats for device #%d:\n", i);
			printf("name: ");
			printf(name);
			printf("\n");
			printf("number of multiprocessors: %d\n", multiprocessor_count);
			printf("shared memery per block: %d\n", shared_mem_per_block);
			printf("total global memory: %d\n", total_global_memory);
			printf("max threads per block: %d\n", max_threads_per_block);
			printf("maximum block dimensions: %d X %d X %d\n", block_dim_limits[0], block_dim_limits[1], block_dim_limits[2]);
			printf("maximum grid dimensions: %d X %d X %d\n", grid_dim_limits[0], grid_dim_limits[1], grid_dim_limits[2]);
			
		}
	}

	return 0;
}
