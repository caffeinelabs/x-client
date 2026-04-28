
import { type RulesRequestSummary; JSON = RulesRequestSummary } "./RulesRequestSummary";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// RulesResponseMetadata.mo

module {
    public type RulesResponseMetadata = {
        /// The next token.
        next_token : ?Text;
        /// Number of Rules in result set.
        result_count : ?Int;
        sent : Text;
        summary : ?RulesRequestSummary;
    };

    public module JSON {
        public func toCandidValue(value : RulesResponseMetadata) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.next_token) {
                case (?v__) List.add(buf, ("next_token", #Text(v__)));
                case null ();
            };
            switch (value.result_count) {
                case (?v__) List.add(buf, ("result_count", #Int(v__)));
                case null ();
            };
            List.add(buf, ("sent", #Text(value.sent)));
            switch (value.summary) {
                case (?v__) List.add(buf, ("summary", RulesRequestSummary.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?RulesResponseMetadata =
            switch (candid) {
                case (#Record(fields)) {
                    let next_token : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "next_token")) {
                        case (?next_token_field) ((switch (next_token_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let result_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "result_count")) {
                        case (?result_count_field) ((switch (result_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let ?sent_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "sent") else return null;
                    let ?sent = ((switch (sent_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let summary : ?RulesRequestSummary = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "summary")) {
                        case (?summary_field) (RulesRequestSummary.fromCandidValue(summary_field.1));
                        case null null;
                    };
                    ?{
                        next_token;
                        result_count;
                        sent;
                        summary;
                    };
                };
                case _ null;
            };
    };
};
