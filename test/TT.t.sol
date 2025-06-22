// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {TTToken} from "../src/TT.sol";

contract TTTokenTest is Test {
    TTToken public ttToken;

    function setUp() public {
        ttToken = new TTToken();
    }

    function test_InitialSupply() public {
        assertEq(ttToken.totalSupply(), 1_000_000 * 10 ** 6);
    }

    function test_Mint() public {
        address user1 = makeAddr("user1");
        ttToken.mint(user1, 100 * 10 ** 6);
        assertEq(ttToken.balanceOf(user1), 100 * 10 ** 6);
    }

    function test_Burn() public {
        address user2 = makeAddr("user2");
        ttToken.mint(user2, 100 * 10 ** 6);
        vm.prank(user2);
        ttToken.burn(50 * 10 ** 6);
        assertEq(ttToken.balanceOf(user2), 50 * 10 ** 6);
    }

    function test_Transfer() public {
        address user3 = makeAddr("user3");
        address user4 = makeAddr("user4");
        ttToken.mint(user3, 100 * 10 ** 6);

        vm.prank(user3);
        bool success = ttToken.transfer(user4, 50 * 10 ** 6);

        assertTrue(success);
        assertEq(ttToken.balanceOf(user3), 50 * 10 ** 6);
        assertEq(ttToken.balanceOf(user4), 50 * 10 ** 6);
    }
}
