// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./shared/BaseTest.t.sol";
import {console2} from "forge-std/Test.sol";
import {PrimeNumbers} from "./shared/PrimeNumbers.sol";
import {BailliePSW, MillerRabin} from "../src/PrimeTest.sol";

contract PrimeTest is BaseTest, PrimeNumbers {
    MillerRabin public millerRabin;
    BailliePSW public bailliePSW;

    function setUp() public override {
        BaseTest.setUp();
        millerRabin = new MillerRabin();
        bailliePSW = new BailliePSW();
    }

    function testMillerRabin() public view {
        for (uint256 i = 0; i < fixturePrimeNumber.length; i++) {
            bool isPrimeNumber = millerRabin.millerRabinTest(
                fixturePrimeNumber[i]
            );
            if (!isPrimeNumber) {
                console2.log("miller rabin failed", fixturePrimeNumber[i]);
            }
            assertTrue(isPrimeNumber, "Should be a prime number");
        }
    }

    function testBailliePSW() public view {
        for (uint256 i = 0; i < fixturePrimeNumber.length; i++) {
            bool isPrimeNumber = bailliePSW.bailliePSW(fixturePrimeNumber[i]);
            if (!isPrimeNumber) {
                console2.log("miller rabin failed", fixturePrimeNumber[i]);
            }
            assertTrue(isPrimeNumber, "Should be a prime number");
        }
    }
}
