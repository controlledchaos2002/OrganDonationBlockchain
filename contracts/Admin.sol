// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Admin {
    address public MAIN_ADMIN;
    address public HOSPITAL_ADMIN;
    address public NOTTO_ADMIN;

    constructor() {
        MAIN_ADMIN = 0xE27f249fA6B71C0A8CC90251b0445B30f86E50B0;
        HOSPITAL_ADMIN = 0xE27f249fA6B71C0A8CC90251b0445B30f86E50B0;
        NOTTO_ADMIN = 0xdFBDfA018e439621E8446a2aA8086be50c981dEB;
    }

    function set_admin(address _address) public {
        MAIN_ADMIN = _address;
    }

    function get_admin()
        public view
        returns (address _main_admin_address)
    {
        _main_admin_address = MAIN_ADMIN;
    }

    function set_hospital_admin(address _hospital_admin_addr) public{
      HOSPITAL_ADMIN = _hospital_admin_addr;
    }

    function get_hospital_admin()
        public view
        returns (address _hospital_admin_address)
    {
        _hospital_admin_address = MAIN_ADMIN;
    }

    function set_NOTTO_admin(address _NOTTO_admin_addr) public{
      NOTTO_ADMIN = _NOTTO_admin_addr;
    }

    function get_NOTTO_admin()
        public view
        returns (address _NOTTO_admin_address)
    {
        _NOTTO_admin_address = MAIN_ADMIN;
    } 
}
