// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;
import {Test} from "forge-std/Test.sol";
import {Core} from "../src/Core.sol";
import {DeployCore} from "../script/DeployCore.s.sol";

contract CoreTest is Test {
    address public USER = address(1);
    Core public core;

    function setUp() external {
        DeployCore deployer = new DeployCore();
        core = deployer.run();
        vm.deal(USER, 10 ether);
    }

    function testIsAdmin() public {
        bool ok = core.isAdmin(USER);
        assertEq(ok, false);
    }
}