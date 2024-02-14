import List "mo:base/List";
import Option "mo:base/Option";
import Trie "mo:base/Trie";
import Nat32 "mo:base/Nat32";
import Text "mo:base/Text";



import Array "mo:base/Array";
actor {

  // Define a simple User type to represent users
type User = {
  id: Nat32;
  role: Text; // e.g., "judge", "magistrate", "investigator"
};

// Define a simple Evidence type to represent uploaded evidence files
type Evidence = {
  id: Nat32;
  filename: Text;
  uploader: Text; // ID of the investigator who uploaded the file
  accessLog: [User];
};

// Maintain a list of evidence files (for simplicity; you might use a persistent storage)
var evidenceFiles : [Evidence] = [];

  public type userId = Nat32;
  public type evidenceId = Nat32;
  private stable var next : userId = 0;
 private stable var users : Trie.Trie<userId, User> = Trie.empty();
 private stable var evidences  : Trie.Trie<evidenceId, Evidence> = Trie.empty();
  
  
  private func key(x : userId) : Trie.Key<userId> {
    return { hash = x; key = x };
  };

   private func key2(x : evidenceId) : Trie.Key<evidenceId> {
    return { hash = x; key = x };
  };
// Function to register a new user
public func registerUser(user: User) : async Bool {
 

    // Use a pattern match to replace the user in the Trie.
    users := Trie.replace(
      users,
      key(user.id),
      Nat32.equal,
      ?user,  // Use ? to indicate an Option type
    ).0;


 return true;
};

// Function to log in a user
public func loginUser(id: Nat32) : async ?User {
   let result = Trie.find(users, key(id), Nat32.equal);
    return result;
};

public func uploadEvidence(evidence: Evidence, uid: Nat32) : async Bool {
   evidences := Trie.replace(
      evidences,
      key2(evidence.id),
      Nat32.equal,
      ?evidence,  // Use ? to indicate an Option type
    ).0;

    return true;
 
};



// Function to get the access log for a specific evidence file
public func getEvidence(evidenceId: Nat32) : async ?Evidence {
    let result = Trie.find(evidences, key(evidenceId), Nat32.equal);
    return result;
};


};