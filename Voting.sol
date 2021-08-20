pragma solidity >=0.4.22 <0.8.0;

contract Ballot{
    
    struct voter{
        uint8 id;
        string voter_name;
        uint256  adhar_num;
        bool voted;
    }
    
    struct Candidate {
        uint id;
        string name;
        string party;
        uint voteCount;
    }
    

    mapping(uint8=> bool) public voters;
    mapping(uint=> Candidate) public candidates;
    mapping(uint8=> voter) private Voterslist;
    // Store Candidates Count
    uint public candidatesCount;
    uint8 public voters_Count;
    uint private countResult=0;
    uint public finalResult=0;
    address public owner;//onlyonwer
    
    event votedEvent (uint indexed _candidateId);
	event voteStarted();
    event voteEnded(uint finalResult);
    event voterAdded(string voterName);
    
    enum State { Created, Voting, Ended }//start 
    
	State public state;
	
	
	modifier inState(State _state) {
		require(state == _state);
		_;
	}
	
	

	
constructor () public {
        owner=msg.sender;
        addCandidate("Moddi","Bharatiya Janata Party");
        addCandidate("Rahul","Indian National Congress");
        addCandidate("RAJINI","BABA");
        addCandidate("THALAPATHY","DMK");
        addCandidate("EPS","ADMK");
        addCandidate("NOTA","None of the above");
        addVoter("Jeeva",135412354);
        addVoter("arjun",546516564);
        addVoter("varman",616565165);
        
        state = State.Created;
        
        
    } 
    modifier onlyOfficial() {
		require(msg.sender ==owner);
		_;
	}
	
     //declare voting starts now
    function startVote() public {
        state = State.Voting;     
        emit voteStarted();
    }
    
    
    // why to add voter if i can vote it directly
    function addVoter(string memory _name,uint256 adhar_num) public  inState(State.Created) onlyOfficial { 
        voters_Count++;
        Voterslist[voters_Count]=voter(voters_Count,_name,adhar_num,true);
        emit voterAdded(_name);
    }
    
    function addCandidate (string memory name,string memory party) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, name,party, 0);
    }
    
    function vote (uint  _candidateId,uint adhar_num) public inState(State.Voting)  {   
        // require that they haven't voted before

        require(!voters[voters_Count]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[voters_Count] = true;
        countResult++;
        // update candidate vote Count
        candidates[_candidateId].voteCount++;
        

        // trigger voted event
        emit votedEvent(_candidateId);
    }
    
    function endVote()public inState(State.Voting) {
        state = State.Ended;
        finalResult = countResult; //move result from private countResult to public finalResult
        emit voteEnded(finalResult);
        
    }
    
    
    // Added functions
    
    function GetWinner() public view inState(State.Ended) returns(string memory){
        string memory winnername = declarewinner();
        return winnername;
    }
    
    // This private functions is just to ensure security
    
    function declarewinner() private view returns(string memory){
        uint temp = 0;
        string memory winnername;
        for(uint i=1;i<=candidatesCount;i++){
            if(candidates[i].voteCount > temp){
                temp = candidates[i].voteCount;
                winnername = candidates[i].party;
            }
        }// likewise you can add condition for equal votecounts
        
        return winnername;
    }
}