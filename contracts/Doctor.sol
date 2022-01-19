// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "./Admin.sol";

contract Doctor {
    // Doctors[] DoctorsList;
    // constructor() {
    // }

    // struct Doctors{
    //   string registrationNumber;
    //   string name;
    //   address _doctor_address;
    // }

    // function getAllDoctors() public view returns (Doctors[] memory _all_doctors){
    //   _all_doctors =  DoctorsList;
    // }

    // function registerDoctor(string memory _regNum, string memory _name, address _docAddr) public returns(bool _isRegistered){
    //   Admin _admin_contract;
    //   require(msg.sender == _admin_contract.MAIN_ADMIN());
    //   DoctorsList.push(Doctors(_regNum, _name, _docAddr));
    //   _isRegistered = true;
    // }

    // function isDoctor() public returns(bool){

    // }

    struct Doctors {
        string name;
        string registrationNumber;
    }

    uint256 public doctorsCount = 0;
    bool result;
    mapping(address => Doctors) public AllDoctors;
    mapping(address => mapping(address => bool)) public permittedDoctors;

    function createDoctor(
        string memory _name,
        string memory _regNum,
        address _doc_addr
    ) public returns (bool _isCreated) {
        doctorsCount++;
        AllDoctors[_doc_addr] = Doctors(_name, _regNum);
        _isCreated = true;
    }

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

    function hasPermissionToViewRecord(
        address _patientAddress,
        address _doctorAddress
    ) public view returns (bool _hasPermission) {
        _hasPermission = permittedDoctors[_patientAddress][_doctorAddress];
    }


    /** 
    TODO only the patient should be able to call this function
    */
    function givepermissionToViewRecord(address _patientAddress,
        address _doctorAddress
    ) public {
        permittedDoctors[_patientAddress][_doctorAddress] = true;
    }
}
