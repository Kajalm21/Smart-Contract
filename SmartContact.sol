// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FractionOperations {
    uint256 public numerator;
    uint256 public denominator;

    // Set the numerator value
    function setNumerator(uint256 _numerator) public {
        numerator = _numerator;
    }

    // Set the denominator value
    function setDenominator(uint256 _denominator) public {
        require(_denominator != 0, "Denominator cannot be zero");
        denominator = _denominator;
    }

    // Divide numerator by denominator
    function divide() public view returns (uint256) {
        require(denominator != 0, "Cannot divide by zero");

        uint256 result = numerator / denominator;
        
        // Assert to ensure result is consistent with the expected value
        assert(result * denominator + numerator % denominator == numerator);

        return result;
    }

    // Multiply numerator and denominator
    function multiply(uint256 factor) public view returns (uint256) {
        uint256 result = numerator * factor;
        
        // Assert to ensure result is consistent with multiplication properties
        assert(result / factor == numerator);

        return result;
    }

    // Reset the fraction to initial values
    function reset() public {
        numerator = 0;
        denominator = 1;
        
        // Ensure the reset has been successful
        assert(numerator == 0 && denominator == 1);
    }

    // Function to simulate an error and demonstrate revert
    function triggerRevert() public pure {
        revert("This function always reverts");
    }
}
