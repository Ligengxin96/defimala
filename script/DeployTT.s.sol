// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {TTToken} from "../src/TT.sol";

contract TTTokenScript is Script {
    TTToken public ttToken;

    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        ttToken = new TTToken();

        vm.stopBroadcast();
    }
}
