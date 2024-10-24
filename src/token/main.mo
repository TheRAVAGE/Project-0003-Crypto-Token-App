import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Text "mo:base/Text";
import Debug "mo:base/Debug";

actor Token {

    var owner : Principal = Principal.fromText("ctmj2-7cxem-j7gff-ce4e7-hshgv-tnmuu-f7jrz-zact5-hbbjz-rqsxu-sqe");
    var totalSupply : Nat = 1000000000; 
    var symbol : Text = "RAV";

    var balances = HashMap.HashMap<Principal, Nat>(1, Principal.equal, Principal.hash);

    balances.put(owner, totalSupply);

    public query func balanceOf(who: Principal) : async Nat {

        let balance : Nat = switch (balances.get(who)) {
            case null 0;
            case (?result) result;
        };

        return balance;
    };

    public query func getSymbol() : async Text {
        return symbol;
    };

    public shared(msg) func payOut() : async Text {
        Debug.print(debug_show(msg.caller));
        if (balances.get(msg.caller) == null) {
            let amount = 10000;
            balances.put(msg.caller, amount);
            return "SUCCESS!!";
        } else {
            return "Already Claimed!!"
        }
    }
};