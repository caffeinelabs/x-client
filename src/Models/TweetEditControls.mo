import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

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
        // `init` constructs a TweetEditControls from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetEditControls.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            editable_until : Text;
            edits_remaining : Int;
            is_edit_eligible : Bool;
        }) : TweetEditControls {
            let ?res = from_candid(to_candid(required)) : ?TweetEditControls else Runtime.unreachable();
            res
        };

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
