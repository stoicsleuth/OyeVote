pragma solidity ^0.4.18;


contract Voting {

	mapping (bytes32=>uint8) public voteReceived;
	bytes32[] public candidateList;

	function Voting(bytes32[] candidateNames) public {
		candidateList= candidateNames;
	}
	
	function totalvotesFor(bytes32 candidate) view public returns (uint8) {
		require (validCandidate(candidate));
		return voteReceived[candidate];
	}

	function voteforCandidate(bytes32 candidate) public {
		require (validCandidate(candidate));
		voteReceived[candidate]= voteReceived[candidate] +1;
	}

	function validCandidate(bytes32 candidate) view public returns (bool) {
    		for(uint i = 0; i < candidateList.length; i++) {
      			if (candidateList[i] == candidate) {
        		return true;
      			}
    		}	
    		return false;
   	}
}
