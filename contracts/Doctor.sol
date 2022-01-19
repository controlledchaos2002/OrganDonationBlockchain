// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "./Admin.sol";

contract Doctor {
    struct Doctors {
        string name;
        string registrationNumber;
    }

    /// Stores the count of doctors
    /// @dev will be used to loop through the AllDoctors

    uint256 public doctorsCount = 0;
    bool result;

    /// Stores all the doctors here in state variable

    mapping(address => Doctors) public AllDoctors;

    /// This will store dictionary of doctor to patient who has permission to view records
    /// @dev mapping of patient address to doc address

    mapping(address => mapping(address => bool)) public permittedDoctors;

    /// Stores the doctor record in the blockchain
    /// @dev wallet address of the doctor is required for the key in mapping
    /// @param _name name of the doctor record
    /// @param _regNum registration number of the doctor record
    /// @param _doc_addr wallet address of the doctor record
    /// @return _isCreated returns true if created
    function createDoctor(
        string memory _name,
        string memory _regNum,
        address _doc_addr
    ) public returns (bool _isCreated) {
        doctorsCount++;
        AllDoctors[_doc_addr] = Doctors(_name, _regNum);
        _isCreated = true;
    }

    /// Check if doctor exists in blockchain
    /// @dev if not present wallet address is address(0)
    /// @param id wallet address of the doctor
    /// @return _is_doctor return true if present
    function isDoctor(address id) public view returns (bool _is_doctor) {
        string memory temp = AllDoctors[id].registrationNumber;
        string memory blank = "";
        if (
            keccak256(abi.encodePacked((temp))) ==
            keccak256(abi.encodePacked((blank)))
        ) {
            _is_doctor = false;
        } else _is_doctor = true;
    }

    /// Function to check if doctor has permission to view record
    /// @dev using permittedDoctors mapping to verify
    /// @param _patientAddress wallet address of the patient
    /// @param _doctorAddress wallet address of the doctor
    /// @return _hasPermission boolean
    function hasPermissionToViewRecord(
        address _patientAddress,
        address _doctorAddress
    ) public view returns (bool _hasPermission) {
        _hasPermission = permittedDoctors[_patientAddress][_doctorAddress];
    }

    /// Patient gives permission to view the record to the doctor here
    /// @param _patientAddress wallet addr of the patient
    /// @param _doctorAddress wallet addr of the doctor
    function givepermissionToViewRecord(
        address _patientAddress,
        address _doctorAddress
    ) public {
        permittedDoctors[_patientAddress][_doctorAddress] = true;
    }
}
