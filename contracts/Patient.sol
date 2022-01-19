// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "./Admin.sol";

contract Patient {
    constructor() {}

    /// Patient Record in the blockchain
    mapping(address => Patients) public allPatients;

    /// flag store for patients who have given consent for transplants
    mapping(address => mapping(address => bool)) consentsGiven;

    /// list of patients who have given consent for transplants
    mapping(address => address) validPatients;

    struct Patients {
        string name;
        string permanentAddress;
        string temporaryAddress;
        string phoneNumber;
        string age;
        string sex;
        string bloodGroup;
        address createdBy;
    }

    /// Stores the patients in the blockchain
    /// @dev both patient address and the creator of record is stored
    /// @param _permAddr permanent address of the patient
    /// @param _tempAddr temporary address of the  patient
    /// @param _phoneNo phone number of the patient
    /// @param _age age of the patient
    /// @param _sex gender of the patient
    /// @param _bloodGroup blood group of the patient
    /// @param _patientWalletAddr wallet address of the patient
    /// @param _createdBy Doctor/Individual who is creating the record
    function createPatient(
        string memory _name,
        string memory _permAddr,
        string memory _tempAddr,
        string memory _phoneNo,
        string memory _age,
        string memory _sex,
        string memory _bloodGroup,
        address _patientWalletAddr,
        address _createdBy
    ) public {
        allPatients[_patientWalletAddr] = Patients(
            _name,
            _permAddr,
            _tempAddr,
            _phoneNo,
            _age,
            _sex,
            _bloodGroup,
            _createdBy
        );
    }

    /// Patients provide consent to accept transplant from any specific donor
    /// @dev after consent add them to the list of validPatients
    /// @param _patientAddress wallet address of the patient
    /// @param _donorAddress wallet address of the donor
    function provideConsentForTransplant(
        address _patientAddress,
        address _donorAddress
    ) public {
        consentsGiven[_patientAddress][_donorAddress] = true;
        validPatients[_patientAddress] = _donorAddress;
    }

}
