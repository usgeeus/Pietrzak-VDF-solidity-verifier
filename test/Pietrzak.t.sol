// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "./shared/BaseTest.t.sol";
import {Vm} from "forge-std/Test.sol";
import "../src/MinimalPietrzak.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import "../src/libraries/BigNumbers.sol";
import {DecodeJsonBigNumber} from "./shared/DecodeJsonBigNumber.sol";

contract MinimalPietrzakTestDeltaChart2048 is BaseTest, DecodeJsonBigNumber {
    IMinimalPietrzak public minimalPietrzak;

    function setUp() public override {
        BaseTest.setUp();
        minimalPietrzak = IMinimalPietrzak(address(new MinimalPietrzak()));
    }

    uint256 constant DELTA2048 = 16;

    function testPietrzakDeltaChart2048() public {
        BigNumber[] memory v;
        BigNumber memory x;
        BigNumber memory y;
        BigNumber memory n;
        uint256 T;
        uint256 numOfEachTestCase = 5;
        uint256[6] memory taus = [uint256(20), 21, 22, 23, 24, 25];
        uint256 bit = 2048;
        string memory output;
        for (uint256 j = 0; j < taus.length; j++) {
            for (uint256 delta; delta < DELTA2048; delta++) {
                uint256[] memory gasUseds = new uint256[](numOfEachTestCase);
                for (uint256 k = 1; k <= numOfEachTestCase; k++) {
                    (v, x, y, n, T) = returnParsed(bit, k, taus[j], delta);
                    bool result = minimalPietrzak.verifyPietrzak(
                        v,
                        x,
                        y,
                        n,
                        delta,
                        T
                    );
                    gasUseds[k - 1] = vm.lastCallGas().gasTotalUsed;
                    assertTrue(result);
                }
                vm.serializeUint("object", "delta", delta);
                vm.serializeUint("object", "tau", taus[j]);
                string memory resultJson = vm.serializeUint(
                    "object",
                    "gasUseds",
                    gasUseds
                );
                string memory key = delta < 10
                    ? string.concat(
                        "0",
                        Strings.toString(delta),
                        "delta_",
                        Strings.toString(taus[j]),
                        "tau"
                    )
                    : string.concat(
                        Strings.toString(delta),
                        "delta_",
                        Strings.toString(taus[j]),
                        "tau"
                    );
                output = vm.serializeString("deltaAndTau", key, resultJson);
            }
        }
        vm.writeJson(output, "PietrzakDeltaChart2048.json");
    }
}

contract MinimalPietrzakTestDeltaChart30721 is BaseTest, DecodeJsonBigNumber {
    IMinimalPietrzak public minimalPietrzak;

    function setUp() public override {
        BaseTest.setUp();
        minimalPietrzak = IMinimalPietrzak(address(new MinimalPietrzak()));
    }

    function testPietrzakDeltaChart3072() public {
        BigNumber[] memory v;
        BigNumber memory x;
        BigNumber memory y;
        BigNumber memory n;
        uint256 T;
        uint256 numOfEachTestCase = 5;
        uint256[6] memory taus = [uint256(20), 21, 22, 23, 24, 25];
        uint256 bit = 3072;
        string memory output;
        for (uint256 j = 0; j < taus.length; j++) {
            for (uint256 delta; delta < 11; delta++) {
                uint256[] memory gasUseds = new uint256[](numOfEachTestCase);
                for (uint256 k = 1; k <= numOfEachTestCase; k++) {
                    (v, x, y, n, T) = returnParsed(bit, k, taus[j], delta);
                    bool result = minimalPietrzak.verifyPietrzak(
                        v,
                        x,
                        y,
                        n,
                        delta,
                        T
                    );
                    gasUseds[k - 1] = vm.lastCallGas().gasTotalUsed;
                    assertTrue(result);
                }
                vm.serializeUint("object", "delta", delta);
                vm.serializeUint("object", "tau", taus[j]);
                string memory resultJson = vm.serializeUint(
                    "object",
                    "gasUseds",
                    gasUseds
                );
                string memory key = delta < 10
                    ? string.concat(
                        "0",
                        Strings.toString(delta),
                        "delta_",
                        Strings.toString(taus[j]),
                        "tau"
                    )
                    : string.concat(
                        Strings.toString(delta),
                        "delta_",
                        Strings.toString(taus[j]),
                        "tau"
                    );
                output = vm.serializeString("deltaAndTau", key, resultJson);
            }
        }
        vm.writeJson(output, "PietrzakDeltaChart3072-1.json");
    }
}

