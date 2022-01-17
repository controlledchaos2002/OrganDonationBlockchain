// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract OrganBank {
  constructor() {
  }

  struct Transplant{
    string date;
    address donor;
    address patient;
    address hospital;
    string organName;
    address performedBy;
    bool statusCheck;
    string remarks; 
  }

  mapping(uint => Transplant) transplants;
  uint transplantCount = 0;

  function recordTransplant(string memory _date, address _donor,address _patient,address _hospital,
  string memory _organName,
  address _performedBy) public {
    transplantCount ++;
    transplants[transplantCount] = Transplant(_date,_donor,_patient,_hospital,_organName,_performedBy,false,"Tranplant Complete.");
  }

  function statusCheckOfTransplant(uint _id,bool _statusCheck, string memory _remarks) public {
    transplants[_id].statusCheck = _statusCheck;
    transplants[_id].remarks = _remarks;
  }
}
