import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetEditControls.mo

module {
    public type TweetEditControls = {
        /// Time when Tweet is no longer editable.
        editable_until : Text;
        /// Number of times this Tweet can be edited.
        edits_remaining : Int;
        /// Indicates if this Tweet is eligible to be edited.
        is_edit_eligible : Bool;
    };

    public module JSON {
        public func toCandidValue(value : TweetEditControls) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("editable_until", #Text(value.editable_until)));
            List.add(buf, ("edits_remaining", #Int(value.edits_remaining)));
            List.add(buf, ("is_edit_eligible", #Bool(value.is_edit_eligible)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetEditControls =
            switch (candid) {
                case (#Record(fields)) {
                    let ?editable_until_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "editable_until") else return null;
                    let ?editable_until = ((switch (editable_until_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?edits_remaining_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "edits_remaining") else return null;
                    let ?edits_remaining = ((switch (edits_remaining_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?is_edit_eligible_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "is_edit_eligible") else return null;
                    let ?is_edit_eligible = ((switch (is_edit_eligible_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    ?{
                        editable_until;
                        edits_remaining;
                        is_edit_eligible;
                    };
                };
                case _ null;
            };
    };
};
