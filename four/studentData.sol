// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData {
    
    struct Student {
        string name;
        uint256 rollNumber;
        uint256 age;
    }

    Student[] public students;

    event StudentAdded(string name, uint256 rollNumber, uint256 age);

    event FallbackCalled(address sender, uint256 value);

    function addStudent(string memory _name, uint256 _rollNumber, uint256 _age) public {
        students.push(Student(_name, _rollNumber, _age));
        emit StudentAdded(_name, _rollNumber, _age);
    }

    function getStudent(uint256 _index) public view returns (string memory, uint256, uint256) {
        require(_index < students.length, "Index out of bounds");
        Student memory student = students[_index];
        return (student.name, student.rollNumber, student.age);
    }

    fallback() external payable {
        emit FallbackCalled(msg.sender, msg.value); 
    }

    receive() external payable {
        emit FallbackCalled(msg.sender, msg.value); 
    }

    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
