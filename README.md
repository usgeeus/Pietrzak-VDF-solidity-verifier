# Pietrzak-VDF-solidity-verifier

## Directory Structure

<pre>
├── lib: Contains dependencies managed as Git submodules.
├── src: The main directory for contracts, including MinimalPietrzak.sol.
│   ├── libraries: libraries such as BigNumbers.sol and PietrzakLibrary.sol.
├── test: Includes Pietrzak.t.sol, for generating JSON files.
│   ├── shared: Contains test cases for the Pietrzak VDF and utility function contracts.
</pre>

## Requirements

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`
- [foundry](https://getfoundry.sh/)
  - You'll know you did it right if you can run `forge --version` and you see a response like `forge 0.2.0 (26a7559 2024-07-31T00:19:23.655582000Z)`

## Quickstart

```
git clone <repository-url>
cd Pietrzak-VDF-solidity-verifier
make install
forge build
```

## Test

```
make test
```

This test command generates the following JSON files:

- PietrzakDeltaChart2048.json
  - Contains the results of gasUsed measurements for 2048-bit data sizes. The `delta` parameter ranges from 0 to 15, with `tau` values between 20 and 25, across 5 different test cases for each case.
- PietrzakDeltaChart3072-1.json
  - Contains the results of gasUsed measurements for 3072-bit data sizes. The `delta` parameter ranges from 0 to 10, with `tau` values between 20 and 25, across 5 different test cases for each case.
- PietrzakDeltaChart3072-2.json
  - Contains the results of gasUsed measurements for 3072-bit data sizes. The `delta` parameter ranges from 11 to 15, with `tau` values between 20 and 25, across 5 different test cases for each case.
- PietrzakCalldataLength_IntrinsicGas_FuncDispatchGas.json
  - Contains the results of measuring the calldata length, intrinsic gas, and function dispatch gasUsed for 2048-bit and 3072-bit data sizes. The proof length varies from 0 to 25, across 5 different test cases.
- Pietrzak_Halving_ModExp_TotalGasUsed.json
  - Contains the results of gasUsed measurements for 2048-bit and 3072-bit data sizes. The `delta` parameter ranges from 0 to 19, with proof lengths varying from 6 to 25, across 5 different test cases. The measurements include the Halving part, ModExp part, and the total gasUsed.
