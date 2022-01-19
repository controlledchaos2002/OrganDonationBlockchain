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

  it("Verify Patient is registered correctly", async () => {
    let patientCOntract = await Patient.new();
    await patientCOntract.createPatient("Aaron Hill",
      "123, Shivajinagar, Bangalore",
      "505, Marathalli, Bangalore-560037",
      "1234567890",
      "35",
      "Female",
      "B+",
      "0x88225002F254d354EF28b69E14944829467cF407",
      "0xC5Daf75e7EFfE44c5ADde3e08918a19cb4BAEe73");

    let patient1 = await patientCOntract.allPatients("0x88225002F254d354EF28b69E14944829467cF407");
    let name = patient1.name.toString();
    let tempAddress = patient1.temporaryAddress.toString();
    let permAddress = patient1.permanentAddress.toString();
    let phoneNo = patient1.phoneNumber.toString();
    let age = patient1.age.toString();
    let sex = patient1.sex.toString();
    let bloodGroup = patient1.bloodGroup.toString();
    let createdBy = patient1.createdBy.toString();

    return (
      assert.equal(name, "Aaron Hill") &&
      assert.equal(tempAddress, "505, Marathalli, Bangalore-560037") &&
      assert.equal(permAddress, "123, Shivajinagar, Bangalore") &&
      assert.equal(phoneNo, "1234567890") &&
      assert.equal(age, "35") &&
      assert.equal(sex, "Female") &&
      assert.equal(bloodGroup, "B+") &&
      assert.equal(
        createdBy,
        "0xC5Daf75e7EFfE44c5ADde3e08918a19cb4BAEe73"
      )
    );
  });
});
