# Smart-Contract
# FractionOperations Smart Contract

This Solidity smart contract enables basic fraction operations with robust error handling.

## Features

- **Set Numerator**: Set the numerator value.
- **Set Denominator**: Set the denominator with a check to ensure it's not zero.
- **Divide**: Safely divide the numerator by the denominator.
- **Multiply**: Multiply the numerator by a factor with correctness checks.
- **Reset**: Reset numerator and denominator to initial values.
- **Trigger Revert**: Simulate transaction revert with a custom error message.

## Usage

1. **Set Values**:
   - Use `setNumerator(uint256 _numerator)` and `setDenominator(uint256 _denominator)` to set values.

2. **Perform Operations**:
   - Call `divide()` and `multiply(uint256 factor)` for division and multiplication.
   
3. **Reset Values**:
   - Use `reset()` to reset values.

4. **Trigger Revert**:
   - Demonstrate revert behavior with `triggerRevert()`.
