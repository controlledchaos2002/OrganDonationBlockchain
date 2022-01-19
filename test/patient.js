const Patient = artifacts.require("Patient");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("Patient", function (/* accounts */) {
  it("should assert true if deployed", async function () {
    await Patient.deployed();
    return assert.isTrue(true);
  });
});