contract MinimalPietrzakTestDeltaChart30722 is BaseTest, DecodeJsonBigNumber {
    IMinimalPietrzak public minimalPietrzak;

    function setUp() public override {
        BaseTest.setUp();
        minimalPietrzak = IMinimalPietrzak(address(new MinimalPietrzak()));
    }

    uint256 constant DELTA3072 = 16;

    function testPietrzakDeltaChart3072() public {
        BigNumber[] memory v;
        BigNumber memory x;
        BigNumber memory y;
        BigNumber memory n;
        uint256 T;
        uint256 numOfEachTestCase = 5;
        uint256[6] memory taus = [uint256(20), 21, 22, 23, 24, 25];
        uint256 bit = 3072;
        string memory output;
        for (uint256 j = 0; j < taus.length; j++) {
            for (uint256 delta = 11; delta < DELTA3072; delta++) {
                uint256[] memory gasUseds = new uint256[](numOfEachTestCase);
                for (uint256 k = 1; k <= numOfEachTestCase; k++) {
                    (v, x, y, n, T) = returnParsed(bit, k, taus[j], delta);
                    bool result = minimalPietrzak.verifyPietrzak(
                        v,
                        x,
                        y,
                        n,
                        delta,
                        T
                    );
                    gasUseds[k - 1] = vm.lastCallGas().gasTotalUsed;
                    assertTrue(result);
                }
                vm.serializeUint("object", "delta", delta);
                vm.serializeUint("object", "tau", taus[j]);
                string memory resultJson = vm.serializeUint(
                    "object",
                    "gasUseds",
                    gasUseds
                );
                string memory key = delta < 10
                    ? string.concat(
                        "0",
                        Strings.toString(delta),
                        "delta_",
                        Strings.toString(taus[j]),
                        "tau"
                    )
                    : string.concat(
                        Strings.toString(delta),
                        "delta_",
                        Strings.toString(taus[j]),
                        "tau"
                    );
                output = vm.serializeString("deltaAndTau", key, resultJson);
            }
        }
        vm.writeJson(output, "PietrzakDeltaChart3072-2.json");
    }
}

contract MinimalPietrzakProofLength_CalldataLength_IntrinsicGas_FucDispatchGas is
    BaseTest,
    DecodeJsonBigNumber
{
    IMinimalPietrzak minimalPietrzak;

    function setUp() public override {
        BaseTest.setUp();
        minimalPietrzak = IMinimalPietrzak(address(new MinimalPietrzak()));
    }

    function getIntrinsicGas(bytes memory _data) public pure returns (uint256) {
        uint256 total = 21000; //txBase
        for (uint256 i = 0; i < _data.length; i++) {
            if (_data[i] == 0) {
                total += 4;
            } else {
                total += 16;
            }
        }
        return total;
    }

    function getAverage(uint256[] memory array) private pure returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < array.length; i++) {
            sum += array[i];
        }
        return sum / array.length;
    }

    function testCalldataCost() public {
        BigNumber[] memory v;
        BigNumber memory x;
        BigNumber memory y;
        BigNumber memory n;
        uint256 T;
        uint256 numOfEachTestCase = 5;
        uint256 tau = 25;
        uint256[2] memory bits = [uint256(2048), 3072];
        Calldata calldataContract = new Calldata();
        string memory output;
        for (uint256 bitIndex = 0; bitIndex < bits.length; bitIndex++) {
            for (uint256 delta = 0; delta < 26; delta++) {
                uint256[] memory intrinsicGass = new uint256[](
                    numOfEachTestCase
                );
                uint256[] memory calldataLengths = new uint256[](
                    numOfEachTestCase
                );
                uint256[] memory gasOfFuncDispatchs = new uint256[](
                    numOfEachTestCase
                );
                for (uint256 k = 1; k <= numOfEachTestCase; k++) {
                    (v, x, y, n, T) = returnParsed(
                        bits[bitIndex],
                        k,
                        tau,
                        delta
                    );
                    bytes memory calldataBytes = abi.encodeWithSelector(
                        minimalPietrzak.verifyPietrzak.selector,
                        v,
                        x,
                        y,
                        n,
                        delta,
                        T
                    );
                    calldataLengths[k - 1] = calldataBytes.length;
                    intrinsicGass[k - 1] = getIntrinsicGas(calldataBytes);
                    calldataContract.verify(v, x, y, n, delta, T);
                    gasOfFuncDispatchs[k - 1] =
                        vm.lastCallGas().gasTotalUsed -
                        intrinsicGass[k - 1];
                }
                uint256 proofLength = tau - delta;
                string memory object = "object";
                vm.serializeUint(object, "bits", bits[bitIndex]);
                vm.serializeUint(object, "proofLength", proofLength);
                vm.serializeUint(object, "calldataLength", calldataLengths);
                vm.serializeUint(object, "intrinsicGas", intrinsicGass);
                string memory result = vm.serializeUint(
                    object,
                    "gasOfFuncDispatch",
                    gasOfFuncDispatchs
                );
                string memory key = proofLength < 10
                    ? string.concat(
                        "0",
                        Strings.toString(proofLength),
                        "proofLength"
                    )
                    : string.concat(
                        Strings.toString(proofLength),
                        "proofLength"
                    );
                output = vm.serializeString(
                    "bits",
                    string.concat(Strings.toString(bits[bitIndex]), "bits"),
                    vm.serializeString("proofLength", key, result)
                );
            }
        }
        vm.writeJson(
            output,
            "PietrzakCalldataLength_IntrinsicGas_FuncDispatchGas.json"
        );
    }
}

