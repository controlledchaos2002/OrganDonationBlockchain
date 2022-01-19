const Donor = artifacts.require("Donor");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("Donor", function (/* accounts */) {
  it("should assert true if deployed", async function () {
    await Donor.deployed();
    return assert.isTrue(true);
  });

  it("should check if donor is registered properly", async function () {
    let donorContract = await Donor.new();
    await donorContract.createDonor(
      "Aaron Hill",
      "505, Marathalli, Bangalore-560037",
      "123, Shivajinagar, Bangalore",
      "1234567890",
      "25",
      "Male",
      "B+",
      "Kidneys,Lungs,Pancreas",
      "0x88225002F254d354EF28b69E14944829467cF407",
      false
    );

    let donor1 = await donorContract.allDonors(
      "0x88225002F254d354EF28b69E14944829467cF407"
    );
    let name = donor1.name.toString();
    let tempAddress = donor1.tempAddress.toString();
    let permAddress = donor1.permAddress.toString();
    let phoneNo = donor1.phoneNo.toString();
    let age = donor1.age.toString();
    let sex = donor1.sex.toString();
    let bloodGroup = donor1.bloodGroup.toString();
    let donatingOrgans = donor1.donatingOrgans.toString();
    let donorAddress = donor1.donorAddress.toString();
    let isValidDonor = donor1.isValidDonor.toString();

    return (
      assert.equal(name, "Aaron Hill") &&
      assert.equal(tempAddress, "505, Marathalli, Bangalore-560037") &&
      assert.equal(permAddress, "123, Shivajinagar, Bangalore") &&
      assert.equal(phoneNo, "1234567890") &&
      assert.equal(age, "25") &&
      assert.equal(sex, "Male") &&
      assert.equal(bloodGroup, "B+") &&
      assert.equal(donatingOrgans, "Kidneys,Lungs,Pancreas") &&
      assert.equal(
        donorAddress,
        "0x88225002F254d354EF28b69E14944829467cF407"
      ) &&
      assert.isfalse(isValidDonor)
    );
  });

  it("Should return true if the donor exists", async function () {
    let donorContract = await Donor.new();
    await donorContract.createDonor(
      "Aaron Hill",
      "505, Marathalli, Bangalore-560037",
      "123, Shivajinagar, Bangalore",
      "1234567890",
      "25",
      "Male",
      "B+",
      "Kidneys,Lungs,Pancreas",
      "0x88225002F254d354EF28b69E14944829467cF407",
      false
    );

    let donorExists = await donorContract.existsDonor(
      "0x88225002F254d354EF28b69E14944829467cF407"
    );

    return assert.isTrue(donorExists);
  });

  it("Should return false if the donor doesn't exist", async function () {
    let donorContract = await Donor.new();
    await donorContract.createDonor(
      "Aaron Hill",
      "505, Marathalli, Bangalore-560037",
      "123, Shivajinagar, Bangalore",
      "1234567890",
      "25",
      "Male",
      "B+",
      "Kidneys,Lungs,Pancreas",
      "0x88225002F254d354EF28b69E14944829467cF407",
      false
    );

    let donorExists = await donorContract.existsDonor(
      "0xC5Daf75e7EFfE44c5ADde3e08918a19cb4BAEe73"
    );

    return assert.isFalse(donorExists);
  });
});
