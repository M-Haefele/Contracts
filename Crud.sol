
    function read(uint id) view public returns(uint, string memory ){
        for(uint i = 0; i < users.length; i++){
            if(users[i].id == id){
                return(users[i].id, users[i].name);
            }
        }
    }

    function update(uint id, string memory name) public{
        for(uint i = 0; i < users.length; i++){
            if(users[i].id == id){
               users[i].name = name;
            }
        }
    }

    function remove(uint id) public {
        delete users[id];
    }

}

