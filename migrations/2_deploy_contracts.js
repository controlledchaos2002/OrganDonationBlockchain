const Admin = artifacts.require("Admin");
const Doctor = artifacts.require("Doctor");
const Donor = artifacts.require("Donor");
const Patient = artifacts.require("Patient");
const Permissions = artifacts.require("Permissions");
const Hospital = artifacts.require("Hospital");
const OrganBank = artifacts.require("OrganBank");

module.exports = function (deployer) {
  deployer.deploy(Admin);
  deployer.deploy(Donor);
  deployer.deploy(Doctor);
  deployer.deploy(Patient);
  deployer.deploy(Permissions);
  deployer.deploy(Hospital);
  deployer.deploy(OrganBank);
};
