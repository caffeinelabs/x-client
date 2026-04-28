/// A user-provided stream filtering rule.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// RuleNoId.mo

module {
    public type RuleNoId = {
        /// A tag meant for the labeling of user provided rules.
        tag : ?Text;
        /// The filterlang value of the rule.
        value : Text;
    };

    public module JSON {
        public func toCandidValue(value : RuleNoId) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.tag) {
                case (?v__) List.add(buf, ("tag", #Text(v__)));
                case null ();
            };
            List.add(buf, ("value", #Text(value.value)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?RuleNoId =
            switch (candid) {
                case (#Record(fields)) {
                    let tag : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tag")) {
                        case (?tag_field) ((switch (tag_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?value_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "value") else return null;
                    let ?value = ((switch (value_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        tag;
                        value;
                    };
                };
                case _ null;
            };
    };
};
