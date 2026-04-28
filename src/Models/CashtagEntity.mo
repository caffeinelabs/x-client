import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Int "mo:core/Int";

// CashtagEntity.mo

module {
    public type CashtagEntity = {
        /// Index (zero-based) at which position this entity ends.  The index is exclusive.
        end : Nat;
        /// Index (zero-based) at which position this entity starts.  The index is inclusive.
        start : Nat;
        tag : Text;
    };

    public module JSON {
        public func toCandidValue(value : CashtagEntity) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("end", #Nat(value.end)));
            List.add(buf, ("start", #Nat(value.start)));
            List.add(buf, ("tag", #Text(value.tag)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CashtagEntity =
            switch (candid) {
                case (#Record(fields)) {
                    let ?end_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "end") else return null;
                    let ?end = ((switch (end_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null })) else return null;
                    let ?start_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "start") else return null;
                    let ?start = ((switch (start_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null })) else return null;
                    let ?tag_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tag") else return null;
                    let ?tag = ((switch (tag_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        end;
                        start;
                        tag;
                    };
                };
                case _ null;
            };
    };
};
