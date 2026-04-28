/// Describes a choice in a Poll object.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// PollOption.mo

module {
    public type PollOption = {
        /// The text of a poll choice.
        label_ : Text;
        /// Position of this choice in the poll.
        position : Int;
        /// Number of users who voted for this choice.
        votes : Int;
    };

    public module JSON {
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
};