contract MinimalPietrzakHalving_ModExp_TotalGasUsed is
    BaseTest,
    DecodeJsonBigNumber
{
    IMinimalPietrzak minimalPietrzak;

    function setUp() public override {
        BaseTest.setUp();
        minimalPietrzak = IMinimalPietrzak(address(new MinimalPietrzak()));
    }

    function getIntrinsicGas(bytes memory _data) public pure returns (uint256) {
        uint256 total = 21000; //txBase
        for (uint256 i = 0; i < _data.length; i++) {
            if (_data[i] == 0) {
                total += 4;
            } else {
                total += 16;
            }
        }
        return total;
    }

    function getAverage(uint256[] memory array) private pure returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < array.length; i++) {
            sum += array[i];
        }
        return sum / array.length;
    }

    function testHalvingModExpTotal() public {
        BigNumber[] memory v;
        BigNumber memory x;
        BigNumber memory y;
        BigNumber memory n;
        uint256 T;
        uint256 maxDelta = 20;
        uint256[2] memory bits = [uint256(2048), 3072];
        uint256 numOfEachTestCase = 5;
        MinimalPietrzakHalvingReturnGas halvingReturnGasContract = new MinimalPietrzakHalvingReturnGas();
        MinimalPietrzakModExpReturnGas modExpReturnGasContract = new MinimalPietrzakModExpReturnGas();
        string memory output;
        for (uint256 bitIndex = 0; bitIndex < bits.length; bitIndex++) {
            for (uint256 delta = 0; delta < maxDelta; delta++) {
                uint256[] memory totalGasUseds = new uint256[](
                    numOfEachTestCase
                );
                uint256[] memory halvingGasUseds = new uint256[](
                    numOfEachTestCase
                );
                uint256[] memory modExpGasUseds = new uint256[](
                    numOfEachTestCase
                );
                for (uint256 k = 1; k <= numOfEachTestCase; k++) {
                    (v, x, y, n, T) = returnParsed(
                        bits[bitIndex],
                        k,
                        25,
                        delta
                    );
                    minimalPietrzak.verifyPietrzak(v, x, y, n, delta, T);
                    totalGasUseds[k - 1] = vm.lastCallGas().gasTotalUsed;
                    halvingGasUseds[k - 1] = halvingReturnGasContract
                        .verifyPietrzak(v, x, y, n, delta, T);
                    modExpGasUseds[k - 1] = modExpReturnGasContract
                        .verifyPietrzak(v, x, y, n, delta, T);
                }
                string memory object = "object";
                uint256 proofLength = 25 - delta;
                vm.serializeUint(object, "delta", delta);
                vm.serializeUint(object, "proofLength", proofLength);
                vm.serializeUint(object, "bits", bits[bitIndex]);
                vm.serializeUint(object, "totalGasUsed", totalGasUseds);
                vm.serializeUint(object, "onlyHalvingGasUsed", halvingGasUseds);
                string memory result = vm.serializeUint(
                    object,
                    "onlyModExpGasUsed",
                    modExpGasUseds
                );
                string memory key = delta < 10
                    ? string.concat("0", Strings.toString(delta), "delta")
                    : string.concat(Strings.toString(delta), "delta");
                output = vm.serializeString(
                    "bits",
                    string.concat(Strings.toString(bits[bitIndex]), "bits"),
                    vm.serializeString("delta", key, result)
                );
            }
        }
        vm.writeJson(output, "Pietrzak_Halving_ModExp_TotalGasUsed.json");
    }
}
