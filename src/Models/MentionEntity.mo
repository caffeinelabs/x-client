import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Int "mo:core/Int";

// MentionEntity.mo

module {
    public type MentionEntity = {
        /// Index (zero-based) at which position this entity ends.  The index is exclusive.
        end : Nat;
        /// Index (zero-based) at which position this entity starts.  The index is inclusive.
        start : Nat;
        /// Unique identifier of this User. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        id : ?Text;
        /// The X handle (screen name) of this user.
        username : Text;
    };

    public module JSON {
        public func toCandidValue(value : MentionEntity) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("end", #Nat(value.end)));
            List.add(buf, ("start", #Nat(value.start)));
            switch (value.id) {
                case (?v__) List.add(buf, ("id", #Text(v__)));
                case null ();
            };
            List.add(buf, ("username", #Text(value.username)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?MentionEntity =
            switch (candid) {
                case (#Record(fields)) {
                    let ?end_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "end") else return null;
                    let ?end = ((switch (end_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null })) else return null;
                    let ?start_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "start") else return null;
                    let ?start = ((switch (start_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null })) else return null;
                    let id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id")) {
                        case (?id_field) ((switch (id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?username_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "username") else return null;
                    let ?username = ((switch (username_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        end;
                        start;
                        id;
                        username;
                    };
                };
                case _ null;
            };
    };
};
