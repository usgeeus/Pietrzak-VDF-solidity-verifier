// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
import {BigNumber} from "../../src/libraries/BigNumbers.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import {Test} from "forge-std/Test.sol";

contract DecodeJsonBigNumber is Test {
    struct JsonBigNumber {
        uint256 bitlen;
        bytes val;
    }

    function decodeBigNumber(
        bytes memory jsonBytes
    ) public pure returns (BigNumber memory) {
        JsonBigNumber memory xJsonBigNumber = abi.decode(
            jsonBytes,
            (JsonBigNumber)
        );
        BigNumber memory x = BigNumber(
            xJsonBigNumber.val,
            xJsonBigNumber.bitlen
        );
        return x;
    }

    function returnParsed(
        uint256 bits,
        uint256 i,
        uint256 tau,
        uint256 delta
    )
        public
        view
        returns (
            BigNumber[] memory v,
            BigNumber memory x,
            BigNumber memory y,
            BigNumber memory n,
            uint256 T
        )
    {
        string memory root = vm.projectRoot();
        string memory path = string(
            abi.encodePacked(
                root,
                "/test/shared/pietrzakTestCases/",
                Strings.toString(bits),
                "/T",
                Strings.toString(tau),
                "/",
                Strings.toString(i),
                ".json"
            )
        );
        string memory json = vm.readFile(path);
        x = decodeBigNumber(vm.parseJson(json, ".recoveryProofs[0].x"));
        y = decodeBigNumber(vm.parseJson(json, ".recoveryProofs[0].y"));
        uint256 proofLength = tau - delta;
        v = new BigNumber[](proofLength);
        for (uint256 j; j < proofLength; j++) {
            v[j] = (
                decodeBigNumber(
                    vm.parseJson(
                        json,
                        string.concat(
                            ".recoveryProofs[",
                            Strings.toString(j),
                            "].v"
                        )
                    )
                )
            );
        }
        n = decodeBigNumber(vm.parseJson(json, ".n"));
        T = uint256(bytes32((vm.parseJson(json, ".T"))));
    }
}
