// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract gasChallenge {
    //Implement Fixed-Size Array Technique Here
    uint[10] numbers = [1,2,3,4,5,6,7,8,9,10]; // Setting the array as a fixed size(10) array
    
    //Function to check for sum of array
    //No changes required in this function
    function getSumOfArray() public view returns (uint256) {
        uint sum = 0;
        for (uint i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
        return sum;
    }
    
    function notOptimizedFunction() public {
        for (uint i = 0; i < numbers.length; i++) {
            numbers[i] = 0;
        }
    }
    
    //Implement Remaining Gas Optimization Techniques Here
    //Sum of elements in the numbers array should equal 0
    function optimizedFunction() public {
        // Cache the numbers array (Caching the state variable)
        uint[10] memory cacheNumbers = numbers; 

        // implementing the uncheck block
        unchecked {
            // Set the array elements to zero , used a different for loop syntax here
            // the condition 'i > 0' is cheaper compared to the condition 'i < cacheNumbers.length'

            for (uint i = cacheNumbers.length; i > 0; i--) {
                cacheNumbers[i-1] = 0;
            }
        }
        
        // Update the numbers array in storage using the cached numbers array in memory
        numbers = cacheNumbers; 
    }
}
