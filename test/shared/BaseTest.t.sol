// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {Test} from "forge-std/Test.sol";

contract BaseTest is Test {
    bool private s_baseTestInitialized;
    address internal constant OWNER =
        0xB68AA9E398c054da7EBAaA446292f611CA0CD52B;

    function setUp() public virtual {
        // BaseTest.setUp is often called multiple times from tests' setUp due to inheritance
        if (s_baseTestInitialized) return;
        s_baseTestInitialized = true;

        // Set msg.sender to OWNER until changePrank or stopPrank is called
        vm.startPrank(OWNER);
    }

    function getRandomAddresses(
        uint256 length
    ) internal pure returns (address[] memory) {
        address[] memory addresses = new address[](length);
        for (uint256 i = 0; i < length; ++i) {
            addresses[i] = address(
                uint160(uint256(keccak256(abi.encodePacked(i))))
            );
        }
        return addresses;
    }

    function addressIsIn(
        address addr,
        address[] memory addresses
    ) internal pure returns (bool) {
        for (uint256 i = 0; i < addresses.length; ++i) {
            if (addresses[i] == addr) {
                return true;
            }
        }
        return false;
    }
}
