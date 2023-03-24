import Principal "mo:base/Principal";
import Hash "mo:base/Hash";
import HashMap "mo:base/HashMap"

actor Token {
    var owner : Principal = Principal.fromText("r2k2m-xatya-dlzlt-5rotj-3d7mm-i6r3j-ib5cb-jttyo-dnmkw-bti42-fqe");
    var totalSupply : Nat = 1000000000;
    var symbol : Text = "MRX";

    var balances = HashMap.HashMap<Principal, Nat>(1, Principal.equal, Principal.hash);

    balances.put(owner, totalSupply);

    public query func balancOf(who: Principal) : async Nat {
        let balance : Nat = switch (balances.get(who)) {
            case null 0;
            case (?result) result;
        };

        return balance;
    }
};