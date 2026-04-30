/// Describes a choice in a Poll object.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// PollOption.mo

module {
    /// The required-fields slice of PollOption — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The text of a poll choice.
        label_ : Text;
        /// Position of this choice in the poll.
        position : Int;
        /// Number of users who voted for this choice.
        votes : Int;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express PollOption as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type PollOption = Required and Optional;

    public module JSON {
        // `init` constructs a PollOption from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { PollOption.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : PollOption {
            let ?res = from_candid(to_candid(required)) : ?PollOption else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : PollOption) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("label", #Text(value.label_)));
            List.add(buf, ("position", #Int(value.position)));
            List.add(buf, ("votes", #Int(value.votes)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?PollOption =
            switch (candid) {
                case (#Record(fields)) {
                    let ?label__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "label") else return null;
                    let ?label_ = ((switch (label__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?position_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "position") else return null;
                    let ?position = ((switch (position_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?votes_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "votes") else return null;
                    let ?votes = ((switch (votes_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    ?{
                        label_;
                        position;
                        votes;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
