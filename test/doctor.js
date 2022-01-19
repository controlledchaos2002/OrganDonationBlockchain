const Doctor = artifacts.require("Doctor");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("Doctor", function (/* accounts */) {
  
  it("should assert true if deployed", async function () {
    await Doctor.deployed();
    return assert.isTrue(true);
  });

  it("Verify name of the registered Doctor", async () => {
    let doctorContract = await Doctor.new();
    await doctorContract.createDoctor("Aamon Gill","1000000","0xC5Daf75e7EFfE44c5ADde3e08918a19cb4BAEe73");
    let doc1 = await doctorContract.AllDoctors("0xC5Daf75e7EFfE44c5ADde3e08918a19cb4BAEe73");
    let name = doc1.name.toString();
    return assert.equal(name, "Aamon Gill");
  });

  it("verify registrationNumber of the Doctor", async () => {
    let doctorContract = await Doctor.new();
    await doctorContract.createDoctor("Aamon Gill","1000001","0x88225002F254d354EF28b69E14944829467cF407");
    let doc1 = await doctorContract.AllDoctors("0x88225002F254d354EF28b69E14944829467cF407");
    let registrationNumber = doc1.registrationNumber.toString();
    return assert.equal(registrationNumber,"1000001");
  });

  it("Should return true if doctor exists", async () => {
    let doctorContract = await Doctor.new();
    await doctorContract.createDoctor("Aamon Gill","1000001","0x88225002F254d354EF28b69E14944829467cF407");
    let isDoctor = await doctorContract.isDoctor("0x88225002F254d354EF28b69E14944829467cF407");
    return assert.equal(isDoctor,true);
  });

  it("Should return false if doctor does not exist", async () => {
    let doctorContract = await Doctor.new();
    await doctorContract.createDoctor("Aamon Gill","1000001","0x88225002F254d354EF28b69E14944829467cF407");
    let isDoctor = await doctorContract.isDoctor("0xC5Daf75e7EFfE44c5ADde3e08918a19cb4BAEe73");
    return assert.isFalse(isDoctor);
  });

});
