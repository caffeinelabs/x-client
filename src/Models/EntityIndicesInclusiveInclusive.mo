/// Represent a boundary range (start and end index) for a recognized entity (for example a hashtag or a mention). `start` must be smaller than `end`.  The start index is inclusive, the end index is inclusive.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Int "mo:core/Int";

// EntityIndicesInclusiveInclusive.mo

module {
    public type EntityIndicesInclusiveInclusive = {
        /// Index (zero-based) at which position this entity ends.  The index is inclusive.
        end : Nat;
        /// Index (zero-based) at which position this entity starts.  The index is inclusive.
        start : Nat;
    };

    public module JSON {
        public func toCandidValue(value : EntityIndicesInclusiveInclusive) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("end", #Nat(value.end)));
            List.add(buf, ("start", #Nat(value.start)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?EntityIndicesInclusiveInclusive =
            switch (candid) {
                case (#Record(fields)) {
                    let ?end_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "end") else return null;
                    let ?end = ((switch (end_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null })) else return null;
                    let ?start_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "start") else return null;
                    let ?start = ((switch (start_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null })) else return null;
                    ?{
                        end;
                        start;
                    };
                };
                case _ null;
            };
    };
};
